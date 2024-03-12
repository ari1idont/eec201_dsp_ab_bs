c1=matfile("s1_cent1.mat");
centroid1=c1.centroid_codebook;
c2=matfile("s2_cent1.mat");
centroid2=c2.centroid_codebook;
c3=matfile("s3_cent1.mat");
centroid3=c3.centroid_codebook;
c4=matfile("s4_cent1.mat");
centroid4=c4.centroid_codebook;
c5=matfile("s5_cent1.mat");
centroid5=c5.centroid_codebook;
c6=matfile("s6_cent1.mat");
centroid6=c6.centroid_codebook;
c7=matfile("s7_cent1.mat");
centroid7=c7.centroid_codebook;
c8=matfile("s8_cent1.mat");
centroid8=c8.centroid_codebook;
c1=matfile("s1_test.mat");
test1=c1.cepstrum_frames;
c2=matfile("s2_test.mat");
test2=c2.cepstrum_frames;
c3=matfile("s3_test.mat");
test3=c3.cepstrum_frames;
c4=matfile("s4_test.mat");
test4=c4.cepstrum_frames;
c5=matfile("s5_test.mat");
test5=c5.cepstrum_frames;
c6=matfile("s6_test.mat");
test6=c6.cepstrum_frames;
c7=matfile("s7_test.mat");
test7=c1.cepstrum_frames;
c8=matfile("s8_test.mat");
test8=c8.cepstrum_frames;
id=[];

%test1

super_centroid_cluster=[centroid1 centroid2 centroid3 centroid4 centroid5 centroid6 centroid7 centroid8];
x1=disteu(super_centroid_cluster,test1);
% y1=min(x(:,1));
% idx=find(x(:,1)==y,1)
d1=[];
for i=1:size(x1,2)
temp1=min(x1(:,i));
idx=find(x1(:,i)==temp1,1);
idx=floor(idx/16);
d1=[d1 idx];
end
id=[ id mode(d1)];

%test2

x2=disteu(super_centroid_cluster,test2);
% y1=min(x(:,1));
% idx=find(x(:,1)==y,1)
d2=[];
for i=1:size(x2,2)
temp1=min(x2(:,i));
idx=find(x2(:,i)==temp1,1);
idx=floor(idx/16);
d2=[d2 idx];
end
id=[ id mode(d2)];



%test3
x3=disteu(super_centroid_cluster,test3);
% y1=min(x(:,1));
% idx=find(x(:,1)==y,1)
d3=[];
for i=1:size(x3,2)
temp1=min(x3(:,i));
idx=find(x3(:,i)==temp1,1);
idx=floor(idx/16);
d3=[d3 idx];
end
id=[ id mode(d3)];

%test4
x4=disteu(super_centroid_cluster,test4);
% y1=min(x(:,1));
% idx=find(x(:,1)==y,1)
d4=[];
for i=1:size(x4,2)
temp1=min(x4(:,i));
idx=find(x4(:,i)==temp1,1);
idx=floor(idx/16);
d4=[d4 idx];
end
id=[ id mode(d4)];



%test5
x5=disteu(super_centroid_cluster,test5);
% y1=min(x(:,1));
% idx=find(x(:,1)==y,1)
d5=[];
for i=1:size(x5,2)
temp1=min(x5(:,i));
idx=find(x5(:,i)==temp1,1);
idx=floor(idx/16);
d5=[d5 idx];
end
id=[ id mode(d5)];


%test6
x6=disteu(super_centroid_cluster,test6);
% y1=min(x(:,1));
% idx=find(x(:,1)==y,1)
d6=[];
for i=1:size(x6,2)
temp1=min(x6(:,i));
idx=find(x6(:,i)==temp1,1);
idx=floor(idx/16);
d6=[d6 idx];
end
id=[ id mode(d6)];


%test7
x7=disteu(super_centroid_cluster,test7);
% y1=min(x(:,1));
% idx=find(x(:,1)==y,1)
d7=[];
for i=1:size(x7,2)
temp1=min(x7(:,i));
idx=find(x7(:,i)==temp1,1);
idx=floor(idx/16);
d7=[d7 idx];
end
id=[ id mode(d7)];


%test8
x8=disteu(super_centroid_cluster,test8);
% y1=min(x(:,1));
% idx=find(x(:,1)==y,1)
d8=[];
for i=1:size(x8,2)
temp1=min(x8(:,i));
idx=find(x8(:,i)==temp1,1);
idx=floor(idx/16);
d8=[d8 idx];
end
id=[ id mode(d8)];


% id =
% 
%      0     3     0     3     3     3     0     3


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



