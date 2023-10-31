function packed_signal = pack_signals_positions(signals, positions)
if height(signals) == height(positions)
    pack_struct = struct('signal', [], 'position', []);
    packed_signal(1:height(signals)) = pack_struct;
    for i = 1:height(signals)
        packed_signal(i).signal = signals(i);
        packed_signal(i).position = positions(i);
    end
end