% Plotar a DFT de w = Magnitude e fase

n = 0:0.01:10;
fs = 1000;

% Gerar o sinal e a sua transformada de Fourrier
y = sin(20*pi*n) + cos(30*pi*n);
z = sin(40*pi*n) + cos(60*pi*n);
w = [y z];
W = fft(w);
m = 0:length(W) - 1;

% Plotar a sequência, magnitude e fase do sinal
subplot(3, 1, 1); stem(w); xlabel('n');ylabel('w(n)');title('Sequencia');
xlim([0 2000]);
subplot(3, 1, 2); stem(m*fs/length(W), abs(W), 'b'); ylabel('magnitude');
xlabel('frequencia (Hz)'); title('Magnitude da Resposta em Frequencia');
subplot(3,1,3); stem(m*fs/length(W), angle(W), 'b'); ylabel('Angulo');
xlabel('frequencia (Hz)'); title('Fase');