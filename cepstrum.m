
function pitchi = cepstrum(x, fs)

% x - signal in the time domain
% fs - sampling frequency, Hz
% C - real cepstrum


% length of the signal
N = length(x);


% calculate the number of unique fft points
NumUniquePts = ceil((N+1)/2);
z=(1:NumUniquePts);
% cepstral analysis
C = real(ifft(log(abs(fft(x)))));       % cepstrum
C = C(1:NumUniquePts);                  % because of simmerty of cepstrum function


%for pitch frequency
highFilter=[zeros(20,1);ones(size(C,1)-20,1)];
pitchQfrency=highFilter.*C;
[~,IPos] = max(pitchQfrency);
pitchi=fs/IPos;
%plot(z,pitchQfrency);
%xlabel('samples')
end
