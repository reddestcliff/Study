% based on https://github.com/jed-frey/matlab_saveppt2

close all;
clear all;

% % % % % % % input section % % % % % % % % % 
simStr ='test';

% % % % % % % % % % % % % % % % % % % % % % %

% change this to the saveppt2 path if needed
currPath = pwd; 
% use fullfile function to support different OS
srcPath = fullfile(currPath,'/','src')
templatePPT = fullfile(currPath,'/','template','/','template.pptx')

resultPath = fullfile(currPath,'/','result')
addpath(srcPath)

% timeFmt = 'yyyy_mmdd_HHMMSS_';   % without ms
timeFmt = 'yyyymmdd_HHMMSS_FFF';   % with ms
timePrefix = datestr(now,timeFmt,'local')
randStr = sprintf('%03d_',randi([0,999],1));  %random val to avoid colistion
simPostfix = simStr;
filePrefix = [timePrefix, randStr, simPostfix]
pptname = [filePrefix, '.pptx']
pptFullPath = fullfile(resultPath,'/',pptname)

copyfile(templatePPT,pptFullPath)









