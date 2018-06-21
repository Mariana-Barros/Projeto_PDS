% Q 2.2

% Leitura da imagem
im = imread('alumgrns.bmp');
% figure
% imshow(im)

% Aplicando filtro de médias na imagem para corrigir imperfeições
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

% Retira da imagem a menor ocorrência do histograma
minValue = find(histogram(2:end)>0,1);
im3 = (im3 - minValue);
% figure
% imshow(im3)

% Normalização do histograma
histogram = imhist(im3);
maxIndex = find(fliplr(histogram()) == 0, 1);
im3 = im3 * ( 255 / maxIndex);
figure
imshow(im3)

% Calculo da média e do desvio padrão do histograma
histogram = imhist(im3, 100);
sumHist = sum(histogram);
avgHist = mean2(histogram);
stdDevHist = std2(histogram);
numberOfTextures =  size( find( histogram > (avgHist + stdDevHist)));
numberOfTextures = numberOfTextures(1)


