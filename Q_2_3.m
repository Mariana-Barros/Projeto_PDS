% Q 2.3

% Leitura da imagem
RGB = imread('dalton.bmp');
figure
imshow(RGB)

% Converter imagem RGB para HSV
HSV = rgb2hsv(RGB);

% Separar as componentes Hue, Saturation e Value da imagem
hComp = HSV(:,:,1);
sComp = HSV(:,:,2);
vComp = HSV(:,:,3);

% Mexer nos thresholds para dividir a imagem em azul e amarelo
hComp(hComp<=0.1)= 0.7;
hComp(hComp>=0.9)= 0.7;

% Aumentar a saturação da imagem
sComp = sComp *3;

% Colocar os componentes modificados na imagem original
HSV(:,:,1) = hComp;
HSV(:,:,2) = sComp;

% Converter a imagem de HSV para RGB
RGB2 = hsv2rgb(HSV);

% Mostrar a imagem final
figure
imshow(RGB2)
