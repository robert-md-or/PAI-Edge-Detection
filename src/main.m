%% PAI Proiect - Segmentarea imaginilor bazata pe contururi
% Autor: Moldovan Robert
% Universitatea din Oradea - Electronica Aplicata, An 3
% Imagini: fotografie aeriana cu drona DJI, regiunea Oradea

clc;
clear all;
close all;

%% 1. Incarcare imagini
disp('=== Incarcare imagini ===');

img1 = imread('../images/input/img1_noapte.jpg');
img2 = imread('../images/input/img2_lac.jpg');
img3 = imread('../images/input/img3_sosea.jpg');

disp('Imagini incarcate cu succes!');

%% 2. Redimensionare si conversie la grayscale
% Redimensionam la 1920x1080 pentru procesare optima
img1 = imresize(img1, [1080 1920]);
img2 = imresize(img2, [1080 1920]);
img3 = imresize(img3, [1080 1920]);

img1_gray = rgb2gray(img1);
img2_gray = rgb2gray(img2);
img3_gray = rgb2gray(img3);

disp('Redimensionare completa: 1920x1080');
%% 3. Afisare imagini originale
figure('Name', 'Imagini Originale', 'NumberTitle', 'off');

subplot(1,3,1);
imshow(img1);
title('IMG1 - Primaria Oradea (noapte)', 'FontSize', 12);

subplot(1,3,2);
imshow(img2);
title('IMG2 - Lac si padure (zi)', 'FontSize', 12);

subplot(1,3,3);
imshow(img3);
title('IMG3 - Sosea la apus', 'FontSize', 12);

sgtitle('Imagini originale - Fotografii aeriene DJI', 'FontSize', 14, 'FontWeight', 'bold');

%% 4. Afisare grayscale
figure('Name', 'Imagini Grayscale', 'NumberTitle', 'off');

subplot(1,3,1);
imshow(img1_gray);
title('IMG1 - Grayscale', 'FontSize', 12);

subplot(1,3,2);
imshow(img2_gray);
title('IMG2 - Grayscale', 'FontSize', 12);

subplot(1,3,3);
imshow(img3_gray);
title('IMG3 - Grayscale', 'FontSize', 12);

sgtitle('Imagini convertite la niveluri de gri', 'FontSize', 14, 'FontWeight', 'bold');

disp('Pasul 1 complet - imagini afisate!');

%% 5. Detectie contururi - Operator SOBEL
disp('=== Operator Sobel ===');

% Aplicam Sobel pe toate 3 imaginile
edges1_sobel = edge(img1_gray, 'Sobel');
edges2_sobel = edge(img2_gray, 'Sobel');
edges3_sobel = edge(img3_gray, 'Sobel');

% Afisare rezultate Sobel
figure('Name', 'Sobel', 'NumberTitle', 'off');

subplot(3,2,1); imshow(img1_gray); title('IMG1 - Grayscale', 'FontSize', 11);
subplot(3,2,2); imshow(edges1_sobel); title('IMG1 - Sobel', 'FontSize', 11);

subplot(3,2,3); imshow(img2_gray); title('IMG2 - Grayscale', 'FontSize', 11);
subplot(3,2,4); imshow(edges2_sobel); title('IMG2 - Sobel', 'FontSize', 11);

subplot(3,2,5); imshow(img3_gray); title('IMG3 - Grayscale', 'FontSize', 11);
subplot(3,2,6); imshow(edges3_sobel); title('IMG3 - Sobel', 'FontSize', 11);

sgtitle('Detectie contururi - Operator Sobel', 'FontSize', 14, 'FontWeight', 'bold');

disp('Sobel complet!');

%% 6. Pre-procesare - Filtru Gaussian + Sobel imbunatatit
disp('=== Gaussian + Sobel ===');

% Aplicam filtru gaussian pentru reducerea zgomotului
img1_blur = imgaussfilt(img1_gray, 2);
img2_blur = imgaussfilt(img2_gray, 2);
img3_blur = imgaussfilt(img3_gray, 2);

% Sobel pe imaginile filtrate
edges1_sobel_blur = edge(img1_blur, 'Sobel');
edges2_sobel_blur = edge(img2_blur, 'Sobel');
edges3_sobel_blur = edge(img3_blur, 'Sobel');

% Afisare comparatie: Sobel fara vs cu gaussian
figure('Name', 'Sobel vs Gaussian+Sobel', 'NumberTitle', 'off');

subplot(3,2,1); imshow(edges1_sobel); title('IMG1 - Sobel (fara filtru)', 'FontSize', 11);
subplot(3,2,2); imshow(edges1_sobel_blur); title('IMG1 - Gaussian + Sobel', 'FontSize', 11);

subplot(3,2,3); imshow(edges2_sobel); title('IMG2 - Sobel (fara filtru)', 'FontSize', 11);
subplot(3,2,4); imshow(edges2_sobel_blur); title('IMG2 - Gaussian + Sobel', 'FontSize', 11);

subplot(3,2,5); imshow(edges3_sobel); title('IMG3 - Sobel (fara filtru)', 'FontSize', 11);
subplot(3,2,6); imshow(edges3_sobel_blur); title('IMG3 - Gaussian + Sobel', 'FontSize', 11);

sgtitle('Comparatie: Sobel direct vs Gaussian + Sobel', 'FontSize', 14, 'FontWeight', 'bold');

disp('Gaussian + Sobel complet!');

%% 7. Detectie contururi - Operator CANNY
disp('=== Operator Canny ===');

% Canny cu parametri default
edges1_canny = edge(img1_gray, 'Canny');
edges2_canny = edge(img2_gray, 'Canny');
edges3_canny = edge(img3_gray, 'Canny');

% Afisare comparatie Sobel vs Canny
figure('Name', 'Sobel vs Canny', 'NumberTitle', 'off');

subplot(3,2,1); imshow(edges1_sobel); title('IMG1 - Sobel', 'FontSize', 11);
subplot(3,2,2); imshow(edges1_canny); title('IMG1 - Canny', 'FontSize', 11);

subplot(3,2,3); imshow(edges2_sobel); title('IMG2 - Sobel', 'FontSize', 11);
subplot(3,2,4); imshow(edges2_canny); title('IMG2 - Canny', 'FontSize', 11);

subplot(3,2,5); imshow(edges3_sobel); title('IMG3 - Sobel', 'FontSize', 11);
subplot(3,2,6); imshow(edges3_canny); title('IMG3 - Canny', 'FontSize', 11);

sgtitle('Comparatie: Sobel vs Canny', 'FontSize', 14, 'FontWeight', 'bold');

% Canny cu parametri ajustati manual
% [threshold_low, threshold_high] - valori intre 0 si 1
% Parametri optimizati pentru fiecare imagine in parte
edges1_canny_fine = edge(img1_gray, 'Canny', [0.08 0.20], 3);  % noapte - mai mult blur
edges2_canny_fine = edge(img2_gray, 'Canny', [0.06 0.18], 1.5); % lac - blur mediu
edges3_canny_fine = edge(img3_gray, 'Canny', [0.10 0.25], 2);  % apus - praguri mai mari

% Afisare Canny default vs Canny ajustat
figure('Name', 'Canny default vs Canny ajustat', 'NumberTitle', 'off');

subplot(3,2,1); imshow(edges1_canny); title('IMG1 - Canny default', 'FontSize', 11);
subplot(3,2,2); imshow(edges1_canny_fine); title('IMG1 - Canny ajustat', 'FontSize', 11);

subplot(3,2,3); imshow(edges2_canny); title('IMG2 - Canny default', 'FontSize', 11);
subplot(3,2,4); imshow(edges2_canny_fine); title('IMG2 - Canny ajustat', 'FontSize', 11);

subplot(3,2,5); imshow(edges3_canny); title('IMG3 - Canny default', 'FontSize', 11);
subplot(3,2,6); imshow(edges3_canny_fine); title('IMG3 - Canny ajustat', 'FontSize', 11);

sgtitle('Canny: parametri default vs ajustati manual', 'FontSize', 14, 'FontWeight', 'bold');

disp('Canny complet!');

%% 8. Operator PREWITT
disp('=== Operator Prewitt ===');

edges1_prewitt = edge(img1_gray, 'Prewitt');
edges2_prewitt = edge(img2_gray, 'Prewitt');
edges3_prewitt = edge(img3_gray, 'Prewitt');

figure('Name', 'Prewitt', 'NumberTitle', 'off');

subplot(3,2,1); imshow(edges1_sobel); title('IMG1 - Sobel', 'FontSize', 11);
subplot(3,2,2); imshow(edges1_prewitt); title('IMG1 - Prewitt', 'FontSize', 11);

subplot(3,2,3); imshow(edges2_sobel); title('IMG2 - Sobel', 'FontSize', 11);
subplot(3,2,4); imshow(edges2_prewitt); title('IMG2 - Prewitt', 'FontSize', 11);

subplot(3,2,5); imshow(edges3_sobel); title('IMG3 - Sobel', 'FontSize', 11);
subplot(3,2,6); imshow(edges3_prewitt); title('IMG3 - Prewitt', 'FontSize', 11);

sgtitle('Comparatie: Sobel vs Prewitt', 'FontSize', 14, 'FontWeight', 'bold');

disp('Prewitt complet!');

%% 9. Laplacian of Gaussian (LoG)
disp('=== Laplacian of Gaussian (LoG) ===');

edges1_log = edge(img1_gray, 'log');
edges2_log = edge(img2_gray, 'log');
edges3_log = edge(img3_gray, 'log');

figure('Name', 'Laplacian of Gaussian', 'NumberTitle', 'off');

subplot(3,2,1); imshow(edges1_canny_fine); title('IMG1 - Canny ajustat', 'FontSize', 11);
subplot(3,2,2); imshow(edges1_log); title('IMG1 - LoG', 'FontSize', 11);

subplot(3,2,3); imshow(edges2_canny_fine); title('IMG2 - Canny ajustat', 'FontSize', 11);
subplot(3,2,4); imshow(edges2_log); title('IMG2 - Laplacian of Gaussian', 'FontSize', 11);

subplot(3,2,5); imshow(edges3_canny_fine); title('IMG3 - Canny ajustat', 'FontSize', 11);
subplot(3,2,6); imshow(edges3_log); title('IMG3 - Laplacian of Gaussian', 'FontSize', 11);

sgtitle('Comparatie: Canny ajustat vs Laplacian of Gaussian', 'FontSize', 14, 'FontWeight', 'bold');

disp('LoG complet!');

%% 10. FIGURA FINALA DE COMPARATIE - toate metodele
disp('=== Figura finala de comparatie ===');

metode = {'Original', 'Sobel', 'Gaussian+Sobel', 'Prewitt', 'Canny ajustat', 'LoG'};

% --- IMG1 - Primaria Oradea noapte ---
figure('Name', 'Comparatie completa - IMG1 Noapte', 'NumberTitle', 'off');

subplot(2,3,1); imshow(img1_gray);        title('Original', 'FontSize', 11);
subplot(2,3,2); imshow(edges1_sobel);     title('Sobel', 'FontSize', 11);
subplot(2,3,3); imshow(edges1_sobel_blur);title('Gaussian + Sobel', 'FontSize', 11);
subplot(2,3,4); imshow(edges1_prewitt);   title('Prewitt', 'FontSize', 11);
subplot(2,3,5); imshow(edges1_canny_fine);title('Canny ajustat', 'FontSize', 11);
subplot(2,3,6); imshow(edges1_log);       title('LoG', 'FontSize', 11);

sgtitle('IMG1 - Primaria Oradea (noapte) - Toate metodele', 'FontSize', 13, 'FontWeight', 'bold');

% --- IMG2 - Lac si padure ---
figure('Name', 'Comparatie completa - IMG2 Lac', 'NumberTitle', 'off');

subplot(2,3,1); imshow(img2_gray);        title('Original', 'FontSize', 11);
subplot(2,3,2); imshow(edges2_sobel);     title('Sobel', 'FontSize', 11);
subplot(2,3,3); imshow(edges2_sobel_blur);title('Gaussian + Sobel', 'FontSize', 11);
subplot(2,3,4); imshow(edges2_prewitt);   title('Prewitt', 'FontSize', 11);
subplot(2,3,5); imshow(edges2_canny_fine);title('Canny ajustat', 'FontSize', 11);
subplot(2,3,6); imshow(edges2_log);       title('LoG', 'FontSize', 11);

sgtitle('IMG2 - Lac si padure (zi) - Toate metodele', 'FontSize', 13, 'FontWeight', 'bold');

% --- IMG3 - Sosea la apus ---
figure('Name', 'Comparatie completa - IMG3 Sosea', 'NumberTitle', 'off');

subplot(2,3,1); imshow(img3_gray);        title('Original', 'FontSize', 11);
subplot(2,3,2); imshow(edges3_sobel);     title('Sobel', 'FontSize', 11);
subplot(2,3,3); imshow(edges3_sobel_blur);title('Gaussian + Sobel', 'FontSize', 11);
subplot(2,3,4); imshow(edges3_prewitt);   title('Prewitt', 'FontSize', 11);
subplot(2,3,5); imshow(edges3_canny_fine);title('Canny ajustat', 'FontSize', 11);
subplot(2,3,6); imshow(edges3_log);       title('LoG', 'FontSize', 11);

sgtitle('IMG3 - Sosea la apus - Toate metodele', 'FontSize', 13, 'FontWeight', 'bold');

disp('=== Toate figurile generate cu succes! ===');

%% 11. ANALIZA CANTITATIVA - densitatea contururilor
disp('=== Analiza cantitativa ===');

% Functie care calculeaza procentul de pixeli de contur detectati
density = @(img) (sum(img(:)) / numel(img)) * 100;

% Calculam densitatea pentru fiecare metoda si imagine
results = zeros(3, 5); % 3 imagini, 5 metode

results(1,:) = [density(edges1_sobel), density(edges1_sobel_blur), ...
    density(edges1_prewitt), density(edges1_canny_fine), density(edges1_log)];

results(2,:) = [density(edges2_sobel), density(edges2_sobel_blur), ...
    density(edges2_prewitt), density(edges2_canny_fine), density(edges2_log)];

results(3,:) = [density(edges3_sobel), density(edges3_sobel_blur), ...
    density(edges3_prewitt), density(edges3_canny_fine), density(edges3_log)];

% Afisare tabel in Command Window
metode_nume = {'Sobel', 'Gauss+Sobel', 'Prewitt', 'Canny', 'LoG'};
imagini_nume = {'IMG1 Noapte', 'IMG2 Lac', 'IMG3 Sosea'};

fprintf('\n%-15s %12s %12s %12s %12s %12s\n', 'Imagine', metode_nume{:});
fprintf('%s\n', repmat('-', 1, 75));
for i = 1:3
    fprintf('%-15s %11.3f%% %11.3f%% %11.3f%% %11.3f%% %11.3f%%\n', ...
        imagini_nume{i}, results(i,1), results(i,2), results(i,3), results(i,4), results(i,5));
end

%% 12. Grafic bar - densitatea contururilor
figure('Name', 'Analiza cantitativa - Densitatea contururilor', 'NumberTitle', 'off');

bar(results);
set(gca, 'XTickLabel', imagini_nume, 'FontSize', 11);
legend(metode_nume, 'Location', 'northwest', 'FontSize', 10);
ylabel('Densitate contururi (%)', 'FontSize', 12);
title('Analiza cantitativa: Densitatea pixelilor de contur per metoda', ...
    'FontSize', 13, 'FontWeight', 'bold');
grid on;

disp('=== Analiza cantitativa completa! ===');
disp('=== PROIECT COMPLET! ===');

%% 13. SALVARE FIGURI pentru raport
disp('=== Salvare figuri ===');

% Cream folderul output daca nu exista
if ~exist('../images/output', 'dir')
    mkdir('../images/output');
end

% Obtinem toate figurile deschise
fig_handles = findall(0, 'Type', 'figure');
fig_names = {'analiza_cantitativa', 'comparatie_img3', 'comparatie_img2', ...
    'comparatie_img1', 'canny_ajustat_vs_default', 'sobel_vs_canny', ...
    'gaussian_sobel', 'sobel', 'grayscale', 'originale'};

for i = 1:length(fig_handles)
    if i <= length(fig_names)
        filename = sprintf('../images/output/%s.png', fig_names{i});
        exportgraphics(fig_handles(i), filename, 'Resolution', 300);
        fprintf('Salvat: %s\n', filename);
    end
end

disp('=== Toate figurile salvate in images/output/ ===');