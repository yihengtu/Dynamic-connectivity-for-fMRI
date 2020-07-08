%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%% Sample script to extract fration rate, dewell time and number of transitions 
%%%% Written by Yiheng Tu and Zening Fu
%%%% Date: 7/8/2020
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear
clc
%% step 1: Calculate mean dewell time and occupancy rate
% load dFC parameter and ICN selected
load 'D:\Demo\DFC_119_w20_less\Demo_dfnc_post_process.mat'
state_count = squeeze(clusterInfo.corrs_states(:,1,:));
FC_state    = squeeze(clusterInfo.states(:,1,:));
[num_Sub, num_State] = size(state_count);
num_Time = size(FC_state,2);

ICN_SM = [];
ICN_DM = [];
ICN_SC = [];
ICN_CC = [];
ICN_VS = [];
ICN_AD = [];
select_ICN = [ICN_SM, ICN_DM, ICN_SC, ICN_CC, ICN_VS, ICN_AD];
ROI = length(select_ICN);

% calculate mean dewell time and occupancy rate/fractional ratio
Fraction_rate = zeros(num_Sub, num_State);
Dewell_time = zeros(num_Sub, num_State);
Num_Transition = zeros(num_Sub, num_State);
for i = 1:num_Sub
    [Fraction_rate(i,:), TM, Dewell_time(i,:), Num_Transition(i,:)] = statevector_stats(FC_state(i,:)', num_State);
end

%% step 2: group difference between two populations

%% step 3: find correlations between dFNC and behaviors

