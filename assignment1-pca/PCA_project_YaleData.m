clear all
load Yale_64x64.mat


faceW = 64;
faceH = 64;
numPerLine = 11;
ShowLine = 15;
Y = zeros(faceH*ShowLine,faceW*numPerLine); 
for i=0:ShowLine-1
    for j=0:numPerLine-1 
        Y(i*faceH+1:(i+1)*faceH,j*faceW+1:(j+1)*faceW) = reshape(fea(i*numPerLine+j+1,:),[faceH,faceW]);
    end
end
figure()
imagesc(Y);colormap(gray);
axis off;
title("Fea Matrix", FontSize=22)
subtitle("11 different faces for 15 different individuals", FontSize=18)


% (a) Extract in a submatrix F and plot 6 different faces for 5 different 
% individuals as gray scale images. Choose faces that you think are in 
% some sense representative between the different groups (normal, sad, 
% happy, surprised, sleepy, wink).
n_col = 6; %faces
n_row = 5; %individuals
K = zeros(faceH*n_row,faceW*n_col); 
for i=0:n_row-1
    for j=0:n_col-1 
        K(i*faceH+1:(i+1)*faceH,j*faceW+1:(j+1)*faceW) = reshape(fea(i*11+(j+1),:),[faceH,faceW]);
    end
end
figure()
imagesc(K);colormap(gray); 
axis off;
title("Original images", FontSize=22)
subtitle("6 different faces for 5 different individuals", FontSize=18)


% (b) After having computed the first singular values/vectors of F, 
% plot the singular values and comment on how fast (or slowly) they 
% decrease. Notice, however, that computing the full SVD may be very slow, 
% so use svds, increasing gradually r. It may be more informative to plot 
% their logarithms.
n_col = 6; %faces
n_row = 5; %individuals
K_fea = zeros(n_col*n_row, faceH*faceW); 
counter = 0;
for i=0:n_row-1
    for j=0:n_col-1 
        counter = counter + 1;
        K_fea(counter,:) = fea(i*11+(j+1),:);
    end
end
r = rank(K_fea); %it's equa to 30
[U,D,V] = svd(K_fea);
figure()
semilogy(diag(D), '*-', 'MarkerSize', 10)
set(gca, 'FontSize', 15)
ylabel("Singular value")
xlabel("individual face")
title("Plot of the singular values", FontSize=20)
subtitle("Singular values plotted in a logarithmic scale", FontSize=12)


% (c) Plot the first 5 feature vectors (columns of U) as gray scale images.
%in this case, I have that the right singular vectors 
for j = 1:5
    figure()
    imagesc(reshape(V(:,j), faceH, faceW))
    colormap(gray);
    axis('equal')
    axis('off')
    title(j + "th feature vector", FontSize=22)
end


% (d) Approximate the 5 images corresponding to the columns that you 
% selected by a linear combination of the first k = 4; 8; 15 feature 
% vectors with coefficients their principal components. Each time display 
% the approximation and difference between it and the original data in the 
% form of a gray scale image.
n_col = 6;
n_row = 5;
for k = [4, 8, 15]
    Z_k = U(:,1:k)' * K_fea;
    X_k = U(:,1:k) * Z_k;
    fea_diff = K_fea - X_k;
    APPR = zeros(faceH * n_row, faceW * n_col);
    DIFF = zeros(faceH * n_row, faceW * n_col);
    counter = 0;

    for i = 0:n_row - 1
        for j = 0:n_col - 1 
            counter = counter + 1;
            % Approximation matrix
            APPR(i*faceH+1:(i+1)*faceH, j*faceW+1:(j+1)*faceW) = reshape(X_k(counter, :), [faceH, faceW]);

            % Difference matrix
            DIFF(i*faceH+1:(i+1)*faceH, j*faceW+1:(j+1)*faceW) = reshape(fea_diff(counter, :), [faceH, faceW]);
        end
    end
    figure;
    imagesc(APPR);
    colormap gray;
    title("Approximation for k = " + k, FontSize=22);
    subtitle("Original images approximated by " + k + " feature vectors", FontSize=18)
    axis off;
    
    figure;
    imagesc(DIFF);
    colormap gray;
    title("Difference for k = " + k, FontSize=22);
    subtitle("Difference between the original images and the approximated one", FontSize=18)
    axis off;
end