function [dist_1,dist_2,dist_3,dist_4,dist_5,dist_6,dist_7,dist_8] = norm_dist_dynamics(t_dynamic,cod1,cod2,cod3,cod4,cod5,cod6,cod7,cod8)

% find index for fixation
ind=find(t_dynamic<=1);
%data that are recorded in fixation:
N_fix=length(ind);
% length of t_dynamic
Nt=length(t_dynamic);


% find all distance to the mean in fixation 
dist_1=nan(Nt,1); dist_2=nan(Nt,1); dist_3=nan(Nt,1); dist_4=nan(Nt,1);
dist_5=nan(Nt,1); dist_6=nan(Nt,1); dist_7=nan(Nt,1); dist_8=nan(Nt,1);
% time in the t_dynamic during fixation 1:N_fix
ave_fix_1=mean(cod1(1:N_fix,:),1); ave_fix_2=mean(cod2(1:N_fix,:),1);
ave_fix_3=mean(cod3(1:N_fix,:),1); ave_fix_4=mean(cod4(1:N_fix,:),1);
ave_fix_5=mean(cod5(1:N_fix,:),1); ave_fix_6=mean(cod6(1:N_fix,:),1);
ave_fix_7=mean(cod7(1:N_fix,:),1); ave_fix_8=mean(cod8(1:N_fix,:),1);

% variations in fixation as baseline using pca1&pca2
diff_from_mean_1=cod1(:,1:2)-ave_fix_1(1:2); diff_from_mean_2=cod2(:,1:2)-ave_fix_2(1:2);
diff_from_mean_3=cod3(:,1:2)-ave_fix_3(1:2); diff_from_mean_4=cod4(:,1:2)-ave_fix_4(1:2);
diff_from_mean_5=cod5(:,1:2)-ave_fix_5(1:2); diff_from_mean_6=cod6(:,1:2)-ave_fix_6(1:2);
diff_from_mean_7=cod7(:,1:2)-ave_fix_7(1:2); diff_from_mean_8=cod8(:,1:2)-ave_fix_8(1:2);

for i=1:Nt
dist_1(i)=sqrt(norm(diff_from_mean_1(i,:)));  dist_2(i)=sqrt(norm(diff_from_mean_2(i,:))); 
dist_3(i)=sqrt(norm(diff_from_mean_3(i,:)));  dist_4(i)=sqrt(norm(diff_from_mean_4(i,:))); 
dist_5(i)=sqrt(norm(diff_from_mean_5(i,:)));  dist_6(i)=sqrt(norm(diff_from_mean_6(i,:))); 
dist_7(i)=sqrt(norm(diff_from_mean_7(i,:)));  dist_8(i)=sqrt(norm(diff_from_mean_8(i,:))); 
end


end