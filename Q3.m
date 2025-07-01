clc
clear
[song,fs]=audioread("noteHarryPotter.wav");
round
character=["C","C#","D","D#","E","F","F#","G","G#","A","A#","B"];
frequency=[16.352 17.324 18.324 19.445 20.602 21.827 23.125,...
    24.500 25.957 27.500 29.135 30.868];
mapset=cell (1+7,12);
for i=1:12
        mapset{1,i}=character(i);
        for j=0:6
        mapset{j+2,i}=frequency(i)*2^j;
        end
end
len = length(song);
dursec=[];
octave=[];
noteName =[];
array = song;
i=1;
while length(array)>10
        i=i+1;
        if sum(abs(array(i+1:i+100)))==0
            x = array(1:i);
            dursec=[dursec (round((length(x)/(fs))*10))/10];
            array=array(length(x)+1105:end);
            i=1;
            t = 0 : 1/fs : dursec(end)-1/fs;
            N= length(x);
            fft_signal = fft(x);
            fre = (0:N-1)*(fs/N);
            mag = abs(fft_signal);
            [~,b]=max(mag(1:floor(N/2)));
            freq=fre(b);
            for a=1:12
                for b=2:8
                    if abs(mapset{b,a}-freq)<2
                        octave = [octave b-2] ;
                        noteName = [noteName mapset{1,a}];
                    end
                end
            end
        end
end
notes = [];
for i=1:length(noteName)
    notes = [notes ;[noteName(i) octave(i) dursec(i)] ];
end
notes