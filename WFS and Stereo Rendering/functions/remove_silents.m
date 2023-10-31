function x = remove_silents(sig, fs)

clean = detectSpeech(sig,fs,'Window',hann(128,'periodic'),'OverlapLength',64);

x = zeros(sum(clean(:,2)) - sum(clean(:,1)) + height(clean), 1);
index_start = 1;
for i = 1:height(clean)
    index_stop = clean(i,2)-clean(i,1)+index_start;
    x(index_start : index_stop) = sig(clean(i,1):clean(i,2));
    index_start = index_stop+1;
end
