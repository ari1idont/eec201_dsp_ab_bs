c=matfile("s1.mat");
data=c.cepstrum_frames;
%data=data(6:7,:)';
num_initial_centroids = 2;
threshold = 0.001; % Adjust this threshold as needed
centroid_codebook=[];
temp1=mean(data')';
threshold=0.01;
temp2=temp1.*(1+threshold);
temp3=temp1.*(1-threshold);
centroid_codebook=[temp2 temp3];
M=6;
temp4=disteu(centroid_codebook,data);
    holder=[];
    D=0;
    for i=1:size(centroid_codebook,2)
        for j=1:size(data,2)
            temp5=min(temp4(:,j));
            idx=find(temp5);
            if(idx==i)
                holder=[holder data(:,j)]
            end
        end
        centroid_codebook(:,i)=mean(holder')';
        d=sum(disteu(centroid_codebook(:,i),holder));
        D=D+d;
    end
    
    
    
    
    while(size(centroid_codebook,2)<M)
    temp4=disteu(centroid_codebook,data);
    holder=[];
    D_n=0;
    while (D>threshold)
    for i=1:size(centroid_codebook,2)
        for j=1:size(data,2)
            temp5=min(temp4(:,j));
            idx=find(temp5);
            if(idx==i)
                holder=[holder data(:,j)]
            end
        end
        %centroid_codebook(:,i)=mean(holder')';
        centroid_codebook(:,i)=mean(holder')';
        d=sum(disteu(centroid_codebook(:,i),holder));
        D_n=D_n+d;
    end
    D=(D_n-D)/D;


    end
    centroid_codebook=[centroid_codebook.*(1-threshold) centroid_codebook.*(1+threshold)];


end
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