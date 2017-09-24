% based on https://github.com/jed-frey/matlab_saveppt2
clc
close all;
clear all;

% % % % % % % input section % % % % % % % % %
simStr ='test';

% % % % % % % % % % % % % % % % % % % % % % %

% change this to the saveppt2 path if needed
currPath = pwd;
% use fullfile function to support different OS
srcPath = fullfile(currPath,'/','src');
templatePPT = fullfile(currPath,'/','template','/','template.ppt');

resultPath = fullfile(currPath,'/','result');
addpath(srcPath)

% timeFmt = 'yyyy_mmdd_HHMMSS_';   % without ms
timeFmt = 'yyyymmdd_HHMMSS_FFF';   % with ms
timePrefix = datestr(now,timeFmt,'local');
randStr = sprintf('%03d_',randi([0,999],1));  %random val to avoid colistion
simPostfix = simStr;
filePrefix = [timePrefix, randStr, simPostfix];
pptname = [filePrefix, '.ppt'];
pptFullPath = fullfile(resultPath,'/',pptname);

copyfile(templatePPT,pptFullPath)
disp(['file copied:  ' pptFullPath])

% generate some figures, and close the first one to make sure the fig
% handler is processed properly
for idx = 1:6
    fh(idx)=figure(idx);
    plot(randn(1,10),'b');
    grid on
    titlename={['figure ', num2str(idx)],['2nd line']};
    title(titlename)
    set(fh(idx),'WindowStyle','docked')
end
close(fh(1));
% % % % % % % % %

fighdl = findobj('Type', 'figure'); % find all existing figures
fighdl = sort(fighdl);
for ifig = 1:length(fighdl)
    fh = fighdl(ifig); %get figure handle
    figure(fh)
    set(fh,'WindowStyle','normal')
    set(fh,'Resize','off');
    set(fh,'WindowStyle','docked')
    slideTitle = get(get(gca,'Title'),'String'); % get from figure title
    if iscell(slideTitle)
        slideTitle = slideTitle{1};
    end
    %     set(fh,'units','inches','pos',[0 0 12 4.5]);
    set(fh,'units','inches','pos',[0 0 8 4]);
    legend('Location','Best');
    slideNote = 'This is slides note, can be used to save data extracted from matlab figure';
    saveppt2(pptFullPath, 'title', slideTitle,'scale',true,'stretch',false,'n',slideNote);
    disp(['Added figure ', slideTitle, 'to' pptname])
end

open(pptFullPath)














