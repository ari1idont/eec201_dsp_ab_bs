c1=matfile("C:\Users\arind\Documents\winter_quarter_2024\eec201\final_project\centroids3\s1_cent_4.mat");
centroid1=c1.centroid_codebook;
c2=matfile("C:\Users\arind\Documents\winter_quarter_2024\eec201\final_project\centroids3\s2_cent_4.mat");
centroid2=c2.centroid_codebook;
c3=matfile("C:\Users\arind\Documents\winter_quarter_2024\eec201\final_project\centroids3\s3_cent_4.mat");
centroid3=c3.centroid_codebook;
c4=matfile("C:\Users\arind\Documents\winter_quarter_2024\eec201\final_project\centroids3\s4_cent_4.mat");
centroid4=c4.centroid_codebook;
c5=matfile("C:\Users\arind\Documents\winter_quarter_2024\eec201\final_project\centroids3\s5_cent_4.mat");
centroid5=c5.centroid_codebook;
c6=matfile("C:\Users\arind\Documents\winter_quarter_2024\eec201\final_project\centroids3\s6_cent_4.mat");
centroid6=c6.centroid_codebook;
c7=matfile("C:\Users\arind\Documents\winter_quarter_2024\eec201\final_project\centroids3\s7_cent_4.mat");
centroid7=c7.centroid_codebook;
c8=matfile("C:\Users\arind\Documents\winter_quarter_2024\eec201\final_project\centroids3\s8_cent_4.mat");
centroid8=c8.centroid_codebook;
c9=matfile("C:\Users\arind\Documents\winter_quarter_2024\eec201\final_project\centroids3\s9_cent_4.mat");
centroid9=c9.centroid_codebook;
c10=matfile("C:\Users\arind\Documents\winter_quarter_2024\eec201\final_project\centroids3\s10_cent_4.mat");
centroid10=c10.centroid_codebook;
c11=matfile("C:\Users\arind\Documents\winter_quarter_2024\eec201\final_project\centroids3\s11_cent_4.mat");
centroid11=c11.centroid_codebook;




c1=matfile("s1.mat");
test1=c1.cepstrum_frames;
c2=matfile("s2.mat");
test2=c2.cepstrum_frames;
c3=matfile("s3.mat");
test3=c3.cepstrum_frames;
c4=matfile("s4.mat");
test4=c4.cepstrum_frames;
c5=matfile("s5.mat");
test5=c5.cepstrum_frames;
c6=matfile("s6.mat");
test6=c6.cepstrum_frames;
c7=matfile("s7.mat");
test7=c1.cepstrum_frames;
c8=matfile("s8.mat");
test8=c8.cepstrum_frames;
c9=matfile("s9.mat");
test9=c9.cepstrum_frames;
c10=matfile("s10.mat");
test10=c10.cepstrum_frames;
c11=matfile("s11.mat");
test11=c11.cepstrum_frames;




test_signal=test11;

framedist=zeros(11,size(test_signal,2));


%distance calculator centtroid 1
x1=disteu(centroid1,test_signal);
for i=1:size(x1,2)
    %framedist=[framedist min(x1(:,i))];
    framedist(1,i)=min(x1(:,i));
end

%distance cal centroid 2
x2=disteu(centroid2,test_signal);
for i=1:size(x2,2)
    framedist(2,i)=min(x2(:,i));
end

%distacne cal centroid 3
x3=disteu(centroid3,test_signal);
for i=1:size(x3,2)
    framedist(3,i)=min(x3(:,i));
end

%distance cal centroid 4
x4=disteu(centroid4,test_signal);
for i=1:size(x4,2)
    framedist(4,i)=min(x4(:,i));
end

% %distance cal centroid 5
x5=disteu(centroid5,test_signal);
for i=1:size(x5,2)
    framedist(5,i)=min(x5(:,i));
end


%distance cal centroid 6
x6=disteu(centroid6,test_signal);
for i=1:size(x6,2)
    framedist(6,i)=min(x6(:,i));
end


%distance cal centroid 7
x7=disteu(centroid7,test_signal);
for i=1:size(x7,2)
    framedist(7,i)=min(x7(:,i));
end


%distance cal centroid 8
x8=disteu(centroid8,test_signal);
for i=1:size(x8,2)
    framedist(8,i)=min(x8(:,i));
end


x9=disteu(centroid9,test_signal);
for i=1:size(x9,2)
    framedist(9,i)=min(x9(:,i));
end

x10=disteu(centroid10,test_signal);
for i=1:size(x10,2)
    framedist(10,i)=min(x10(:,i));
end

x11=disteu(centroid11,test_signal);
for i=1:size(x11,2)
    framedist(11,i)=min(x11(:,i));
end





%majority decision
speaker = 1;
min_dist = sum(framedist(1,:));

dist=[];
dist=[dist min_dist];
for i= 2:size(framedist,1)
    temp1=sum(framedist(i,:));
    dist=[dist temp1];
    if temp1 < min_dist
        speaker=i;
        min_dist=temp1;
    end
end

disp('prediction :');
disp(speaker);







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