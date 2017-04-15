//
// Controller handling icon updates of open space turfs
//

/var/global/open_space_initialised = FALSE
/var/global/datum/controller/process/open_space/OS_controller = null

/datum/controller/process/open_space
	var/list/turfs_to_process = list()		// List of turfs queued for update.
	var/list/turfs_to_process_old = null	// List of turfs currently being updated.

/datum/controller/process/open_space/setup()
	. = ..()
	name = "openspace"
	schedule_interval = world.tick_lag // every second
	start_delay = 12
	OS_controller = src
	initialize_open_space()

/datum/controller/process/open_space/copyStateFrom(var/datum/controller/process/open_space/other)
	. = ..()
	OS_controller = src

/datum/controller/process/open_space/doWork()
	// We use a different list so any additions to the update lists during a delay from scheck()
	// don't cause things to be cut from the list without being updated.
	turfs_to_process_old = turfs_to_process
	turfs_to_process = list()

	for(last_object in turfs_to_process_old)
		var/turf/T = last_object
		if(T && !T.gcDestroyed)
			update_turf(T)
		SCHECK

/datum/controller/process/open_space/proc/update_turf(var/turf/T)
	for(var/atom/movable/A in T)
		A.fall()
	T.update_icon()

/datum/controller/process/open_space/proc/add_turf(var/turf/T, var/recursive = 0)
	ASSERT(isturf(T))
	turfs_to_process += T
	if(recursive > 0)
		var/turf/above = GetAbove(T)
		if(above && isopenspace(above))
			add_turf(above, recursive)

// Do the initial updates of open space turfs when the game starts. This will lag!
/datum/controller/process/open_space/proc/initialize_open_space()
	// Do initial setup from bottom to top.
	for(var/zlevel = world.maxz to 1)
		for(var/turf/simulated/open/T in block(locate(1, 1, zlevel), locate(world.maxx, world.maxy, zlevel)))
			add_turf(T)
	open_space_initialised = TRUE

/turf/simulated/open/initialize()
	. = ..()
	if(open_space_initialised)
		OS_controller.add_turf(src)

/turf/Entered(atom/movable/AM)
	. = ..()
	// Update the turf above us (if any)
	// TODO - don't update if its a mob, since thats handled by /obj/zshadow?
	// TODO - Don't update if its a zshadow either?
	// TODO - Don't update if it has invisibility since that doesn't affect it?
	if(open_space_initialised && isobj(AM))
		var/turf/T = GetAbove(src)
		if(T) OS_controller.add_turf(T, 1)

/turf/Exited(atom/movable/AM)
	. = ..()
	if(open_space_initialised && isobj(AM))
		var/turf/T = GetAbove(src)
		if(T) OS_controller.add_turf(T, 1)
