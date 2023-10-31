snr = LOW_SNR;
index = BIG_ANGLE_INDEX;
output_path = 'Sounds/ExperimentSounds/7.Experiment_stereo_big_angle_low_SNR/';

speech_list = dir(fullfile('Sounds/speeches/7.stereo_big_angle_low_SNR', '*.wav'));

for i = 1:height(speech_list)
    noise_file = string(sprintf('Sounds/Resto_snippets/resto%i/ch01_%i.wav', i, i));

    [noise_signal, fs] = audioread(noise_file);
    speech_file = string(sprintf('%s/%s', speech_list(i).folder, speech_list(i).name));
    speech_signal = audioread(speech_file);


    start_delay = zeros(1*fs, 1);
    speech_signal = cat(1, start_delay, speech_signal);


    stereo_noise = stereo_pan(noise_signal, -index);
    stereo_speech = stereo_pan(speech_signal, index);

    mixed = mix_for_snr(stereo_speech, stereo_noise, snr, fs, 2);
    filename = strrep(string(speech_list(i).name), '.wav', '');
    name = string(sprintf('%s%s.wav', output_path, filename));
    audiowrite(name, mixed, fs);
    
end