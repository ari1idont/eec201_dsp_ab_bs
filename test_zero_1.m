%centroids zero_number_cent_3
%best centroid 6, test 3 -> frame 0.2, fft 512
clc 
clear all


c1=matfile("C:\Users\arind\Documents\winter_quarter_2024\eec201\final_project\centroids3\zero1_cent_6.mat");
centroid1=c1.centroid_codebook;
c2=matfile("C:\Users\arind\Documents\winter_quarter_2024\eec201\final_project\centroids3\zero2_cent_6.mat");
centroid2=c2.centroid_codebook;
c3=matfile("C:\Users\arind\Documents\winter_quarter_2024\eec201\final_project\centroids3\zero3_cent_6.mat");
centroid3=c3.centroid_codebook;
c4=matfile("C:\Users\arind\Documents\winter_quarter_2024\eec201\final_project\centroids3\zero4_cent_6.mat");
centroid4=c4.centroid_codebook;
% c5=matfile("C:\Users\arind\Documents\winter_quarter_2024\eec201\final_project\centroids3\zero5_cent_1.mat");
% centroid5=c5.centroid_codebook;
c6=matfile("C:\Users\arind\Documents\winter_quarter_2024\eec201\final_project\centroids3\zero6_cent_6.mat");
centroid6=c6.centroid_codebook;
c7=matfile("C:\Users\arind\Documents\winter_quarter_2024\eec201\final_project\centroids3\zero7_cent_6.mat");
centroid7=c7.centroid_codebook;
c8=matfile("C:\Users\arind\Documents\winter_quarter_2024\eec201\final_project\centroids3\zero8_cent_6.mat");
centroid8=c8.centroid_codebook;
c9=matfile("C:\Users\arind\Documents\winter_quarter_2024\eec201\final_project\centroids3\zero9_cent_6.mat");
centroid9=c9.centroid_codebook;
c10=matfile("C:\Users\arind\Documents\winter_quarter_2024\eec201\final_project\centroids3\zero10_cent_6.mat");
centroid10=c10.centroid_codebook;
c11=matfile("C:\Users\arind\Documents\winter_quarter_2024\eec201\final_project\centroids3\zero11_cent_6.mat");
centroid11=c11.centroid_codebook;
c12=matfile("C:\Users\arind\Documents\winter_quarter_2024\eec201\final_project\centroids3\zero12_cent_6.mat");
centroid12=c12.centroid_codebook;
c13=matfile("C:\Users\arind\Documents\winter_quarter_2024\eec201\final_project\centroids3\zero13_cent_6.mat");
centroid13=c13.centroid_codebook;
c14=matfile("C:\Users\arind\Documents\winter_quarter_2024\eec201\final_project\centroids3\zero14_cent_6.mat");
centroid14=c14.centroid_codebook;
c15=matfile("C:\Users\arind\Documents\winter_quarter_2024\eec201\final_project\centroids3\zero15_cent_6.mat");
centroid15=c15.centroid_codebook;
c16=matfile("C:\Users\arind\Documents\winter_quarter_2024\eec201\final_project\centroids3\zero16_cent_6.mat");
centroid16=c16.centroid_codebook;
c17=matfile("C:\Users\arind\Documents\winter_quarter_2024\eec201\final_project\centroids3\zero17_cent_6.mat");
centroid17=c17.centroid_codebook;
c18=matfile("C:\Users\arind\Documents\winter_quarter_2024\eec201\final_project\centroids3\zero18_cent_6.mat");
centroid18=c18  .centroid_codebook;
c19=matfile("C:\Users\arind\Documents\winter_quarter_2024\eec201\final_project\centroids3\zero19_cent_6.mat");
centroid19=c19.centroid_codebook;






c1=matfile("C:\Users\arind\Documents\winter_quarter_2024\eec201\final_project\StudentAudioRecording\zero1_test_3.mat");
test1=c1.cepstrum_frames;
c2=matfile("C:\Users\arind\Documents\winter_quarter_2024\eec201\final_project\StudentAudioRecording\zero2_test_3.mat");
test2=c2.cepstrum_frames;
c3=matfile("C:\Users\arind\Documents\winter_quarter_2024\eec201\final_project\StudentAudioRecording\zero3_test_3.mat");
test3=c3.cepstrum_frames;
c4=matfile("C:\Users\arind\Documents\winter_quarter_2024\eec201\final_project\StudentAudioRecording\zero4_test_3.mat");
test4=c4.cepstrum_frames;
% c5=matfile("C:\Users\arind\Documents\winter_quarter_2024\eec201\final_project\StudentAudioRecording\zero6.mat");
% test5=c5.cepstrum_frames;
c6=matfile("C:\Users\arind\Documents\winter_quarter_2024\eec201\final_project\StudentAudioRecording\zero6_test_3.mat");
test6=c6.cepstrum_frames;
c7=matfile("C:\Users\arind\Documents\winter_quarter_2024\eec201\final_project\StudentAudioRecording\zero7_test_3.mat");
test7=c7.cepstrum_frames;
c8=matfile("C:\Users\arind\Documents\winter_quarter_2024\eec201\final_project\StudentAudioRecording\zero8_test_3.mat");
test8=c8.cepstrum_frames;
c9=matfile("C:\Users\arind\Documents\winter_quarter_2024\eec201\final_project\StudentAudioRecording\zero9_test_3.mat");
test9=c9.cepstrum_frames;
c10=matfile("C:\Users\arind\Documents\winter_quarter_2024\eec201\final_project\StudentAudioRecording\zero10_test_3.mat");
test10=c10.cepstrum_frames;
c11=matfile("C:\Users\arind\Documents\winter_quarter_2024\eec201\final_project\StudentAudioRecording\zero11_test_3.mat");
test11=c11.cepstrum_frames;
c12=matfile("C:\Users\arind\Documents\winter_quarter_2024\eec201\final_project\StudentAudioRecording\zero12_test_3.mat");
test12=c12.cepstrum_frames;
c13=matfile("C:\Users\arind\Documents\winter_quarter_2024\eec201\final_project\StudentAudioRecording\zero13_test_3.mat");
test13=c13.cepstrum_frames;
c14=matfile("C:\Users\arind\Documents\winter_quarter_2024\eec201\final_project\StudentAudioRecording\zero14_test_3.mat");
test14=c14.cepstrum_frames;
c15=matfile("C:\Users\arind\Documents\winter_quarter_2024\eec201\final_project\StudentAudioRecording\zero15_test_3.mat");
test15=c15.cepstrum_frames;
c16=matfile("C:\Users\arind\Documents\winter_quarter_2024\eec201\final_project\StudentAudioRecording\zero16_test_3.mat");
test16=c16.cepstrum_frames;
c17=matfile("C:\Users\arind\Documents\winter_quarter_2024\eec201\final_project\StudentAudioRecording\zero17_test_3.mat");
test17=c17.cepstrum_frames;
c18=matfile("C:\Users\arind\Documents\winter_quarter_2024\eec201\final_project\StudentAudioRecording\zero18_test_3.mat");
test18=c18.cepstrum_frames;
c19=matfile("C:\Users\arind\Documents\winter_quarter_2024\eec201\final_project\StudentAudioRecording\zero19_test_3.mat");
test19=c19.cepstrum_frames;


% enter the sample you want to execute

test_signal=test15;
%test_signal(:,1:7)=[];

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
% x5=disteu(centroid5,test_signal);
% for i=1:size(x5,2)
%     framedist(5,i)=min(x5(:,i));
% end


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

x12=disteu(centroid12,test_signal);
for i=1:size(x12,2)
    framedist(12,i)=min(x12(:,i));
end

x13=disteu(centroid13,test_signal);
for i=1:size(x13,2)
    framedist(13,i)=min(x13(:,i));
end

x14=disteu(centroid14,test_signal);
for i=1:size(x14,2)
    framedist(14,i)=min(x14(:,i));
end

x15=disteu(centroid15,test_signal);
for i=1:size(x15,2)
    framedist(15,i)=min(x15(:,i));
end


x16=disteu(centroid16,test_signal);
for i=1:size(x16,2)
    framedist(16,i)=min(x16(:,i));
end


x17=disteu(centroid17,test_signal);
for i=1:size(x17,2)
    framedist(17,i)=min(x17(:,i));
end

x18=disteu(centroid18,test_signal);
for i=1:size(x18,2)
    framedist(18,i)=min(x18(:,i));
end

x19=disteu(centroid19,test_signal);
for i=1:size(x19,2)
    framedist(19,i)=min(x19(:,i));
end


framedist(:,1)=[];
%majority decision
speaker = 1;
min_dist = sum(framedist(1,:));

dist=[];
dist=[dist min_dist];
for i= 2:size(framedist,1)
    if i==5
        continue;
    end
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