
%{
get dynamics firing data with time
%}

function [FR_Mat,Num_mat] = dynamic_spa_pre1(working_data,col,t_wind,dt)


% match trails in class 1
 m=length(working_data);

 t0=1.2-1+t_wind;
 t_dynamic=t0:dt:1.2+4;
 lent=length(t_dynamic);

 % For each cell, combine the data into three classes and calculate mean firing rate

 FR_Mat=nan(m,lent);
 Num_mat=nan(m,1);


for ind_1=1:m
    
    %read data in each row
    
    %+++++++++ store firing data into 2 classes in matrix form +++++++++++++++++   
    
    FR1_mat=[];
    temp=working_data{ind_1,col};

    %check the length of the data, avoid empty data
    len_temp=length(temp);   

    if len_temp>1

        for ind_3=1:len_temp
            [FR_vec] = cal_fr(temp,ind_3,t_wind,dt);
               FR1_mat=[FR1_mat;FR_vec];        
        end

    end
    
%     % randomly draw percent% data
%     k1=round(ind_match*percent);
%     p1 = randperm(ind_match,k1);
%     
%     k2=round(ind_nonmatch*percent);
%     p2 = randperm(ind_nonmatch,k2);
    
    %store data
    FR_Mat(ind_1,:)=mean(FR1_mat,1);       

    %save number of trails
    Num_mat(ind_1)=len_temp;


   
end


end

% calculate the time series of the firing rates
function [FR_vec] = cal_fr(temp,ind_3,t_wind,dt)


time_of_spike=temp(ind_3).TS;
Cue_on_T=temp(ind_3).Cue_onT;
t0=Cue_on_T-1+t_wind;

t_dynamic=t0:dt:Cue_on_T+4;

Nt=length(t_dynamic);

FR_vec=nan(1,Nt);

    for ind_t=1:Nt
        
        t_k=t_dynamic(ind_t);
        
        num_spk=sum((time_of_spike<t_k).*(time_of_spike>t_k-t_wind));
        
        FR_vec(ind_t)=num_spk/t_wind;        
    end


end



