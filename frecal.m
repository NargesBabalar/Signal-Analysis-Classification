clc
clear
path  ="./record/G.wav";
[signal , fs]=audioread(path);

fft = fft(signal);
len = length(signal);
frequency = (0:len-1) * (fs/len);
[~,b] = max(fft);
per=frequency(b);
plot(frequency,abs(fft)/max(abs(fft)));
xlabel("freq")
ylabel("amp")
xlim([0,5700])
amp = [];
fre = [];
for i=1:6
    [amp1,fre1]=max(abs(fft(per*(i-1)+1:per*i))/max(abs(fft)));
    amp = [amp amp1];
    fre = [fre fre1+per*(i-1)+144.486];
end
