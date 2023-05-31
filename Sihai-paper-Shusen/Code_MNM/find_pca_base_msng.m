
%{ 
This script finds pca basis matrix using cue/delay for msng data
modfied 10/30/2022 by Shusen Pu, spu@uwf.edu
%}

%% firing rate for PFC and PPC
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




%% data with from delay1
% can use cue or sample as well 
PFC_delay_all=[FR_PFC1(:,2)';FR_PFC2(:,2)';FR_PFC3(:,2)';FR_PFC4(:,2)';...
    FR_PFC5(:,2)';FR_PFC6(:,2)';FR_PFC7(:,2)';FR_PFC8(:,2)'];

PPC_delay_all=[ FR_PPC1(:,2)';FR_PPC2(:,2)';FR_PPC3(:,2)';FR_PPC4(:,2)';...
    FR_PPC5(:,2)';FR_PPC6(:,2)';FR_PPC7(:,2)';FR_PPC8(:,2)'];


%% get the basis for pca

SelecData=PFC_delay_all;
[coeff,score,latent,tsquared,explained,mu] = pca(SelecData);
        
cent1=SelecData-mean(SelecData,1);
diff1=cent1*coeff-score;

pca_base_PFC=coeff;


SelecData1=PPC_delay_all;
[coeff1,score1,latent1,tsquared1,explained1,mu1] = pca(SelecData1);
        
cent2=SelecData1-mean(SelecData1,1);
diff2=cent2*coeff1-score1;

pca_base_PPC=coeff1;