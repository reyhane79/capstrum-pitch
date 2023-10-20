[spch,Fs]=audioread('a.wav');
fl=400; %**** sample number of each frame(N)
fs=160; %**** frame shift(M)


FN=ceil(length(spch)/fs);
f_num=1:FN;
y= buffer (spch,fl,fl-fs);%har frame be yek sotoon tabdil mishavad
avr=zeros(1,floor(FN));
w1=hamming(fl);
%w2=rectwin(fl);
for i=1:FN
    y(:,i)=y(:,i).*w1;
    y(:,i)=y(:,i).*w1; %windowing
end
%*******************************
energy=zeros(1,size(y,2));
for i=1:size(y,2)
    frame=y(:,i);
    frameEnergy=transpose(frame)*frame;
    energy(1,i)=frameEnergy;
end
[maxEnergy,Indice] = max(energy);

pitchi= cepstrum(y(:,100),Fs);%100 is a arbitary number can be changed!
disp(pitchi);

%{
figure('Name','cepstral coeficients calculation result','NumberTitle','off')
xlabel('samples')
ylabel('frequency')
title('a.wav pitch frequency based on cepstral analysis')
xlim([1,size(y,2)]);
ylim([1,400]);
hold on;


for i=1:size(y,2)
    if(energy(1,i)>0.333*maxEnergy)
        pitchi= cepstrum(y(:,i),Fs);
        plot(i,pitchi,'rx');
    end
end
%}
