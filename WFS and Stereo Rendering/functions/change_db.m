function sig = change_db(sig, change)

scaling_factor = 10^(change/20);
sig = sig * scaling_factor;
