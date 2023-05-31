
%{
code to generate plots for the MSNG data
%}

%% angles between cue-delay and cue-sample in PFC and PPC
figure
subplot(2,2,1)
histogram(Angle_85per(:,1),50,'Normalization','probability')
title('PFC cue vs delay')
xlim([0,90])
ylim([0,0.15])
ylabel(['number of simulations=',num2str(Nsim)])
 set(gca,'FontSize',15)

subplot(2,2,2)
histogram(Angle_85per(:,2),50,'Normalization','probability')
title('PFC cue vs sample')
xlim([0,90])
ylim([0,.15])
 set(gca,'FontSize',15)

subplot(2,2,3)
histogram(Angle_85per(:,3),50,'Normalization','probability')
title('PPC cue vs delay')
xlim([0,90])
ylim([0,.15])
 set(gca,'FontSize',15)


subplot(2,2,4)
histogram(Angle_85per(:,4),50,'Normalization','probability')
title('PPC cue vs sample')
xlim([0,90])
ylim([0,.15])
 set(gca,'FontSize',15)


