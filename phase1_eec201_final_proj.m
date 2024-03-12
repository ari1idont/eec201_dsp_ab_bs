%frame
[audio,Fs]=audioread('C:\Users\arind\Documents\winter_quarter_2024\eec201\final_project\Training_Data\s8.wav');
frame_length=0.02;
overlap_length=0.01;
pre_emphasized_audio = filter([1, -0.97], 1, audio);
frame_size = round(Fs * frame_length);
frame_step = round(Fs * overlap_length);
frames = buffer(pre_emphasized_audio, frame_size, frame_size - frame_step, 'nodelay');

figure
plot(audio)
figure
plot(frames(:,10));
%windowing
hamming_window = hamming(frame_size);
windowed_frames = frames .* hamming_window;
figure
plot(windowed_frames(:,10));
%FFT
fft_frames=[];
m=size(windowed_frames);
for i=1:m(2)
    temp1=fft(windowed_frames(:,i));
    fft_frames=[fft_frames temp1];
end

figure
plot(abs(fft_frames(:,10)))

%Mel frequency bank
filter_banks=20;
frame_length_f=length(fft_frames);
m1=melfb(filter_banks,length(fft_frames),Fs);
n2=1+floor(frame_length_f/2);
mel_frames=[];
for i=1:m(2)
    temp2=m1*abs(fft_frames(1:n2,i)).^2;
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

save('s8.mat',"cepstrum_frames")


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





