function [ang,good_fit1,good_fit2,distPs] = fit_plane_and_plot(Points1,Points2)


    % number of points in the two planes
    [np,~]=size(Points1);

    % define colors for plotting data
    xe = linspace(0, 2*pi, np+1);
    xc = xe(1:np) + diff(xe(1:2))/2;
    [unitX, unitY] = pol2cart(xc,30);
    cols = lab2rgb([70.*ones(numel(unitX),1),unitX',unitY']);
    cols = [cols; cols];

    % make the plot
    figure
    hold on




    %++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    % step 2: find the vectors spanning the best-fit plane for set 1
    eigvecs1 = pca(Points1(:,1:3));   
    % center for the plot and scale of the eigen-vectors needed
    mn1 = mean(Points1(:,1:3),1);
    dist1=Points1(:,1:3)-mn1;
    scaleFactor1=1.25*max(vecnorm(dist1,2,2));


    %++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    % step 3: find the vectors spanning the best-fit plane for set 2
    eigvecs2 = pca(Points2(:,1:3));
    % center for the plot and scale of the eigen-vectors needed
    mn2 = mean(Points2(:,1:3),1);
    dist2=Points2(:,1:3)-mn2;
    scaleFactor2=1.25*max(vecnorm(dist2,2,2));

    % common scale factor for the two fitted planes
    scaleFactor=1.2*max(scaleFactor1,scaleFactor2);

    %++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    % step 4: find & plot points spanning the best-fit plane for set 1
    x1 = eigvecs1(1,1:2).*scaleFactor;
    y1 = eigvecs1(2,1:2).*scaleFactor;
    z1 = eigvecs1(3,1:2).*scaleFactor;
    patch([x1 -x1]+mn1(1),[y1 -y1]+mn1(2),[z1 -z1]+mn1(3),'r','EdgeColor','r','FaceAlpha',.1);

    %++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    % step 5: goodness of fit for the best-fit plane for set 1
    pts_fit=[[x1 -x1]+mn1(1);[y1 -y1]+mn1(2);[z1 -z1]+mn1(3)]';
    pts_ori=Points1(:,1:3);
    dist1=dist_fit_plane(pts_fit,pts_ori);
    good_fit1=mean(dist1);


    %++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    % step 6: find & plot points spanning the best-fit plane for set 1
    x2 = eigvecs2(1,1:2).*scaleFactor;
    y2 = eigvecs2(2,1:2).*scaleFactor;
    z2 = eigvecs2(3,1:2).*scaleFactor;
    patch([x2 -x2]+mn2(1),[y2 -y2]+mn2(2),[z2 -z2]+mn2(3),'b','EdgeColor','b','FaceAlpha',.1);

    %++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    % step 7: goodness of fit for the best-fit plane for set 1
    pts_fit=[[x2 -x2]+mn2(1);[y2 -y2]+mn2(2);[z2 -z2]+mn2(3)]';
    pts_ori=Points2(:,1:3);
    dist2=dist_fit_plane(pts_fit,pts_ori);
    good_fit2=mean(dist2);

    
        %++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++    
    % step 1: connect all points
    plot3(Points1([1:end,1],1),Points1([1:end,1],2),Points1([1:end,1],3),'r-','LineWidth',.8);
    plot3(Points2([1:end,1],1),Points2([1:end,1],2),Points2([1:end,1],3),'b-','LineWidth',.8);

    distPs=norm(mn1-mn2);
    
    %++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    % step 8: plot the marker for each condition
    Y=[Points1;Points2];
    for i_mark = 1:np*2
        if i_mark<=np %condition 1
            ls = 'o';
            mfc = cols(i_mark,:);
        else %condition 2
            ls = 'd';
            mfc = cols(i_mark,:);
        end
        hold on
        plot3(Y(i_mark,1),Y(i_mark,2),Y(i_mark,3),ls,'MarkerSize',17,'color',cols(i_mark,:),'MarkerFaceColor',mfc);
    end

    %++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    % step 9: show markers as condition numbers

    for i_mark = 1:np
        text(Points1(i_mark,1),Points1(i_mark,2),Points1(i_mark,3),num2str(i_mark),'color','k','FontSize',14)
    end

    for i_mark = 1:np
        text(Points2(i_mark,1),Points2(i_mark,2),Points2(i_mark,3),num2str(i_mark),'color','k','FontSize',14)
    end
    
    
    
    % fontsize and labels
    set(gca,'FontSize',12)

    rotate3d on
    xlabel('PC1'),ylabel('PC2'),zlabel('PC3')
    
    % angels between plane
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

function [dist] = dist_fit_plane(pts_fit,pts_ori)


% norm to the fitted plane
N = cross(pts_fit(1,:)-pts_fit(2,:), pts_fit(1,:)-pts_fit(3,:));
N=N/norm(N);

%calculate the distance from the 8 points to the fitted plane
[rows,~]=size(pts_ori);
dist=nan(rows,1);
for ip=1:rows
    Vec=pts_fit(1,:)-pts_ori(ip,:);
    dist(ip)=abs(dot(N,Vec));
end
%goodness of fit
%disp(['Goodness of fit for plane nomatch is ',num2str(good_fit)])

end


