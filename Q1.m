clc
clear

notes

fs = 44100;
gap = 0.025;

gap_sample = round (fs*gap);
gap_wave = zeros (1,gap_sample);

song = [];
splits = strsplit(noteHarryPotter);
character=["C","C#","D","D#","E","F","F#","G","G#","A","A#","B"];
frequency=[16.352 17.324 18.324 19.445 20.602 21.827 23.125,...
    24.500 25.957 27.500 29.135 30.868];

for i = 1:3:length(splits)-2
    noteName   = splits{i};
    octave     = str2double(splits{i+1});
    dursec     = str2double(splits{i+2});
    
    for j = 1:length(character)
        if noteName == character(j)
            basefrequency = frequency(j);
        end
    end
    fre = basefrequency * 2^octave;
    t = 0 : 1/fs : dursec;
    tone = sin(2*pi*fre*t);
    
    song = [song ,tone ,gap_wave];


end

song =  song / max(abs(song));
audiowrite('noteHarryPotter.wav', song, fs);
