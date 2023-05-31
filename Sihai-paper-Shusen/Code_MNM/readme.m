%{
wrote by Shusen Pu, spu@uwf.edu, last updated on 10/30/2022

To analyze the msng data recorded by 
Sihai Li @Wake Forest University & University of Chicago

run the following code before doing others
step 1: process_data_msng  (collects and processes data)
step 2: msng_PFC_PPC_select_fr8 (select data with more than 8 trials in PFC
and PPC)

%% =========================== Scripts =========================== 

 %% angles using all data 
    >> msng_PFC_PPC_view: view the angles between cue/delay/sample in PFC and
             PPC using all data


%% bootstrap for angles between cue/delay/sample
    >> msng_portion_cells: this code selects a certain percent of data to estimate the distribution
          of the angles 
    >> msng_ang_boot_plot: histogram of bootstrapping angles using a certain
         percentage of cells

%% trajectory of activities in PCA space
    >>find_pca_base_msng: this script finds pca basis matrix using cue/delay/sample for msng data
    >> msng_PFC_PPC_dynmic: find the dynamics using
            -t0=1.2-1+t_wind; t_dynamic=t0:dt:1.2+4;
            - smaller dt will have better resolution; larger t_wind takes more data into
              each point
    >> plot_dynamics_msng: plot the dynamics



%% =========================== Functions =========================== 
    >> part_msng: [FR,Num] = part_msng(data,col,percent)
            -output: firing rates (FR) of cue, delay1 and average numbers of spikes (Num) in each trial 
            -input: data (msng), col (if col=k, kth column index of the data, corresponding to kth location)
             percent is the percentage of data used in each trial

    >> [ang,good_fit1,good_fit2,distPs] = fit_plane_and_plot(Points1,Points2)
        -output: angles between two planes fitted from Points1 and Points2;
                    goodness of fit for two planes, average distances from fitted planes to the
                    original points

%}