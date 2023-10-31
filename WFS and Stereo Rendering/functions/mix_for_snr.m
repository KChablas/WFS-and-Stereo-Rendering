function mixed = mix_for_snr(signal, noise, snr, fs, number_of_channels)
speech_level = -20;
signal = desired_db(signal, fs, number_of_channels, speech_level);

desired_noise_db = speech_level - snr;

noise = desired_db(noise, fs, number_of_channels, desired_noise_db);

[signal, noise] = add_blank_frames(signal, noise, number_of_channels);

mixed = signal + noise;
