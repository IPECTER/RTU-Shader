float GetOutlineMask() {
	float ph = ceil(viewHeight / 1440.0) / viewHeight;
	float pw = ph / aspectRatio;

    int sampleCount = viewHeight >= 720.0 ? 12 : 4;
	
    #ifdef RETRO_FILTER
    ph = RETRO_FILTER_SIZE / viewHeight;
    pw = ph / aspectRatio;
    sampleCount = 4;
    #endif

	float mask = 0.0;
	for (int i = 0; i < sampleCount; i++) {
		vec2 offset = vec2(pw, ph) * outlineOffsets[i];
        for (int j = 0; j < 2; j++){
		    mask += float(texture2D(depthtex0, texCoord + offset).r <
		                  texture2D(depthtex1, texCoord + offset).r);
            offset = -offset;
        }
	}

	return float(mask > 0.5);
}