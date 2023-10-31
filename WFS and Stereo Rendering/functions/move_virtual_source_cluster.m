function source_positions = move_virtual_source_cluster(source_positions, desired_position)
source_positions = cell2mat(source_positions);
for i = 1:height(source_positions)
    source_positions(i, :) = source_positions(i, :) + desired_position;
end
source_positions = mat2cell(source_positions, ones(height(source_positions),1), 3);