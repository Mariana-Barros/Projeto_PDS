%Q 1.1.c = Plotar o espectrograma do sinal w

n = 0:0.01:10;
fs = 1000;

% Gerar o sinal e a sua transformada de Fourrier
y = sin(20*pi*n) + cos(30*pi*n);
z = sin(40*pi*n) + cos(60*pi*n);
w = [y z];
W = fft(w);
m = 0:length(W) - 1;

% Gerar e plotar o espectrograma de w
[B,f,t]=specgram(w,1024,fs,256,192);
bmin=max(max(abs(B)))/300;
imagesc(t,f,20*log10(max(abs(B),bmin)/bmin));
axis xy; xlabel('Time (s)'); ylabel('Frequency (Hz)');
colormap(jet);