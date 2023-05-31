
%{
This is the script to plot trajectory of MSNG PFC and PPC data
written by Shusen Pu  10/14/2022
%}

tic
t_wind=0.250;
dt=0.05;


%     [FR_Mat1,FR_nonMat1,FR_both1,Num_mat1,Num_nonmat1,Num_both1] = partial_spatial(msng_PFC_new,1,percent);
[FR_Mat1,Num_mat1] = dynamic_spa_pre1(msng_PFC_new,1,t_wind,dt);
    
% [FR_Mat2,FR_nonMat2,FR_both2,Num_mat2,Num_nonmat2,Num_both2] = partial_spatial(msng_PFC_new,2,percent);
[FR_Mat2,Num_mat2] = dynamic_spa_pre1(msng_PFC_new,2,t_wind,dt);
    
% [FR_Mat3,FR_nonMat3,FR_both3,Num_mat3,Num_nonmat3,Num_both3] = partial_spatial(msng_PFC_new,3,percent);
[FR_Mat3,Num_mat3] = dynamic_spa_pre1(msng_PFC_new,3,t_wind,dt);
    
% [FR_Mat4,FR_nonMat4,FR_both4,Num_mat4,Num_nonmat4,Num_both4] = partial_spatial(msng_PFC_new,4,percent);
[FR_Mat4,Num_mat4] = dynamic_spa_pre1(msng_PFC_new,4,t_wind,dt);

%     [FR_Mat5,FR_nonMat5,FR_both5,Num_mat5,Num_nonmat5,Num_both5] = partial_spatial(msng_PFC_new,5,percent);
[FR_Mat5,Num_mat5] = dynamic_spa_pre1(msng_PFC_new,5,t_wind,dt);

%     [FR_Mat6,FR_nonMat6,FR_both6,Num_mat6,Num_nonmat6,Num_both6] = partial_spatial(msng_PFC_new,6,percent);
[FR_Mat6,Num_mat6] = dynamic_spa_pre1(msng_PFC_new,6,t_wind,dt);

%     [FR_Mat7,FR_nonMat7,FR_both7,Num_mat7,Num_nonmat7,Num_both7] = partial_spatial(msng_PFC_new,7,percent);
[FR_Mat7,Num_mat7] = dynamic_spa_pre1(msng_PFC_new,7,t_wind,dt);

%     [FR_Mat8,FR_nonMat8,FR_both8,Num_mat8,Num_nonmat8,Num_both8] = partial_spatial(msng_PFC_new,8,percent);
[FR_Mat8,Num_mat8] = dynamic_spa_pre1(msng_PFC_new,8,t_wind,dt);


%%
% trajectories for match and nonmatch trails
t0=1.2-1+t_wind;
t_dynamic=t0:dt:1.2+4;
lent=length(t_dynamic);

cod1_PFC=nan(lent,3);
cod2_PFC=nan(lent,3);
cod3_PFC=nan(lent,3);
cod4_PFC=nan(lent,3);
cod5_PFC=nan(lent,3);
cod6_PFC=nan(lent,3);
cod7_PFC=nan(lent,3);
cod8_PFC=nan(lent,3);


for ik=1:lent
    
   mat_data=[FR_Mat1(:,ik),FR_Mat2(:,ik),FR_Mat3(:,ik),FR_Mat4(:,ik),...
        FR_Mat5(:,ik),FR_Mat6(:,ik),FR_Mat7(:,ik),FR_Mat8(:,ik)];
   SelecData1=mat_data';
   cent2=SelecData1-mean(SelecData1,1);
   cod=cent2*pca_base_PFC;
   
   cod1_PFC(ik,:)=cod(1,1:3);
   cod2_PFC(ik,:)=cod(2,1:3);
   cod3_PFC(ik,:)=cod(3,1:3);
   cod4_PFC(ik,:)=cod(4,1:3);
   cod5_PFC(ik,:)=cod(5,1:3);
   cod6_PFC(ik,:)=cod(6,1:3);
   cod7_PFC(ik,:)=cod(7,1:3);
   cod8_PFC(ik,:)=cod(8,1:3);
  
end

%% PPC
[FR_PPC_Mat1,Num_mat1] = dynamic_spa_pre1(msng_PPC_new,1,t_wind,dt);    
[FR_PPC_Mat2,Num_mat2] = dynamic_spa_pre1(msng_PPC_new,2,t_wind,dt);
[FR_PPC_Mat3,Num_mat3] = dynamic_spa_pre1(msng_PPC_new,3,t_wind,dt);   
[FR_PPC_Mat4,Num_mat4] = dynamic_spa_pre1(msng_PPC_new,4,t_wind,dt);
[FR_PPC_Mat5,Num_mat5] = dynamic_spa_pre1(msng_PPC_new,5,t_wind,dt);
[FR_PPC_Mat6,Num_mat6] = dynamic_spa_pre1(msng_PPC_new,6,t_wind,dt);
[FR_PPC_Mat7,Num_mat7] = dynamic_spa_pre1(msng_PPC_new,7,t_wind,dt);
[FR_PPC_Mat8,Num_mat8] = dynamic_spa_pre1(msng_PPC_new,8,t_wind,dt);

%%

cod1_PPC=nan(lent,3);
cod2_PPC=nan(lent,3);
cod3_PPC=nan(lent,3);
cod4_PPC=nan(lent,3);
cod5_PPC=nan(lent,3);
cod6_PPC=nan(lent,3);
cod7_PPC=nan(lent,3);
cod8_PPC=nan(lent,3);


for ik=1:lent
    
   mat_data=[FR_PPC_Mat1(:,ik),FR_PPC_Mat2(:,ik),FR_PPC_Mat3(:,ik),FR_PPC_Mat4(:,ik),...
        FR_PPC_Mat5(:,ik),FR_PPC_Mat6(:,ik),FR_PPC_Mat7(:,ik),FR_PPC_Mat8(:,ik)];
   SelecData1=mat_data';
   cent2=SelecData1-mean(SelecData1,1);
   cod=cent2*pca_base_PPC;
   
   cod1_PPC(ik,:)=cod(1,1:3);
   cod2_PPC(ik,:)=cod(2,1:3);
   cod3_PPC(ik,:)=cod(3,1:3);
   cod4_PPC(ik,:)=cod(4,1:3);
   cod5_PPC(ik,:)=cod(5,1:3);
   cod6_PPC(ik,:)=cod(6,1:3);
   cod7_PPC(ik,:)=cod(7,1:3);
   cod8_PPC(ik,:)=cod(8,1:3);
  
end


