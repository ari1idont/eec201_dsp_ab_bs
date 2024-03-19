[audio,Fs]=audioread('C:\Users\arind\Documents\winter_quarter_2024\eec201\final_project\StudentAudioRecording\Zero-Testing\Zero_test19.wav');
audio1=resample(audio,7,60);
Fs=Fs*7/60;
frame_length=0.020;
overlap_length=0.01;  
pre_emphasized_audio = filter([1, -0.97], 1, audio1);
frame_size = round(Fs * frame_length);
frame_step = round(Fs * overlap_length);
frames = buffer(pre_emphasized_audio, frame_size, frame_size - frame_step, 'nodelay');



[frames1, f,t]=stft(pre_emphasized_audio,Fs,Window=hamming(frame_size),OverlapLength=frame_step,FFTLength=512);
ps=(abs(frames1).^2)./512;
m=size(ps);



filter_banks=20;
frame_length_f=size(ps,1);
m1=melfb(filter_banks,frame_length_f,Fs);
n2=1+floor(frame_length_f/2);
mel_frames=[];
for i=1:m(2)
    temp2=m1*abs(ps(1:n2,i)).^2;
    mel_frames=[mel_frames temp2];
end



plot(linspace(0, (12500/2), 129), melfb(20, 256, 12500)'),
title('Mel-spaced filterbank'), xlabel('Frequency (Hz)');

%DCT
n3=0:19;
cepstrum_frames=[];
for k=2:20
    cepstrum_frames_temp=[];

    for i=1:m(2)
    temp3=mel_frames(k,i);
    temp3=log10(temp3);
    temp4=temp3*cos(n3*(k-0.5)*pi/20);
    temp5=sum(temp4);
    cepstrum_frames_temp=[cepstrum_frames_temp temp5];
    end
    cepstrum_frames=[cepstrum_frames; cepstrum_frames_temp];

end
cepstrum_frames = cepstrum_frames(:,all(~isnan(cepstrum_frames)));


save('C:\Users\arind\Documents\winter_quarter_2024\eec201\final_project\StudentAudioRecording\zero19_test_3.mat',"cepstrum_frames")
% figure
% for i=1:19
%     x=spectrogram(cepstrum_frames(i,:));
%     spectrogram(x)
%     hold on
% end




function m = melfb(p,n,fs)
    f0 = 700 / fs;
    fn2 = floor(n/2);
    lr = log(1 + 0.5/f0) / (p+1);
    % convert to fft bin numbers with 0 for DC term
    bl = n * (f0 * (exp([0 1 p p+1] * lr) - 1));
    b1 = floor(bl(1)) + 1;
    b2 = ceil(bl(2));
    b3 = floor(bl(3));
    b4 = min(fn2, ceil(bl(4))) - 1;
    pf = log(1 + (b1:b4)/n/f0) / lr;
    fp = floor(pf);
    pm = pf - fp;
    r = [fp(b2:b4) 1+fp(1:b3)];
    c = [b2:b4 1:b3] + 1;
    v = 2 * [1-pm(b2:b4) pm(1:b3)];
    m = sparse(r, c, v, p, 1+fn2);
end