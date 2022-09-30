function main()
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
disp('Please choose a directory to read from');

myDir = uigetdir;

mode = questdlg('Which mode would you like to choose?', ...
	'Mode Chooser', ...
	'Colocalization','Peroxisome Density', 'Colocalization');
% Handle response
switch mode
    case 'Colocalization'
        disp([mode ' coming right up.'])
        option = 0;
    case 'Peroxisome Density'
        disp([mode ' coming right up.'])
        option = 1;
    
end

nucAnswer = inputdlg('Enter the nucleus channel:',...
             'Sample', [1 1]);
nucAnswerVal = str2num(nucAnswer{1});
nucChannel = nucAnswerVal(1);

if option == 0
    answer = inputdlg('Enter the two channels to compare, space-separated:',...
             'Sample', [1 3]);

    answerVal = str2num(answer{1});
    channel1 = answerVal(1);
    channel2 = answerVal(2);
    colocalization(myDir, channel1, channel2);
else
    pexAnswer = inputdlg('Enter the nucleus channel:',...
             'Sample', [1 1]);
    pexAnswerVal = str2num(pexAnswer{1});
    pexChannel = pexAnswerVal(1);
    pexDensity(myDir, nucChannel, pexChannel);
end

end

