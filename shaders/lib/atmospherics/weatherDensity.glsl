#if defined WEATHER_PERBIOME && defined OVERWORLD
float fogDensity = FOG_DENSITY * mix(
	1.0,
	(
		FOG_DENSITY_COLD * isCold +
		FOG_DENSITY_DRY * (isDesert + isMesa + isSavanna) +
		FOG_DENSITY_DAMP * (isSwamp + isMushroom + isJungle)
	) / max(weatherWeight, 0.0001),
	weatherWeight
);

#else
float fogDensity = FOG_DENSITY;
#endif