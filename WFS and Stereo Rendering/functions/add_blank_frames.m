function [x, y] = add_blank_frames(x, y, number_of_speakers)

diff = height(x)-height(y);


if diff>0
    offset_frames = zeros(diff, number_of_speakers);
    y = cat(1, y, offset_frames);

elseif diff<0
    offset_frames = zeros(-diff, number_of_speakers);
    x = cat(1, x, offset_frames);
end