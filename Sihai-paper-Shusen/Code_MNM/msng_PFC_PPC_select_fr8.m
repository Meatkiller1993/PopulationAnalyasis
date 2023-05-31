%{
select data with more than 8 trials in PFC and PPC
%}

%% find cells with more than 8 trials in PFC

m=length(msng_PFC);

Num_trials_PFC=nan(m,8);

for col=1:8
    
    
    for ind_1=1:m
        temp=msng_PFC{ind_1,col};
        %check the length of the data, avoid empty data
        len_temp=length(temp);         
        Num_trials_PFC(ind_1,col)=len_temp;

    end

end

m1=min(Num_trials_PFC,[],2);
m2=find(m1<8);
temp1=msng_PFC;
temp1(m2,:)=[];
msng_PFC_new=temp1;


%% find cells with more than 8 trials in PPC

m=length(msng_PPC);

Num_trials_PPC=nan(m,8);

for col=1:8
    
    
    for ind_1=1:m
        temp=msng_PPC{ind_1,col};
        %check the length of the data, avoid empty data
        len_temp=length(temp);         
        Num_trials_PPC(ind_1,col)=len_temp;

    end

end

m1=min(Num_trials_PPC,[],2);
m2=find(m1<8);
temp1=msng_PPC;
temp1(m2,:)=[];
msng_PPC_new=temp1;


