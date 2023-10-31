snr = HIGH_SNR;
output_path = 'Sounds/ExperimentSounds/1.Experiment_WFS_big_angle_high_SNR/';
filt_name = '../SpectralAnalysis/filter1.mat';
noise_positions = noise_pos();
noise_positions = move_virtual_source_cluster(noise_positions, [-0.13, 0.5, 0]);
speech_position = {[0.13, 0.5, 0]};

speech_list = dir(fullfile('Sounds/speeches/1.WFS_big_angle_high_SNR', '*.wav'));

for i = 1:height(speech_list)
    speech_file = string(sprintf('%s/%s', speech_list(i).folder, speech_list(i).name));
    [y, fs] = audioread(speech_file);
    speech_signal = {y};
    packed_speech = pack_signals_positions(speech_signal, speech_position);
    
    noise_dir = string(sprintf('Sounds/Resto_snippets/resto%i', i));
    noise_list = dir(fullfile(noise_dir, '*.wav'));
    noise_signals = cell(height(noise_list),1);
    for j = 1:height(noise_list)
        noise_file = string(sprintf('%s/%s', noise_list(j).folder, noise_list(j).name));
        y = audioread(noise_file);
        noise_signals(j) = {y};
    end

    packed_noises = pack_signals_positions(noise_signals, noise_positions);
    filename = strrep(string(speech_list(i).name), '.wav', '');
    render_experiment_focused_alternative(array, packed_speech, packed_noises, 44100, snr, output_path, filename, conf);
    
end
