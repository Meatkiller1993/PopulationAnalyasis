
function [FR,Num] = part_msng(data,col,percent)


% match trails in class 1
 m=length(data);

 % For each cell, combine the data into three classes and calculate mean firing rate

 FR=nan(m,3);

 Num=nan(m,1);

for ind_1=1:m
    
    %read data in each row
    
    %+++++++++ store firing data into 2 classes in matrix form +++++++++++++++++   

    FR1_mat=[];
   
        
    temp=data{ind_1,col};

    %check the length of the data, avoid empty data
    len_temp=length(temp);   

    if len_temp>1

        for ind_3=1:len_temp
            [FR_cue,FR_delay,FR_SF] = cal_fr(temp,ind_3);
            
               
               FR1_mat=[FR1_mat;FR_cue,FR_delay,FR_SF];  

        end

    end
    
    if percent==1
        FR2_mat=mean(FR1_mat,1);
        k1=len_temp;
    else
        % randomly draw percent% data
        k1=round(len_temp*percent);
        p1 = randperm(len_temp,k1);
    
        FR2_mat=mean(FR1_mat(p1,:),1);
    end
    %store data
    FR(ind_1,:)=FR2_mat;        
    FR(any(isnan(FR), 2), :) = [];
  

    %save number of trails
    Num(ind_1)=k1;
    
   
end


end

function [FR_cue,FR_delay,FR_SF] = cal_fr(temp,ind_3)


time_of_spike=temp(ind_3).TS;
Cue_on_T=temp(ind_3).Cue_onT;
Sample_on_T=temp(ind_3).Sample_onT;
% Target_on_T=temp(ind_3).Target_onT;

%firing rates in cue and 1st delay

num_spike_cue=sum((time_of_spike>Cue_on_T).*(time_of_spike<=Cue_on_T+0.5));
FR_cue=num_spike_cue/0.5;

num_spike_delay1=sum((time_of_spike>Cue_on_T+0.5).*(time_of_spike<=Cue_on_T+3.5));
FR_delay=num_spike_delay1/3;


%firing rates in sample
num_spike_SF=sum((time_of_spike>Sample_on_T).*(time_of_spike<=Sample_on_T+0.5));
FR_SF=num_spike_SF/0.5;


end