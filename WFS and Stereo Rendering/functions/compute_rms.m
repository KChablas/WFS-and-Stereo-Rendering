function rms_value = compute_rms(sig, fs, number_of_channels)
values = zeros(1,number_of_channels);
for i = 1:number_of_channels
    sig_no_silents = remove_silents(sig(:,i), fs);
%     values(i) = rms(sig_no_silents);
    values(i) = sqrt(mean(sig_no_silents.^2)); 
end
rms_value = sum(values);
