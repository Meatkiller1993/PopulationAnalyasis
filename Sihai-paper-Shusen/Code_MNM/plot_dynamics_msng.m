
%% PFC: projection on pca1 and pca2
cmap1=linspace(1,0.2,8)';cmap2=0.2*ones(8,1);cmap3=linspace(0.2,1,8)';

cmap=[cmap1,cmap2,cmap3];

figure
hold on

plot3(cod1_PFC(:,1),cod1_PFC(:,2),t_dynamic,'-','Color',cmap(1,:),'LineWidth',1.5,'MarkerSize',8)
plot3(cod2_PFC(:,1),cod2_PFC(:,2),t_dynamic,'-','Color',cmap(2,:),'LineWidth',1.5,'MarkerSize',8)
plot3(cod3_PFC(:,1),cod3_PFC(:,2),t_dynamic,'-','Color',cmap(3,:),'LineWidth',1.5,'MarkerSize',8)
plot3(cod4_PFC(:,1),cod4_PFC(:,2),t_dynamic,'-','Color',cmap(4,:),'LineWidth',1.5,'MarkerSize',8)
plot3(cod5_PFC(:,1),cod5_PFC(:,2),t_dynamic,'-','Color',cmap(5,:),'LineWidth',1.5,'MarkerSize',8)
plot3(cod6_PFC(:,1),cod6_PFC(:,2),t_dynamic,'-','Color',cmap(6,:),'LineWidth',1.5,'MarkerSize',8)
plot3(cod7_PFC(:,1),cod7_PFC(:,2),t_dynamic,'-','Color',cmap(7,:),'LineWidth',1.5,'MarkerSize',8)
plot3(cod8_PFC(:,1),cod8_PFC(:,2),t_dynamic,'-','Color',cmap(8,:),'LineWidth',1.5,'MarkerSize',8)


grid on
set(gca,'FontSize',15)

rotate3d on
xlabel('PC1'),ylabel('PC2'),zlabel('time')
title('PFC')
colormap(cmap)
cb=colorbar;
cb.TickLabelInterpreter='latex';
cb.Ticks=[0.02,0.25,0.5,0.75,0.98];
cb.TickLabels={'$L_1$','$\vdots$','$L_{4}$','$\vdots$','$L_{8}$'};


%% PPC: projection on pca1 and pca2

figure
hold on

plot3(cod1_PPC(:,1),cod1_PPC(:,2),t_dynamic,'-','Color',cmap(1,:),'LineWidth',1.5,'MarkerSize',8)
plot3(cod2_PPC(:,1),cod2_PPC(:,2),t_dynamic,'-','Color',cmap(2,:),'LineWidth',1.5,'MarkerSize',8)
plot3(cod3_PPC(:,1),cod3_PPC(:,2),t_dynamic,'-','Color',cmap(3,:),'LineWidth',1.5,'MarkerSize',8)
plot3(cod4_PPC(:,1),cod4_PPC(:,2),t_dynamic,'-','Color',cmap(4,:),'LineWidth',1.5,'MarkerSize',8)
plot3(cod5_PPC(:,1),cod5_PPC(:,2),t_dynamic,'-','Color',cmap(5,:),'LineWidth',1.5,'MarkerSize',8)
plot3(cod6_PPC(:,1),cod6_PPC(:,2),t_dynamic,'-','Color',cmap(6,:),'LineWidth',1.5,'MarkerSize',8)
plot3(cod7_PPC(:,1),cod7_PPC(:,2),t_dynamic,'-','Color',cmap(7,:),'LineWidth',1.5,'MarkerSize',8)
plot3(cod8_PPC(:,1),cod8_PPC(:,2),t_dynamic,'-','Color',cmap(8,:),'LineWidth',1.5,'MarkerSize',8)


grid on
set(gca,'FontSize',15)

rotate3d on
xlabel('PC1'),ylabel('PC2'),zlabel('time')
title('PPC')
colormap(cmap)
cb=colorbar;
cb.TickLabelInterpreter='latex';
cb.Ticks=[0.02,0.25,0.5,0.75,0.98];
cb.TickLabels={'$L_1$','$\vdots$','$L_{4}$','$\vdots$','$L_{8}$'};

%%
%% PFC vs PPC : projection on pca1 and pca2
cmap1=linspace(1,0.2,8)';cmap2=0.2*ones(8,1);cmap3=linspace(0.2,1,8)';

cmap=[cmap1,cmap2,cmap3];

figure
hold on

plot3(cod1_PFC(:,1),cod1_PFC(:,2),t_dynamic,'-','Color',cmap(1,:),'LineWidth',1.5,'MarkerSize',8)
plot3(cod2_PFC(:,1),cod2_PFC(:,2),t_dynamic,'-','Color',cmap(2,:),'LineWidth',1.5,'MarkerSize',8)
plot3(cod3_PFC(:,1),cod3_PFC(:,2),t_dynamic,'-','Color',cmap(3,:),'LineWidth',1.5,'MarkerSize',8)
plot3(cod4_PFC(:,1),cod4_PFC(:,2),t_dynamic,'-','Color',cmap(4,:),'LineWidth',1.5,'MarkerSize',8)
plot3(cod5_PFC(:,1),cod5_PFC(:,2),t_dynamic,'-','Color',cmap(5,:),'LineWidth',1.5,'MarkerSize',8)
plot3(cod6_PFC(:,1),cod6_PFC(:,2),t_dynamic,'-','Color',cmap(6,:),'LineWidth',1.5,'MarkerSize',8)
plot3(cod7_PFC(:,1),cod7_PFC(:,2),t_dynamic,'-','Color',cmap(7,:),'LineWidth',1.5,'MarkerSize',8)
plot3(cod8_PFC(:,1),cod8_PFC(:,2),t_dynamic,'-','Color',cmap(8,:),'LineWidth',1.5,'MarkerSize',8)

plot3(cod1_PPC(:,1),cod1_PPC(:,2),t_dynamic,'--','Color',cmap(1,:),'LineWidth',1.5,'MarkerSize',8)
plot3(cod2_PPC(:,1),cod2_PPC(:,2),t_dynamic,'--','Color',cmap(2,:),'LineWidth',1.5,'MarkerSize',8)
plot3(cod3_PPC(:,1),cod3_PPC(:,2),t_dynamic,'--','Color',cmap(3,:),'LineWidth',1.5,'MarkerSize',8)
plot3(cod4_PPC(:,1),cod4_PPC(:,2),t_dynamic,'--','Color',cmap(4,:),'LineWidth',1.5,'MarkerSize',8)
plot3(cod5_PPC(:,1),cod5_PPC(:,2),t_dynamic,'--','Color',cmap(5,:),'LineWidth',1.5,'MarkerSize',8)
plot3(cod6_PPC(:,1),cod6_PPC(:,2),t_dynamic,'--','Color',cmap(6,:),'LineWidth',1.5,'MarkerSize',8)
plot3(cod7_PPC(:,1),cod7_PPC(:,2),t_dynamic,'--','Color',cmap(7,:),'LineWidth',1.5,'MarkerSize',8)
plot3(cod8_PPC(:,1),cod8_PPC(:,2),t_dynamic,'--','Color',cmap(8,:),'LineWidth',1.5,'MarkerSize',8)


grid on
set(gca,'FontSize',15)

rotate3d on
xlabel('PC1'),ylabel('PC2'),zlabel('time')
title('PFC(solid) vs PPC(dashed)')
colormap(cmap)
cb=colorbar;
cb.TickLabelInterpreter='latex';
cb.Ticks=[0.02,0.25,0.5,0.75,0.98];
cb.TickLabels={'$L_1$','$\vdots$','$L_{4}$','$\vdots$','$L_{8}$'};


%% compare normalized distances in PFC and PPC

[dist_PFC_1,dist_PFC_2,dist_PFC_3,dist_PFC_4,dist_PFC_5,dist_PFC_6,dist_PFC_7,dist_PFC_8] = norm_dist_dynamics(t_dynamic,...
    cod1_PFC,cod2_PFC,cod3_PFC,cod4_PFC,cod5_PFC,cod6_PFC,cod7_PFC,cod8_PFC);



[dist_PPC_1,dist_PPC_2,dist_PPC_3,dist_PPC_4,dist_PPC_5,dist_PPC_6,dist_PPC_7,dist_PPC_8] = norm_dist_dynamics(t_dynamic,...
    cod1_PPC,cod2_PPC,cod3_PPC,cod4_PPC,cod5_PPC,cod6_PPC,cod7_PPC,cod8_PPC);


% % normalize the distances with the mean in the fixation
%     dist_PFC_1=(dist_PFC_1-mean(dist_PFC_1(1:N_fix)))/mean(dist_PFC_1(1:N_fix)); 
%     dist_PFC_2=(dist_PFC_2-mean(dist_PFC_2(1:N_fix)))/mean(dist_PFC_2(1:N_fix)); 
%     dist_PFC_3=(dist_PFC_3-mean(dist_PFC_3(1:N_fix)))/mean(dist_PFC_3(1:N_fix)); 
%     dist_PFC_4=(dist_PFC_4-mean(dist_PFC_4(1:N_fix)))/mean(dist_PFC_4(1:N_fix)); 
%     dist_PFC_5=(dist_PFC_5-mean(dist_PFC_5(1:N_fix)))/mean(dist_PFC_5(1:N_fix)); 
%     dist_PFC_6=(dist_PFC_6-mean(dist_PFC_6(1:N_fix)))/mean(dist_PFC_6(1:N_fix)); 
%     dist_PFC_7=(dist_PFC_7-mean(dist_PFC_7(1:N_fix)))/mean(dist_PFC_7(1:N_fix)); 
%     dist_PFC_8=(dist_PFC_8-mean(dist_PFC_8(1:N_fix)))/mean(dist_PFC_8(1:N_fix)); 
%     
%     dist_PPC_1=(dist_PPC_1-mean(dist_PPC_1(1:N_fix)))/mean(dist_PPC_1(1:N_fix)); 
%     dist_PPC_2=(dist_PPC_2-mean(dist_PPC_2(1:N_fix)))/mean(dist_PPC_2(1:N_fix)); 
%     dist_PPC_3=(dist_PPC_3-mean(dist_PPC_3(1:N_fix)))/mean(dist_PPC_3(1:N_fix)); 
%     dist_PPC_4=(dist_PPC_4-mean(dist_PPC_4(1:N_fix)))/mean(dist_PPC_4(1:N_fix)); 
%     dist_PPC_5=(dist_PPC_5-mean(dist_PPC_5(1:N_fix)))/mean(dist_PPC_5(1:N_fix)); 
%     dist_PPC_6=(dist_PPC_6-mean(dist_PPC_6(1:N_fix)))/mean(dist_PPC_6(1:N_fix)); 
%     dist_PPC_7=(dist_PPC_7-mean(dist_PPC_7(1:N_fix)))/mean(dist_PPC_7(1:N_fix)); 
%     dist_PPC_8=(dist_PPC_8-mean(dist_PPC_8(1:N_fix)))/mean(dist_PPC_8(1:N_fix)); 

% centeralized the data with z-score
    
%     dist_PFC_1=(dist_PFC_1-mean(dist_PFC_1))/std(dist_PFC_1); 
%     dist_PFC_2=(dist_PFC_2-mean(dist_PFC_2))/std(dist_PFC_2); 
%     dist_PFC_3=(dist_PFC_3-mean(dist_PFC_3))/std(dist_PFC_3); 
%     dist_PFC_4=(dist_PFC_4-mean(dist_PFC_4))/std(dist_PFC_4); 
%     dist_PFC_5=(dist_PFC_5-mean(dist_PFC_5))/std(dist_PFC_5); 
%     dist_PFC_6=(dist_PFC_6-mean(dist_PFC_6))/std(dist_PFC_6); 
%     dist_PFC_7=(dist_PFC_7-mean(dist_PFC_7))/std(dist_PFC_7); 
%     dist_PFC_8=(dist_PFC_8-mean(dist_PFC_8))/std(dist_PFC_8); 
%     
%     dist_PPC_1=(dist_PPC_1-mean(dist_PPC_1))/std(dist_PPC_1); 
%     dist_PPC_2=(dist_PPC_2-mean(dist_PPC_2))/std(dist_PPC_2); 
%     dist_PPC_3=(dist_PPC_3-mean(dist_PPC_3))/std(dist_PPC_3); 
%     dist_PPC_4=(dist_PPC_4-mean(dist_PPC_4))/std(dist_PPC_4); 
%     dist_PPC_5=(dist_PPC_5-mean(dist_PPC_5))/std(dist_PPC_5); 
%     dist_PPC_6=(dist_PPC_6-mean(dist_PPC_6))/std(dist_PPC_6); 
%     dist_PPC_7=(dist_PPC_7-mean(dist_PPC_7))/std(dist_PPC_7); 
%     dist_PPC_8=(dist_PPC_8-mean(dist_PPC_8))/std(dist_PPC_8); 


figure
hold on
plot(t_dynamic,dist_PFC_1,'-','Color',cmap(1,:),'LineWidth',1.5)
plot(t_dynamic,dist_PFC_2,'-','Color',cmap(2,:),'LineWidth',1.5)
plot(t_dynamic,dist_PFC_3,'-','Color',cmap(3,:),'LineWidth',1.5)
plot(t_dynamic,dist_PFC_4,'-','Color',cmap(4,:),'LineWidth',1.5)
plot(t_dynamic,dist_PFC_5,'-','Color',cmap(5,:),'LineWidth',1.5)
plot(t_dynamic,dist_PFC_6,'-','Color',cmap(6,:),'LineWidth',1.5)
plot(t_dynamic,dist_PFC_7,'-','Color',cmap(7,:),'LineWidth',1.5)
plot(t_dynamic,dist_PFC_8,'-','Color',cmap(8,:),'LineWidth',1.5)
title('PFC')

figure
hold on
plot(t_dynamic,dist_PPC_1,'-','Color',cmap(1,:),'LineWidth',1.5)
plot(t_dynamic,dist_PPC_2,'-','Color',cmap(2,:),'LineWidth',1.5)
plot(t_dynamic,dist_PPC_3,'-','Color',cmap(3,:),'LineWidth',1.5)
plot(t_dynamic,dist_PPC_4,'-','Color',cmap(4,:),'LineWidth',1.5)
plot(t_dynamic,dist_PPC_5,'-','Color',cmap(5,:),'LineWidth',1.5)
plot(t_dynamic,dist_PPC_6,'-','Color',cmap(6,:),'LineWidth',1.5)
plot(t_dynamic,dist_PPC_7,'-','Color',cmap(7,:),'LineWidth',1.5)
plot(t_dynamic,dist_PPC_8,'-','Color',cmap(8,:),'LineWidth',1.5)
title('PPC')

figure
hold on
plot(t_dynamic,dist_PFC_1,'-','Color',cmap(1,:),'LineWidth',1.5)
plot(t_dynamic,dist_PFC_2,'-','Color',cmap(2,:),'LineWidth',1.5)
plot(t_dynamic,dist_PFC_3,'-','Color',cmap(3,:),'LineWidth',1.5)
plot(t_dynamic,dist_PFC_4,'-','Color',cmap(4,:),'LineWidth',1.5)
plot(t_dynamic,dist_PFC_5,'-','Color',cmap(5,:),'LineWidth',1.5)
plot(t_dynamic,dist_PFC_6,'-','Color',cmap(6,:),'LineWidth',1.5)
plot(t_dynamic,dist_PFC_7,'-','Color',cmap(7,:),'LineWidth',1.5)
plot(t_dynamic,dist_PFC_8,'-','Color',cmap(8,:),'LineWidth',1.5)
plot(t_dynamic,dist_PPC_1,'--','Color',cmap(1,:),'LineWidth',1)
plot(t_dynamic,dist_PPC_2,'--','Color',cmap(2,:),'LineWidth',1)
plot(t_dynamic,dist_PPC_3,'--','Color',cmap(3,:),'LineWidth',1)
plot(t_dynamic,dist_PPC_4,'--','Color',cmap(4,:),'LineWidth',1)
plot(t_dynamic,dist_PPC_5,'--','Color',cmap(5,:),'LineWidth',1)
plot(t_dynamic,dist_PPC_6,'--','Color',cmap(6,:),'LineWidth',1)
plot(t_dynamic,dist_PPC_7,'--','Color',cmap(7,:),'LineWidth',1)
plot(t_dynamic,dist_PPC_8,'--','Color',cmap(8,:),'LineWidth',1)

%% distance more 

dist_PFC=[dist_PFC_1,dist_PFC_2,dist_PFC_3,dist_PFC_4,...
    dist_PFC_5,dist_PFC_6,dist_PFC_7,dist_PFC_8];

dist_PPC=[dist_PPC_1,dist_PPC_2,dist_PPC_3,dist_PPC_4,...
    dist_PPC_5,dist_PPC_6,dist_PPC_7,dist_PPC_8];

dist_PFC_norm=(dist_PFC-mean(dist_PFC,2))./sqrt(var(dist_PFC,0,2));
dist_PPC_norm=(dist_PPC-mean(dist_PPC,2))./sqrt(var(dist_PPC,0,2));

figure
hold on
plot(t_dynamic,mean(dist_PFC,2), '-','Color',cmap(1,:),'LineWidth',1.5)
plot(t_dynamic,mean(dist_PPC,2), '--','Color',cmap(8,:),'LineWidth',1.5)

y_PFC=mean(dist_PFC,2); yp_PFC=1.96*sqrt(var(dist_PFC,0,2))/sqrt(8);
y_PPC=mean(dist_PPC,2); yp_PPC=1.96*sqrt(var(dist_PPC,0,2))/sqrt(8);

errorbar(t_dynamic,y_PFC,yp_PFC,'-+','MarkerSize',12,'MarkerEdgeColor',cmap(1,:),'MarkerFaceColor',cmap(1,:))
errorbar(t_dynamic,y_PPC,yp_PPC,'-+','MarkerSize',12,'MarkerEdgeColor',cmap(1,:),'MarkerFaceColor',cmap(1,:))

%%
figure
hold on
plot(t_dynamic,mean(dist_PFC,2), '-','Color','r','LineWidth',1.5)
plot(t_dynamic,mean(dist_PPC,2), '-','Color','k','LineWidth',1.5)

shadedErrorBar(t_dynamic,dist_PFC',{@mean,@(x) 0.5*std(x)},'lineprops','-r','patchSaturation',0.08)
shadedErrorBar(t_dynamic,dist_PPC',{@mean,@(x) 0.5*std(x)},'lineprops','-k','patchSaturation',0.08)

grid on
set(gca,'FontSize',20)
xlabel('Time'),ylabel('Normalized trajectory')
legend('PFC','PPC')
title('Average Neural Activities During MSNG Task')
% %% PFC:  pca2 and pca3
% 
% 
% 
% cmap1=linspace(1,0.2,8)';cmap2=0.2*ones(8,1);cmap3=linspace(0.2,1,8)';
% 
% cmap=[cmap1,cmap2,cmap3];
% 
% figure
% hold on
% 
% plot3(cod1_PFC(:,2),cod1_PFC(:,3),t_dynamic,'-','Color',cmap(1,:),'LineWidth',1.5,'MarkerSize',8)
% plot3(cod2_PFC(:,2),cod2_PFC(:,3),t_dynamic,'-','Color',cmap(2,:),'LineWidth',1.5,'MarkerSize',8)
% plot3(cod3_PFC(:,2),cod3_PFC(:,3),t_dynamic,'-','Color',cmap(3,:),'LineWidth',1.5,'MarkerSize',8)
% plot3(cod4_PFC(:,2),cod4_PFC(:,3),t_dynamic,'-','Color',cmap(4,:),'LineWidth',1.5,'MarkerSize',8)
% plot3(cod5_PFC(:,2),cod5_PFC(:,3),t_dynamic,'-','Color',cmap(5,:),'LineWidth',1.5,'MarkerSize',8)
% plot3(cod6_PFC(:,2),cod6_PFC(:,3),t_dynamic,'-','Color',cmap(6,:),'LineWidth',1.5,'MarkerSize',8)
% plot3(cod7_PFC(:,2),cod7_PFC(:,3),t_dynamic,'-','Color',cmap(7,:),'LineWidth',1.5,'MarkerSize',8)
% plot3(cod8_PFC(:,2),cod8_PFC(:,3),t_dynamic,'-','Color',cmap(8,:),'LineWidth',1.5,'MarkerSize',8)
% 
% 
% grid on
% set(gca,'FontSize',15)
% 
% rotate3d on
% xlabel('PC2'),ylabel('PC3'),zlabel('time')
% 
% colormap(cmap)
% cb=colorbar;
% cb.TickLabelInterpreter='latex';
% cb.Ticks=[0.02,0.25,0.5,0.75,0.98];
% cb.TickLabels={'$L_1$','$\vdots$','$L_{4}$','$\vdots$','$L_{8}$'};
% 
% 
% %% PFC:  pca1 and pca3
% 
% 
% 
% cmap1=linspace(1,0.2,8)';cmap2=0.2*ones(8,1);cmap3=linspace(0.2,1,8)';
% 
% cmap=[cmap1,cmap2,cmap3];
% 
% figure
% hold on
% 
% plot3(cod1_PFC(:,1),cod1_PFC(:,3),t_dynamic,'-','Color',cmap(1,:),'LineWidth',1.5,'MarkerSize',8)
% plot3(cod2_PFC(:,1),cod2_PFC(:,3),t_dynamic,'-','Color',cmap(2,:),'LineWidth',1.5,'MarkerSize',8)
% plot3(cod3_PFC(:,1),cod3_PFC(:,3),t_dynamic,'-','Color',cmap(3,:),'LineWidth',1.5,'MarkerSize',8)
% plot3(cod4_PFC(:,1),cod4_PFC(:,3),t_dynamic,'-','Color',cmap(4,:),'LineWidth',1.5,'MarkerSize',8)
% plot3(cod5_PFC(:,1),cod5_PFC(:,3),t_dynamic,'-','Color',cmap(5,:),'LineWidth',1.5,'MarkerSize',8)
% plot3(cod6_PFC(:,1),cod6_PFC(:,3),t_dynamic,'-','Color',cmap(6,:),'LineWidth',1.5,'MarkerSize',8)
% plot3(cod7_PFC(:,1),cod7_PFC(:,3),t_dynamic,'-','Color',cmap(7,:),'LineWidth',1.5,'MarkerSize',8)
% plot3(cod8_PFC(:,1),cod8_PFC(:,3),t_dynamic,'-','Color',cmap(8,:),'LineWidth',1.5,'MarkerSize',8)
% 
% 
% grid on
% set(gca,'FontSize',15)
% 
% rotate3d on
% xlabel('PC1'),ylabel('PC3'),zlabel('time')
% 
% colormap(cmap)
% cb=colorbar;
% cb.TickLabelInterpreter='latex';
% cb.Ticks=[0.02,0.25,0.5,0.75,0.98];
% cb.TickLabels={'$L_1$','$\vdots$','$L_{4}$','$\vdots$','$L_{8}$'};
% 


