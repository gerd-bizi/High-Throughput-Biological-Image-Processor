function [] = colocalization(dirPath, channel1, channel2)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

values = [];

myFiles = dir(fullfile(dirPath, '*.lsm')); %gets all files in path
for k = 1:length(myFiles)
    baseFileName = myFiles(k).name;
    fullFileName = fullfile(dirPath, baseFileName);
    %fprintf(1, 'Now reading %s\n', fullFileName);
    reader = bfGetReader(fullFileName);
    c1Stack = reader.getChannel(channel1);
    c2Stack = reader.getChannel(channel2);
    c1Max = maxZProject(c1Stack);
    c2Max = maxZProject(c2Stack);
    maximum = totalIm(reader);
    vornoi = segmentationEngine(maximum);
    values = [values ; colocalizationEngine(c1Stack, c2Stack, vornoi)];
end

writematrix(values);
fullPath = what(dirPath);
movefile("values.txt", fullPath.path);

%{
%code adapted from https://www.mathworks.com/matlabcentral/answers/398428-how-do-i-get-only-the-subfolders-of-a-folder
% get the folder contents
d = dir(fullfile(dirPath));
% remove all files (isdir property is 0)
dfolders = d([d(:).isdir]);
% remove '.' and '..' 
dfolders = dfolders(~ismember({dfolders(:).name},{'.','..'}));

for i = 1 : length(dfolders)
    colocalization(dfolders(i).name, channel1, channel2);
end
%}

disp("done");

end