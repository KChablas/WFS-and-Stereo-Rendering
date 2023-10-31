function sig = desired_db(sig, fs, number_of_channels, desired)
rms = compute_rms(sig,fs, number_of_channels);
dbfs = db(rms);
change = desired - dbfs;
sig = change_db(sig, change);
