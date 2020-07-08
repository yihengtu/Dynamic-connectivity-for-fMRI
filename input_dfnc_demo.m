%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%% Set up parameters for running dFNC 
%%%% Written by Yiheng Tu and Zening Fu
%%%% Date: 7/8/2020
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%% Important notes
%%%% Need to revise according to your data: this means that you need to adjust according to your data
%%%% Use full path for directories and files wherever needed. After entering parameters, use command icatb_dfnc_batch(input_file);

%% Output directory to place results 
outputDir = 'D:\Demo\DFC_119_w20_less';

%% ICA parameter file 
ica_param_file = 'D:\Demo\LBP_ica_parameter_info.mat';


%% Cell array of dimensions number of network names by 2. Don't duplicate components in different
% network names
comp_network_names = {'SM', [];                   
                      'DM', [];                   
                      'SC', [];   
                      'CC', [];
                      'VS', [];        
                      'AD', []; 
                      };     


%% TR of the experiment

TR = [];

%% dFNC params

% 1. tc_detrend - Detrend number used to remove the trends in timecourses.
% Options are 0, 1, 2 and 3.
% 2. tc_despike - Remove spikes from the timecourses. Options are 'yes' and
% 'no'.
% 3. tc_filter - High frequency cutoff.

% 4. a. tc_covariates.filesList - Include character array or cell array of
% covariates to be regressed out from the timecourses. Cell array is of
% length number of subjects * sessions by 1. The order of file names will be
% first subject sessions followed by second subject sessions and so on.
%    b.  tc_covariates.file_numbers - Enter scan numbers to include. Leave
%    empty if you want to select all.
%

% 5. Regularisation method - Options are 'none' and 'L1'. 
% 6. wsize - Window size (scans) 
% 7. window_alpha - Gaussian Window alpha value.
% 8. num_repetitions - No. of repetitions (L1 regularisation).

% detrend
dfnc_params.tc_detrend = [];
% despike
dfnc_params.tc_despike = 'yes';
% low-pass filtering
dfnc_params.tc_filter = [];
% regress head motion
dfnc_params.tc_covariates.filesList = [];
dfnc_params.tc_covariates.file_numbers = [];

% regularize method for DFC
dfnc_params.method = 'L1';
% window size (TR)
dfnc_params.wsize = [];
% alpha for Gaussian window
dfnc_params.window_alpha = [];
% repet times for cross validation for regularized term
dfnc_params.num_repetitions = [];

%% Post-processing (K-means on dfnc corrleations, meta state analysis)
% Number of clusters extracted from windowed dfnc correlations using standard dfnc approach
postprocess.num_clusters = [];

