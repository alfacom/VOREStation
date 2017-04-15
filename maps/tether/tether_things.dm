//Simulated
/turf/simulated/floor/outdoors/grass/sif/virgo3b
	oxygen		= 115 * 0.081 //8.10% oxygen
	nitrogen	= 115 * 0.029 //2.90% nitrogen
	phoron 		= 115 * 0.890 //89.0% phoron
	temperature	= 244 //Cold!

/turf/simulated/floor/outdoors/grass/sif/virgo3b/create_fire()
	return 0

/turf/simulated/floor/outdoors/grass/sif/virgo3b/hotspot_expose()
	return 0

/turf/simulated/floor/outdoors/grass/sif/virgo3b/update_graphic(list/graphic_add = null, list/graphic_remove = null)
	return 0

/turf/simulated/open/virgo3b
	oxygen		= 115 * 0.081 //8.10% oxygen
	nitrogen	= 115 * 0.029 //2.90% nitrogen
	phoron 		= 115 * 0.890 //89.0% phoron
	temperature	= 244 //Cold!

/turf/simulated/open/virgo3b/create_fire()
	return 0

/turf/simulated/open/virgo3b/hotspot_expose()
	return 0

/turf/simulated/open/virgo3b/update_graphic(list/graphic_add = null, list/graphic_remove = null)
	return 0

/turf/simulated/floor/outdoors/rocks/virgo3b
	oxygen		= 115 * 0.081 //8.10% oxygen
	nitrogen	= 115 * 0.029 //2.90% nitrogen
	phoron 		= 115 * 0.890 //89.0% phoron
	temperature	= 244 //Cold!

/turf/simulated/floor/outdoors/rocks/virgo3b/create_fire()
	return 0

/turf/simulated/floor/outdoors/rocks/virgo3b/hotspot_expose()
	return 0

/turf/simulated/floor/outdoors/rocks/virgo3b/update_graphic(list/graphic_add = null, list/graphic_remove = null)
	return 0


//Unsimulated
/turf/unsimulated/wall/planetary/sif/virgo3b
	name = "facility wall"
	oxygen		= 115 * 0.081 //8.10% oxygen
	nitrogen	= 115 * 0.029 //2.90% nitrogen
	phoron 		= 115 * 0.890 //89.0% phoron
	temperature	= 244 //Cold!

//Special map objects
/obj/effect/landmark/map_data/virgo3b
    height = 7

/obj/turbolift_map_holder/tether
	name = "Tether Climber"
	depth = 3
	lift_size_x = 4
	lift_size_y = 4
	icon = 'icons/obj/turbolift_preview_5x5.dmi'

	areas_to_use = list(
		/area/turbolift/tether/surface,
		/area/turbolift/tether/transit,
		/area/turbolift/tether/space
		)

/obj/turbolift_map_holder/t_surface
	name = "Surface Turbolift"
	depth = 3
	lift_size_x = 4
	lift_size_y = 4
	icon = 'icons/obj/turbolift_preview_5x5.dmi'

	areas_to_use = list(
		/area/turbolift/t_surface/level1,
		/area/turbolift/t_surface/level2,
		/area/turbolift/t_surface/level3
		)

/obj/turbolift_map_holder/t_station
	name = "Station turbolift"
	depth = 3
	lift_size_x = 4
	lift_size_y = 4
	icon = 'icons/obj/turbolift_preview_5x5.dmi'

	areas_to_use = list(
		/area/turbolift/t_station/level1,
		/area/turbolift/t_station/level2,
		/area/turbolift/t_station/level3
		)
