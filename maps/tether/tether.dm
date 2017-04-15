#if !defined(USING_MAP_DATUM)

	#include "tether-1.dmm"
	#include "tether-2.dmm"
	#include "tether-3.dmm"

	#include "tether_things.dm"
	#include "tether_defines.dm"
	#include "tether_areas.dm"

	#define USING_MAP_DATUM /datum/map/tether

#elif !defined(MAP_OVERRIDE)

	#warn A map has already been included, ignoring Tether

#endif