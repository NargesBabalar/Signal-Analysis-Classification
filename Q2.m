clc
clear

notes
harmonies = xlsread('harmonies.xlsx');

fs = 44100;
gap = 0.025;

gap_sample = round (fs*gap);
gap_wave = zeros (1,gap_sample);

song = [];
splits = strsplit(noteHarryPotter);
character=["C","C#","D","D#","E","F","F#","G","G#","A","A#","B"];

for i = 1:3:length(splits)-2
    noteName   = splits{i};
    octave     = str2double(splits{i+1});
    dursec     = str2double(splits{i+2});
    
    for j = 1:length(character)
        if noteName == character(j)
            index=j;
        end
    end
    t = 0 : 1/fs : dursec;
    tone = 0;
    for k=1:6
        amp = harmonies(index,2*k);
        fre = 2*pi*harmonies(index,2*k-1) * 2^(octave-5);
        tone = tone + amp*sin(fre*t);
    end
    tone = tone.*exp(-7*t);
    song = [song ,tone ,gap_wave];


end

song = song / max(abs(song));
audiowrite('noteOptimized.wav', song, fs);
