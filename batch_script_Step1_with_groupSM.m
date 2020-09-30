%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%% Group ICA main function with prior group-level maps as guidance 
%%%% Written by Yiheng Tu and Zening Fu
%%%% Date: 7/8/2020
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%% Important notes
%%%% Need to revise according to your data: this means that you need to adjust according to your data


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Enter the values for the variables required for the ICA analysis.
% Variables are on the left and the values are on the right.
% Characters must be enterd in single quotes

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%v%%%%%%%%%%%%%%%%
%% Modality. Options are fMRI and EEG
modalityType = 'fMRI';

%% Enter directory to put results of analysis
outputDir = 'D:\Demo';

%% Enter Name (Prefix) Of Output Files
prefix = 'Demo';

%% There are four ways to enter the subject data
% options are 1, 2, 3 or 4
dataSelectionMethod = 4;

%%%%%%%%%%%%%%%%%%%%%%%%% Start for Method 4 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Input data file pattern for data-sets must be in a cell array. The no. of columns of cell array correspond to no. of subjects
% and rows correspond to sessions. 


% Enter TR in seconds. If TRs vary across subjects, TR must be a row vector of length equal to the number of subjects.
TR = 3;

% input data
functional_main = '\*.nii';
sub_name = dir(functional_main);
Sub = length(sub_name); % number of subjects
for s_sub = 1:Sub
    temp_file = sprintf('\\%s',sub_name(s_sub).name); % functional image folder
    input_data_file_patterns(1,s_sub) = {temp_file};
end


    
dummy_scans = 0;
%%%%%%%%%%%%%%%%%%%%%%%%% End for Method 4 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Group ica type
% Options are spatial or temporal for fMRI modality. By default, spatial
% ica is run if not specified.
group_ica_type = 'spatial';

%% Parallel info
% enter mode serial or parallel. If parallel, enter number of
% sessions/workers to do job in parallel
parallel_info.mode = 'parallel';
parallel_info.num_workers = 4;

%% 'Which ICA Algorithm Do You Want To Use';
% see icatb_icaAlgorithm for details or type icatb_icaAlgorithm at the
% command prompt.
% Note: Use only one subject and one session for Semi-blind ICA. Also specify atmost two reference function names
% 1 - Infomax?
% 2 - FastICA?
% 3 - ERICA?
% 4 - SIMBEC?
% 5 - EVD?
% 6 - JADE OPAC?
% 7 - AMUSE?
% 8 - SDD ICA?
% 9 - Semi-blind ICA?
% 10 - Constrained ICA (Spatial)?
% 11 - Radical ICA?
% 12 - Combi?
% 13 - ICA-EBM?
% 14 - ERBM?
% 15 - IVA-GL?
% 16 - MOO-ICAR?
% if you only need to use group map to reconstruct subject map, input
% should be set as 'gig-ica'.
algoType = 'gig-ica';

%% Data Pre-processing options
% 1 - Remove mean per time point
% 2 - Remove mean per voxel
% 3 - Intensity normalization
% 4 - Variance normalization
preproc_type = 4;

%% Enter location (full file path) of the image file to use as mask
% or use Default mask which is []
maskFile=[];
%% Scale the Results. Options are 0, 1, 2
% 0 - No scaling
% 1 - Scale components to percent signal change
% 2 - Z-scores
% 3 - Scaling in timecourses
% 4 - Scaling in maps and timecourses
scaleType = 2;


%% RUN ICA    Group PCA performance settings. Best setting for each option will be selected based on variable MAX_AVAILABLE_RAM in icatb_defaults.m. 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% If you have selected option 3 (user specified settings) you need to manually set the PCA options. 
% Options are:
% 1 - Maximize Performance
% 2 - Less Memory Usage
% 3 - User Specified Settings
perfType = 3;

%% Specify spatial reference files for constrained ICA (spatial) or gig-ica
% the spatial map derived from HCP and GSP for spatially constraint ICA can be requested from V.C. (vcalhoun@gsu.edu) 
refFiles = {'D:\Demo\NetworkTemplate_High_VarNor.nii'};  



