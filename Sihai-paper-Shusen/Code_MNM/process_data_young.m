
load('PFC_young_data.mat')

%%

Ninfo=length(data_group);
Area_info=cell(Ninfo,2);
Neuron_num=nan(Ninfo,1);
for i=1:Ninfo
    
    Area_info{i,1}=data_group{i,1};
    Neuron_num(i)=data_group{i,1};
    area=data_group{i,2};
    
    if  isnumeric(area)
        
        if (area-46)*(area-8)==0
            Area_info{i,2}='PFC';
        else
            Area_info{i,2}='Parietal';  
        end
        
    else
        Area_info{i,2}='Parietal';       
    end
    
end

%% find the brain areas

num_ind=cell_info{1,3}; num_ind=num_ind';
len1=length(num_ind);
Area_names=cell(len1,1);

for i=1:len1
    
    ind1=find(Neuron_num==num_ind(i));
    if isempty(ind1)
        Area_names{i}='';
        disp('empty')
        disp(i)
    else
    Area_names{i}=Area_info{ind1,2};
    end
    
end

Ind_PFC= find(contains(Area_names,'PFC'));
Ind_Parietal= find(contains(Area_names,'Parietal'));



%% select data

mat_ind=1:2:15;
msng_mat=msng_data(:,mat_ind);


%% cuerate for all cells in all locations

m=length(msng_mat);
FR_cue=nan(m,8);
Num_cue=nan(m,8);

for col=1:8
    
    
    for ind_1=1:m
        temp=msng_mat{ind_1,col};
        %check the length of the data, avoid empty data
        len_temp=length(temp);   
        cue_fr=nan(len_temp,1);
        
        if len_temp>1

            for ind_3=1:len_temp
               cue_fr(ind_3)=temp(ind_3).cuerate;
            end

        end

 
        FR_cue(ind_1,col)=mean(cue_fr);       
        Num_cue(ind_1,col)=len_temp;

    end

end

%%
FR_PFC=FR_cue(Ind_PFC,:);
Data_PFC=msng_mat(Ind_PFC,:);

FR_Parietal=FR_cue(Ind_Parietal,:);
Data_Parietal=msng_mat(Ind_Parietal,:);

%% select data for PFC
X1=FR_PFC;
i0=any(isnan(X1), 2);
i1=find(i0>0);
X1(i1, :) = [];

mean_cue=mean(X1,2);
i2=find(mean_cue<1);
X1(i2,:)=[];

msng_PFC=Data_PFC;
msng_PFC(i1, :) = [];
msng_PFC(i2, :) = [];

%% data selceted for Parietal

X=FR_Parietal;
i0=any(isnan(X), 2);
i1=find(i0>0);
X(i1, :) = [];

mean_cue=mean(X,2);
i2=find(mean_cue<1);
X(i2,:)=[];

msng_Parietal=Data_Parietal;
msng_Parietal(i1, :) = [];
msng_Parietal(i2, :) = [];
msng_PPC=msng_Parietal;

%% get the basis for pca
SelecData=X1';
[coeff,score,latent,tsquared,explained,mu] = pca(SelecData);
        
cent1=SelecData-mean(SelecData,1);
diff1=cent1*coeff-score;

pca_base_PFC=coeff;


SelecData1=X';
[coeff1,score1,latent1,tsquared1,explained1,mu1] = pca(SelecData1);
        
cent2=SelecData1-mean(SelecData1,1);
diff2=cent2*coeff1-score1;

pca_base_Parietal=coeff1;


