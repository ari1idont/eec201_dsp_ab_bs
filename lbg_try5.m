c=matfile("s11.mat");
data=c.cepstrum_frames;
%data=data(6:7,:)';
num_initial_centroids = 2;
threshold = 0.01; % Adjust this threshold as needed
centroid_codebook=[];
temp1=mean(data')';
centroid_codebook=[temp1];
% temp2=temp1.*(1+threshold);
% temp3=temp1.*(1-threshold);
% centroid_codebook=[temp2 temp3];
M=10;
temp4=disteu(centroid_codebook,data);
D=sum(temp4);
    % holder=[];
    % D=0;
    % for i=1:size(centroid_codebook,2)
    %     for j=1:size(data,2)
    %         temp5=min(temp4(:,j));
    %         idx=find(temp4(:,j)==temp5,1);
    %         if(idx==i)
    %             holder=[holder data(:,j)];
    %         end
    %     end
    %     centroid_codebook(:,i)=mean(holder')';
    %     d=sum(abs(disteu(centroid_codebook(:,i),holder)));
    %     D=D+abs(d);
    % end
    D=D/size(data,2);
    
    
    D_n=0;
    while(size(centroid_codebook,2)<M)
    centroid_codebook=[centroid_codebook.*(1-threshold) centroid_codebook.*(1+threshold)];    
    temp4=disteu(centroid_codebook,data);
    %holder=[];
    %D_n=0;
    while (D>threshold)
    for i=1:size(centroid_codebook,2)
        holder=[];
        for j=1:size(data,2)
            temp5=min(temp4(:,j));
            idx=find(temp4(:,j)==temp5,1);
            if(idx==i)
                holder=[holder data(:,j)];
            end
        end
        %centroid_codebook(:,i)=mean(holder')';
        if size(holder,1)==0
            continue;
        end
        centroid_codebook(:,i)=mean(holder')';
        d=sum(abs(disteu(centroid_codebook(:,i),holder)));
        D_n=D_n+abs(d);
    end
    D_n=D_n/size(data,2);
    if((D_n-D)/D>threshold)
        D=D_n;
    else
        %D=0
        disp('a')
        break;
    end


    end
    


    end


save('C:\Users\arind\Documents\winter_quarter_2024\eec201\final_project\centroids3\s11_cent_5.mat',"centroid_codebook")

%p=disteu(centroid_codebook,data)





function d = disteu(x, y)
% DISTEU Pairwise Euclidean distances between columns of two matrices
%
% Input:
% x, y: Two matrices whose each column is an a vector data.
%
% Output:
% d: Element d(i,j) will be the Euclidean distance between two
% column vectors X(:,i) and Y(:,j)
%
% Note:
% The Euclidean distance D between two vectors X and Y is:
% D = sum((x-y).^2).^0.5
[M, N] = size(x);
[M2, P] = size(y);
if (M ~= M2)
error('Matrix dimensions do not match.')
end
d = zeros(N, P);
if (N < P)
copies = zeros(1,P);
for n = 1:N
d(n,:) = sum((x(:, n+copies) - y) .^2, 1);
end
else
copies = zeros(1,N);
for p = 1:P
d(:,p) = sum((x - y(:, p+copies)) .^2, 1)';
end
end
d = d.^0.5;
end