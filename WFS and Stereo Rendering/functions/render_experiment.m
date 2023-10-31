function mixed = render_experiment(array, sources, noises, fs, snr, path, filename, conf)
number_of_speakers = height(array);

speech_audio = [];

for i = 1:height(sources)
    [~, delays, weights, delay_offset] = driving_function_imp_wfs(array, cell2mat(sources(i).position), 'ps', conf);

    audio = delayline(cell2mat(sources(i).signal), delays, weights, conf);
    offset_frames = zeros(round(delay_offset*fs), number_of_speakers);
    audio = cat(1, offset_frames, audio);
    if height(speech_audio)==0
        speech_audio = audio;
    else
        [speech_audio, audio] = add_blank_frames(speech_audio, audio, number_of_speakers);
        speech_audio = speech_audio + audio;
    end
end

noise_audio = [];

for i = 1:height(noises)
    [~, delays, weights, delay_offset] = driving_function_imp_wfs(array, cell2mat(noises(i).position), 'ps', conf);

    audio = delayline(cell2mat(noises(i).signal), delays, weights, conf);
    offset_frames = zeros(round(delay_offset*fs), number_of_speakers);
    audio = cat(1, offset_frames, audio);
    if height(noise_audio)==0
        noise_audio = audio;
    else
        [noise_audio, audio] = add_blank_frames(noise_audio, audio, number_of_speakers);
        noise_audio = noise_audio + audio;
    end
end

start_delay = zeros(1*fs, number_of_speakers);
speech_audio = cat(1, start_delay, speech_audio);


mixed = mix_for_snr(speech_audio, noise_audio, snr, fs, number_of_speakers);

name = string(sprintf('%s%s.wav', path, filename));
audiowrite(name, mixed, fs);
