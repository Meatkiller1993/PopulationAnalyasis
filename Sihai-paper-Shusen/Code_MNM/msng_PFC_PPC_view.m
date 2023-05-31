

%% cuerate for PFC
percent=1;
[FR_PFC1,Num1] = part_msng(msng_PFC_new,1,percent);
[FR_PFC2,Num2] = part_msng(msng_PFC_new,2,percent);
[FR_PFC3,Num3] = part_msng(msng_PFC_new,3,percent);
[FR_PFC4,Num4] = part_msng(msng_PFC_new,4,percent);
[FR_PFC5,Num5] = part_msng(msng_PFC_new,5,percent);
[FR_PFC6,Num6] = part_msng(msng_PFC_new,6,percent);
[FR_PFC7,Num7] = part_msng(msng_PFC_new,7,percent);
[FR_PFC8,Num8] = part_msng(msng_PFC_new,8,percent);

[FR_PPC1,Num_PPC1] = part_msng(msng_PPC_new,1,percent);
[FR_PPC2,Num_PPC2] = part_msng(msng_PPC_new,2,percent);
[FR_PPC3,Num_PPC3] = part_msng(msng_PPC_new,3,percent);
[FR_PPC4,Num_PPC4] = part_msng(msng_PPC_new,4,percent);
[FR_PPC5,Num_PPC5] = part_msng(msng_PPC_new,5,percent);
[FR_PPC6,Num_PPC6] = part_msng(msng_PPC_new,6,percent);
[FR_PPC7,Num_PPC7] = part_msng(msng_PPC_new,7,percent);
[FR_PPC8,Num_PPC8] = part_msng(msng_PPC_new,8,percent);




%% data with all three periods included
PFC_cue_delay=[FR_PFC1(:,1)';FR_PFC2(:,1)';FR_PFC3(:,1)';FR_PFC4(:,1)';...
    FR_PFC5(:,1)';FR_PFC6(:,1)';FR_PFC7(:,1)';FR_PFC8(:,1)';...
    FR_PFC1(:,2)';FR_PFC2(:,2)';FR_PFC3(:,2)';FR_PFC4(:,2)';...
    FR_PFC5(:,2)';FR_PFC6(:,2)';FR_PFC7(:,2)';FR_PFC8(:,2)';...
    FR_PFC1(:,3)';FR_PFC2(:,3)';FR_PFC3(:,3)';FR_PFC4(:,3)';...
    FR_PFC5(:,3)';FR_PFC6(:,3)';FR_PFC7(:,3)';FR_PFC8(:,3)'];

PFC_cue_samp=[FR_PFC1(:,1)';FR_PFC2(:,1)';FR_PFC3(:,1)';FR_PFC4(:,1)';...
    FR_PFC5(:,1)';FR_PFC6(:,1)';FR_PFC7(:,1)';FR_PFC8(:,1)';...
    FR_PFC1(:,3)';FR_PFC2(:,3)';FR_PFC3(:,3)';FR_PFC4(:,3)';...
    FR_PFC5(:,3)';FR_PFC6(:,3)';FR_PFC7(:,3)';FR_PFC8(:,3)';...
    FR_PFC1(:,2)';FR_PFC2(:,2)';FR_PFC3(:,2)';FR_PFC4(:,2)';...
    FR_PFC5(:,2)';FR_PFC6(:,2)';FR_PFC7(:,2)';FR_PFC8(:,2)'];

PPC_cue_delay=[FR_PPC1(:,1)';FR_PPC2(:,1)';FR_PPC3(:,1)';FR_PPC4(:,1)';...
    FR_PPC5(:,1)';FR_PPC6(:,1)';FR_PPC7(:,1)';FR_PPC8(:,1)';...
    FR_PPC1(:,2)';FR_PPC2(:,2)';FR_PPC3(:,2)';FR_PPC4(:,2)';...
    FR_PPC5(:,2)';FR_PPC6(:,2)';FR_PPC7(:,2)';FR_PPC8(:,2)';...
    FR_PPC1(:,3)';FR_PPC2(:,3)';FR_PPC3(:,3)';FR_PPC4(:,3)';...
    FR_PPC5(:,3)';FR_PPC6(:,3)';FR_PPC7(:,3)';FR_PPC8(:,3)'];

PPC_cue_samp=[FR_PPC1(:,1)';FR_PPC2(:,1)';FR_PPC3(:,1)';FR_PPC4(:,1)';...
    FR_PPC5(:,1)';FR_PPC6(:,1)';FR_PPC7(:,1)';FR_PPC8(:,1)';...
    FR_PPC1(:,3)';FR_PPC2(:,3)';FR_PPC3(:,3)';FR_PPC4(:,3)';...
    FR_PPC5(:,3)';FR_PPC6(:,3)';FR_PPC7(:,3)';FR_PPC8(:,3)';...
    FR_PPC1(:,2)';FR_PPC2(:,2)';FR_PPC3(:,2)';FR_PPC4(:,2)';...
    FR_PPC5(:,2)';FR_PPC6(:,2)';FR_PPC7(:,2)';FR_PPC8(:,2)'];


%%
for DataPair=1:4


    %================== DATA ANALYSIS PART 1: select a pair of data============

    if DataPair==1          %1:  cue vs delay PFC
        Target_data=PFC_cue_delay;
        Task_name='MSNG-PFC';
        Cond1='Cue';
        Cond2='Delay';
        Region='PFC';

    elseif  DataPair==2     %2: cue vs samp PFC
        Target_data=PFC_cue_samp;
        Task_name='MSNG-PFC';
        Cond1='Cue';
        Cond2='Samp-Match';
        Region='PFC';

    elseif  DataPair==3     %3: cue vs delay PPC
        Target_data=PPC_cue_delay;
        Task_name='MSNG-PPC';
        Cond1='Cue';
        Cond2='Delay';
        Region='PPC';
        
    elseif  DataPair==4     %4: cue vs samp PPC 
    Target_data=PPC_cue_samp;
    Task_name='MSNG-PPC';
    Cond1='Cue';
    Cond2='Samp-Match';
    Region='PPC';
        

    end

    %================== DATA ANALYSIS PART 3: use pca to reduce the dimension ========
    [~, PCA_of_Data] = pca(Target_data);
    [d1,d2]=size(PCA_of_Data);
    Points1=PCA_of_Data(1:8,:);
    Points2=PCA_of_Data(9:16,:);

    %========== DATA ANALYSIS PART 4: 3-D plot and calculate the angel =========

    [ang,good_fit1,good_fit2] = fit_plane_and_plot(Points1,Points2);



    % add legend
    legend(Cond1,Cond2)

    %================== DATA ANALYSIS PART 5: Add title information based on Region =================
    switch Region

            case 'PFC'  

              %title(['Feature: <all cue, match sample>=',num2str(ang,2),' (Post-Ventral, 361 Neurons)'])

              title([Task_name,':', ' \angle(', Cond1,',',Cond2,')=',num2str(ang,2),'^{\circ} (' num2str(length(FR_PFC1)), ' Neurons)'],'Interpreter','tex')
%               view(38.14,29.3)

%               view([-43.37,49.57])

            case 'PPC'  

              title([Task_name,':', ' \angle(', Cond1,',',Cond2,')=',num2str(ang,2),'^{\circ} (' num2str(length(FR_PPC1)), ' Neurons)'],'Interpreter','tex')
%               view([-23.7,37.7])

            
    end

    grid on
    
    shg

end