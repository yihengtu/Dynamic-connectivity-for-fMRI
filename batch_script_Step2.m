%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%% Batch processing for ICA and dFNC
%%%% Written by Yiheng Tu and Zening Fu
%%%% Date: 7/8/2020
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%% Important notes
%%%% Need to revise according to your data: this means that you need to adjust according to your data
clc
clear
%% run after setting up batch step 1
icatb_read_batch_file('D:\Demo\batch_script_Step1_with_groupSM.m');
icatb_batch_file_run('D:\Demo\batch_script_Step1_with_groupSM.m');

%% run afer setting up dFNC parameters
icatb_dfnc_batch('D:\Demo\input_dfnc_demo.m');