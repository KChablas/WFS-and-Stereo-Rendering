function panned = stereo_pan(audio, index)

pan_index = (index+1)/2;

panned = [audio*(pan_index), audio*(1-pan_index)];