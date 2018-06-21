% Q 2.2

% Leitura da imagem
im = imread('alumgrns.bmp');
% figure
% imshow(im)

% Aplicando filtro de m�dias na imagem para corrigir imperfei��es
n = 7;
im2 = medfilt2(im,[n n]);
% figure
% imshow(im2)

% Preenche os buracos da imagem
im3 = imfill(im2, 'holes');
% figure
% imshow(im3)

% Calcula o histograma da imagem
histogram = imhist(im3);
%figure, imhist(im3)

% Retira da imagem a menor ocorr�ncia do histograma
minValue = find(histogram(2:end)>0,1);
im3 = (im3 - minValue);
% figure
% imshow(im3)

% Normaliza��o do histograma
histogram = imhist(im3);
maxIndex = find(fliplr(histogram()) == 0, 1);
im3 = im3 * ( 255 / maxIndex);
figure
imshow(im3)

% Calculo da m�dia e do desvio padr�o do histograma
histogram = imhist(im3, 100);
sumHist = sum(histogram);
avgHist = mean2(histogram);
stdDevHist = std2(histogram);
numberOfTextures =  size( find( histogram > (avgHist + stdDevHist)));
numberOfTextures = numberOfTextures(1)


