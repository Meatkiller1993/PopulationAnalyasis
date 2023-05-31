
%{
this code selects a certain percent of data to estimate the distribution
of the angles
%}

percent=0.85;
Nsim=4000;

Angle_85per=nan(Nsim,4);




parfor ind=1:Nsim
    
    


    for DataPair=1:4

        %================== DATA ANALYSIS PART 1: select a pair of data============

        if DataPair==1          %1:  cue vs delay PFC
            Target_data=PFC_cue_delay;           
            % randomly draw percent% data
            [~,n]=size(Target_data);
            k1=round(n*percent);
            p1 = randperm(n,k1);
            p=sort(p1);
            Target_data1=Target_data(:,p);
            ang=ang_pts(Target_data1);

        elseif  DataPair==2     %2: cue vs samp PFC
            Target_data=PFC_cue_samp;
            % randomly draw percent% data
            [~,n]=size(Target_data);
            k1=round(n*percent);
            p1 = randperm(n,k1);
            p=sort(p1);
            Target_data1=Target_data(:,p);
            ang=ang_pts(Target_data1);

        elseif  DataPair==3     %3: cue vs delay PPC
            Target_data=PPC_cue_delay;
            % randomly draw percent% data
            [~,n]=size(Target_data);
            k1=round(n*percent);
            p1 = randperm(n,k1);
            p=sort(p1);
            Target_data1=Target_data(:,p);
            ang=ang_pts(Target_data1);

        elseif  DataPair==4     %4: cue vs samp PPC 
            Target_data=PPC_cue_samp;
            % randomly draw percent% data
            [~,n]=size(Target_data);
            k1=round(n*percent);
            p1 = randperm(n,k1);
            p=sort(p1);
            Target_data1=Target_data(:,p);
            ang=ang_pts(Target_data1);
        end
        
        Angle_85per(ind,DataPair)=ang;

    end

    disp(ind)
end


function ang=ang_pts(Target_data)

        %================== DATA ANALYSIS PART 3: use pca to reduce the dimension ========
        [~, PCA_of_Data] = pca(Target_data);
        Points1=PCA_of_Data(1:8,:);
        Points2=PCA_of_Data(9:16,:);
        %Points3=PCA_of_Data(17:24,:);

        %========== DATA ANALYSIS PART 4: 3-D plot and calculate the angel =========

        % angels between plane
        eigvecs1 = pca(Points1(:,1:3)); 
        eigvecs2 = pca(Points2(:,1:3));
        cosTheta1 = abs(planeAngle(eigvecs1(:,1),eigvecs1(:,2),eigvecs2(:,1),eigvecs2(:,2)));
        ang=acosd(cosTheta1);
        
end


function cosTheta = planeAngle(v1,v2,v3,v4)
%compute the angle between the planes spanned by v1&v2 and v3&v4

cosTheta = blade(v1,v2,v3,v4) ./ sqrt( blade(v1,v2,v1,v2) .* blade(v3,v4,v3,v4) );
end

function b = blade(v1,v2,v3,v4)

mat = [dot(v1,v3) dot(v1,v4);
    dot(v2,v3) dot(v2,v4)];

b = det(mat);
end


