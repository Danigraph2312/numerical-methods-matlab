%% PCA - Wine Data
clear all
close all

load("WineData.mat")

I1 = find(I == 1);
I2 = find(I == 2);
I3 = find(I == 3);

%SVD
[U, D, ~] = svd(X, 'econ');
Z = U(:, 1:3)' * X;

% Histogram for PCA component 1
figure;
t = tiledlayout(4, 4, 'TileSpacing', 'Compact', 'Padding', 'Compact');

ax1 = nexttile(1, [3, 1]);
histogram(Z(1, I1), 'FaceColor', [0 0.4470 0.7410], 'FaceAlpha', 0.7)
hold on;
histogram(Z(1, I2), 'FaceColor', [0.8500 0.3250 0.0980], 'FaceAlpha', 0.7)
histogram(Z(1, I3), 'FaceColor', [0.9290 0.6940 0.1250], 'FaceAlpha', 0.7)
view(ax1, 90, -90); % Rotate the histogram to align it vertically
title('Histogram of PCA 1');
hold off;

% Scatter plot of PCA components 1 and 2
ax2 = nexttile(2, [3, 3]);
scatter(Z(1, I1), Z(2, I1), 20, 'filled', "MarkerFaceColor", [0 0.4470 0.7410])
hold on;
scatter(Z(1, I2), Z(2, I2), 20, 'filled', "MarkerFaceColor", [0.8500 0.3250 0.0980])
scatter(Z(1, I3), Z(2, I3), 20, 'filled', "MarkerFaceColor", [0.9290 0.6940 0.1250])
xlabel('PCA Component 1', 'FontSize', 11);
ylabel('PCA Component 2', 'FontSize', 11);
legend('Cultivar 1', 'Cultivar 2', 'Cultivar 3');
hold off;
title('Scatter-plot of the two-dimensional projection', 'FontSize', 13)
subtitle('PCA 1 VS PCA 2', 'FontSize', 11.5)

% Histogram for PCA component 2 (below x-axis)
ax3 = nexttile(14, [1, 3]);
histogram(Z(2, I1), 'FaceColor', [0 0.4470 0.7410], 'FaceAlpha', 0.7)
hold on;
histogram(Z(2, I2), 'FaceColor', [0.8500 0.3250 0.0980], 'FaceAlpha', 0.7)
histogram(Z(2, I3), 'FaceColor', [0.9290 0.6940 0.1250], 'FaceAlpha', 0.7)
title('Histogram of PCA 2');
hold off;

% Plot projections on PCA components 1 and 3
figure;
t = tiledlayout(4, 4, 'TileSpacing', 'Compact', 'Padding', 'Compact');

% Histogram for PCA component 3 (left y-axis)
ax1 = nexttile(1, [3, 1]);
histogram(Z(3, I1), 'FaceColor', [0 0.4470 0.7410], 'FaceAlpha', 0.7)
hold on;
histogram(Z(3, I2), 'FaceColor', [0.8500 0.3250 0.0980], 'FaceAlpha', 0.7)
histogram(Z(3, I3), 'FaceColor', [0.9290 0.6940 0.1250], 'FaceAlpha', 0.7)
view(ax1, 90, -90); % Rotate the histogram to align it vertically
title('Histogram of PCA 3');
hold off;

% Scatter plot of PCA components 1 and 3
ax2 = nexttile(2, [3, 3]);
scatter(Z(1, I1), Z(3, I1), 20, 'filled', "MarkerFaceColor", [0 0.4470 0.7410])
hold on;
scatter(Z(1, I2), Z(3, I2), 20, 'filled', "MarkerFaceColor", [0.8500 0.3250 0.0980])
scatter(Z(1, I3), Z(3, I3), 20, 'filled', "MarkerFaceColor", [0.9290 0.6940 0.1250])
xlabel('PCA Component 1', 'FontSize', 11);
ylabel('PCA Component 3', 'FontSize', 11);
legend('Cultivar 1', 'Cultivar 2', 'Cultivar 3');
hold off;
title('Scatter-plot of the two-dimensional projection', 'FontSize', 13)
subtitle('PCA 1 VS PCA 3', 'FontSize', 11.5)

% Histogram for PCA component 1 (below x-axis)
ax3 = nexttile(14, [1, 3]);
histogram(Z(1, I1), 'FaceColor', [0 0.4470 0.7410], 'FaceAlpha', 0.7)
hold on;
histogram(Z(1, I2), 'FaceColor', [0.8500 0.3250 0.0980], 'FaceAlpha', 0.7)
histogram(Z(1, I3), 'FaceColor', [0.9290 0.6940 0.1250], 'FaceAlpha', 0.7)
title('Histogram of PCA 1');
hold off;

% Plot projections on PCA components 2 and 3
figure;
t = tiledlayout(4, 4, 'TileSpacing', 'Compact', 'Padding', 'Compact');

% Histogram for PCA component 3 (left y-axis)
ax1 = nexttile(1, [3, 1]);
histogram(Z(3, I1), 'FaceColor', [0 0.4470 0.7410], 'FaceAlpha', 0.7)
hold on;
histogram(Z(3, I2), 'FaceColor', [0.8500 0.3250 0.0980], 'FaceAlpha', 0.7)
histogram(Z(3, I3), 'FaceColor', [0.9290 0.6940 0.1250], 'FaceAlpha', 0.7)
view(ax1, 90, -90); % Rotate the histogram to align it vertically
title('Histogram of PCA 3');
hold off;

% Scatter plot of PCA components 2 and 3
ax2 = nexttile(2, [3, 3]);
scatter(Z(2, I1), Z(3, I1), 20, 'filled', "MarkerFaceColor", [0 0.4470 0.7410])
hold on;
scatter(Z(2, I2), Z(3, I2), 20, 'filled', "MarkerFaceColor", [0.8500 0.3250 0.0980])
scatter(Z(2, I3), Z(3, I3), 20, 'filled', "MarkerFaceColor", [0.9290 0.6940 0.1250])
xlabel('PCA Component 2', 'FontSize', 11);
ylabel('PCA Component 3', 'FontSize', 11);
legend('Cultivar 1', 'Cultivar 2', 'Cultivar 3');
hold off;
title('Scatter-plot of the two-dimensional projection', 'FontSize', 13)
subtitle('PCA 2 VS PCA 3', 'FontSize', 11.5)

% Histogram for PCA component 2 (below x-axis)
ax3 = nexttile(14, [1, 3]);
histogram(Z(2, I1), 'FaceColor', [0 0.4470 0.7410], 'FaceAlpha', 0.7)
hold on;
histogram(Z(2, I2), 'FaceColor', [0.8500 0.3250 0.0980], 'FaceAlpha', 0.7)
histogram(Z(2, I3), 'FaceColor', [0.9290 0.6940 0.1250], 'FaceAlpha', 0.7)
title('Histogram of PCA 2');
hold off;


%% LDA - Wine Dataset
clear all
close all

load("WineData.mat")

I1 = find(I == 1);
I2 = find(I == 2);
I3 = find(I == 3);

X1 = X(:, I1);
X2 = X(:, I2);
X3 = X(:, I3);

%cluster centroid 
p1 = length(I1);
c1 = mean(X1, 2);
X1c = X1 - c1;

p2 = length(I2);
c2 = mean(X2, 2);
X2c = X2 - c2;

p3 = length(I3);
c3 = mean(X3, 2);
X3c = X3 - c3;

%the within-cluster scatter matrix
Sw = X1c * X1c' + X2c * X2c' + X3c * X3c';

%the between-cluster scatter matrix
p = p1 + p2 + p3;
c = mean(X, 2);
Sb = p1 * (c1 - c) * (c1 - c)' + p2 * (c2 - c) * (c2 - c)' + p3 * (c3 - c) * (c3 - c)';

% Check if regularization is needed
epsilon = 1e-10;
if det(Sw) <= 1e-14
    disp('Regularization needed')
    Sw = Sw + epsilon * eye(size(Sw));
end

% Cholesky factorization of the within-cluster scatter matrix
K = chol(Sw, 'lower');
A = (K' \ Sb) / K;

%eigenvalues and eigenvectors of the matrix A
[W, D] = eig(A);
[D_sorted, idx] = sort(diag(D), 'descend');
W_lda = W(:, idx);

% Project data onto new feature space
Q = inv(K) * W_lda;
LDA_projection = Q(:, 1:3)' * X;

% Plot the results
figure;
t = tiledlayout(4, 4, 'TileSpacing', 'Compact', 'Padding', 'Compact');

% Histogram for LDA component 2 (left y-axis)
ax1 = nexttile(1, [3, 1]);
histogram(LDA_projection(2, I1), 'FaceColor', [0 0.4470 0.7410], 'FaceAlpha', 0.7)
hold on;
histogram(LDA_projection(2, I2), 'FaceColor', [0.8500 0.3250 0.0980], 'FaceAlpha', 0.7)
histogram(LDA_projection(2, I3), 'FaceColor', [0.9290 0.6940 0.1250], 'FaceAlpha', 0.7)
view(ax1, 90, -90)
title('Histogram of LDA 2');
hold off;

% Scatter plot of LDA components 1 and 2
ax2 = nexttile(2, [3, 3]);
scatter(LDA_projection(1, I1), LDA_projection(2, I1), 20, 'filled', "MarkerFaceColor", [0 0.4470 0.7410])
hold on;
scatter(LDA_projection(1, I2), LDA_projection(2, I2), 20, 'filled', "MarkerFaceColor", [0.8500 0.3250 0.0980])
scatter(LDA_projection(1, I3), LDA_projection(2, I3), 20, 'filled', "MarkerFaceColor", [0.9290 0.6940 0.1250])
xlabel('LDA Component 1', 'FontSize', 11);
ylabel('LDA Component 2', 'FontSize', 11);
legend('Cultivar 1', 'Cultivar 2', 'Cultivar 3');
hold off;
title('Scatter-plot of the the two-dimensional projection', 'FontSize', 13)
subtitle('LDA 1 VS LDA 2', 'FontSize', 11.5)

% Histogram for LDA component 1 (below x-axis)
ax3 = nexttile(14, [1, 3]);
histogram(LDA_projection(1, I1), 'FaceColor', [0 0.4470 0.7410], 'FaceAlpha', 0.7)
hold on;
histogram(LDA_projection(1, I2), 'FaceColor', [0.8500 0.3250 0.0980], 'FaceAlpha', 0.7)
histogram(LDA_projection(1, I3), 'FaceColor', [0.9290 0.6940 0.1250], 'FaceAlpha', 0.7)
title('Histogram of LDA 1');
hold off;

% Plot projections on LDA components 1 and 3
figure;
t = tiledlayout(4, 4, 'TileSpacing', 'Compact', 'Padding', 'Compact');

% Histogram for LDA component 3 (left y-axis)
ax1 = nexttile(1, [3, 1]);
histogram(LDA_projection(3, I1), 'FaceColor', [0 0.4470 0.7410], 'FaceAlpha', 0.7)
hold on;
histogram(LDA_projection(3, I2), 'FaceColor', [0.8500 0.3250 0.0980], 'FaceAlpha', 0.7)
histogram(LDA_projection(3, I3), 'FaceColor', [0.9290 0.6940 0.1250], 'FaceAlpha', 0.7)
view(ax1, 90, -90)
title('Histogram of LDA 3');
hold off;

% Scatter plot of LDA components 1 and 3
ax2 = nexttile(2, [3, 3]);
scatter(LDA_projection(1, I1), LDA_projection(3, I1), 20, 'filled', "MarkerFaceColor", [0 0.4470 0.7410])
hold on;
scatter(LDA_projection(1, I2), LDA_projection(3, I2), 20, 'filled', "MarkerFaceColor", [0.8500 0.3250 0.0980])
scatter(LDA_projection(1, I3), LDA_projection(3, I3), 20, 'filled', "MarkerFaceColor", [0.9290 0.6940 0.1250])
xlabel('LDA Component 1', 'FontSize', 11);
ylabel('LDA Component 3', 'FontSize', 11);
legend('Cultivar 1', 'Cultivar 2', 'Cultivar 3');
hold off;
title('Scatter-plot of the the two-dimensional projection', 'FontSize', 13)
subtitle('LDA 3 VS LDA 1', 'FontSize', 11.5)

% Histogram for LDA component 1 (below x-axis)
ax3 = nexttile(14, [1, 3]);
histogram(LDA_projection(1, I1), 'FaceColor', [0 0.4470 0.7410], 'FaceAlpha', 0.7)
hold on;
histogram(LDA_projection(1, I2), 'FaceColor', [0.8500 0.3250 0.0980], 'FaceAlpha', 0.7)
histogram(LDA_projection(1, I3), 'FaceColor', [0.9290 0.6940 0.1250], 'FaceAlpha', 0.7)
title('Histogram of LDA 1');
hold off;

% Plot projections on LDA components 2 and 3
figure;
t = tiledlayout(4, 4, 'TileSpacing', 'Compact', 'Padding', 'Compact');

% Histogram for LDA component 3 (left y-axis)
ax1 = nexttile(1, [3, 1]);
histogram(LDA_projection(3, I1), 'FaceColor', [0 0.4470 0.7410], 'FaceAlpha', 0.7)
hold on;
histogram(LDA_projection(3, I2), 'FaceColor', [0.8500 0.3250 0.0980], 'FaceAlpha', 0.7)
histogram(LDA_projection(3, I3), 'FaceColor', [0.9290 0.6940 0.1250], 'FaceAlpha', 0.7)
view(ax1, 90, -90)
title('Histogram of LDA 3');
hold off;

% Scatter plot of LDA components 2 and 3
ax2 = nexttile(2, [3, 3]);
scatter(LDA_projection(2, I1), LDA_projection(3, I1), 20, 'filled', "MarkerFaceColor", [0 0.4470 0.7410])
hold on;
scatter(LDA_projection(2, I2), LDA_projection(3, I2), 20, 'filled', "MarkerFaceColor", [0.8500 0.3250 0.0980])
scatter(LDA_projection(2, I3), LDA_projection(3, I3), 20, 'filled', "MarkerFaceColor", [0.9290 0.6940 0.1250])
xlabel('LDA Component 2', 'FontSize', 11);
ylabel('LDA Component 3', 'FontSize', 11);
legend('Cultivar 1', 'Cultivar 2', 'Cultivar 3');
hold off;
title('Scatter-plot of the the two-dimensional projection', 'FontSize', 13)
subtitle('LDA 3 VS LDA 2', 'FontSize', 11.5)

% Histogram for LDA component 2 (below x-axis)
ax3 = nexttile(14, [1, 3]);
histogram(LDA_projection(2, I1), 'FaceColor', [0 0.4470 0.7410], 'FaceAlpha', 0.7)
hold on;
histogram(LDA_projection(2, I2), 'FaceColor', [0.8500 0.3250 0.0980], 'FaceAlpha', 0.7)
histogram(LDA_projection(2, I3), 'FaceColor', [0.9290 0.6940 0.1250], 'FaceAlpha', 0.7)
title('Histogram of LDA 2');
hold off;

% Plotting the eigenvalues with and without regularization
figure;
eig_Sw = eig(Sw);
semilogy(eig_Sw, '*');
hold on;
semilogy(eig_Sw + epsilon, 'sm');
legend('eigenvalues', 'regularized eigenvalues');
title('Eigenvalue of Sw vs regularized eigenvalue', 'FontSize', 13);
xlabel('Index', 'FontSize', 11);  % Adding x-axis label
ylabel('Eigenvalue', 'FontSize', 11);  % Adding y-axis label
hold off;

% Check determinant before and after regularization
disp('det(Sw) before regularization');
det_Sw = det(Sw);
disp(det_Sw);

if (det_Sw <= 1e-14)
    disp('Regularization applied');
    Sw = Sw + epsilon * eye(size(Sw));
    disp('det(Sw) after regularization');
    det(Sw)
end

% Plotting eigenvalues before and after regularization
figure;
sSw = eig(Sw);
sSw_reg = eig(Sw + epsilon * eye(size(Sw)));
semilogy(sSw, 'r*');
hold on;
semilogy(sSw_reg, 'bd');
legend('eig before', 'eig after');
title('Eigenvalue of Sw before and after regularization', 'FontSize', 13);
xlabel('Index', 'FontSize', 11);  % Adding x-axis label
ylabel('Eigenvalue', 'FontSize', 11);  % Adding y-axis label
hold off;

%% PCA - Handwritten Digits
clear all
close all

load('HandwrittenDigits.mat')


I0 = find(I == 0);
I4 = find(I == 4);

%SVD
[U, D, ~] = svd(X, 'econ');
Z = U(:, 1:3)' * X;


% Histogram for PCA component 1
figure;
t = tiledlayout(4, 4, 'TileSpacing', 'Compact', 'Padding', 'Compact');

ax1 = nexttile(1, [3, 1]);
histogram(Z(1, I0), 'FaceColor', [0 0.4470 0.7410], 'FaceAlpha', 0.7)
hold on;
histogram(Z(1, I4), 'FaceColor', [0.8500 0.3250 0.0980], 'FaceAlpha', 0.7)
view(ax1, 90, -90); % Rotate the histogram to align it vertically
title('Histogram of PCA 1');
hold off;

% Scatter plot of PCA components 1 and 2
ax2 = nexttile(2, [3, 3]);
scatter(Z(1, I0), Z(2, I0), 20, 'filled', "MarkerFaceColor", [0 0.4470 0.7410])
hold on;
scatter(Z(1, I4), Z(2, I4), 20, 'filled', "MarkerFaceColor", [0.8500 0.3250 0.0980])
xlabel('PCA Component 1', 'FontSize', 11);
ylabel('PCA Component 2', 'FontSize', 11);
legend('Digit 0', 'Digit 4');
hold off;
title('Scatter-plot of PCA 1 VS PCA 2', 'FontSize', 13)

% Histogram for PCA component 2 (below x-axis)
ax3 = nexttile(14, [1, 3]);
histogram(Z(2, I0), 'FaceColor', [0 0.4470 0.7410], 'FaceAlpha', 0.7)
hold on;
histogram(Z(2, I4), 'FaceColor', [0.8500 0.3250 0.0980], 'FaceAlpha', 0.7)
title('Histogram of PCA 2');
hold off;

% Plot projections on PCA components 1 and 3
figure;
t = tiledlayout(4, 4, 'TileSpacing', 'Compact', 'Padding', 'Compact');

% Histogram for PCA component 3 (left y-axis)
ax1 = nexttile(1, [3, 1]);
histogram(Z(3, I0), 'FaceColor', [0 0.4470 0.7410], 'FaceAlpha', 0.7)
hold on;
histogram(Z(3, I4), 'FaceColor', [0.8500 0.3250 0.0980], 'FaceAlpha', 0.7)
view(ax1, 90, -90); % Rotate the histogram to align it vertically
title('Histogram of PCA 3');
hold off;

% Scatter plot of PCA components 1 and 3
ax2 = nexttile(2, [3, 3]);
scatter(Z(1, I0), Z(3, I0), 20, 'filled', "MarkerFaceColor", [0 0.4470 0.7410])
hold on;
scatter(Z(1, I4), Z(3, I4), 20, 'filled', "MarkerFaceColor", [0.8500 0.3250 0.0980])
xlabel('PCA Component 1', 'FontSize', 11);
ylabel('PCA Component 3', 'FontSize', 11);
legend('Digit 0', 'Digit 4');
hold off;
title('Scatter-plot of PCA 1 VS PCA 3', 'FontSize', 13)

% Histogram for PCA component 1 (below x-axis)
ax3 = nexttile(14, [1, 3]);
histogram(Z(1, I0), 'FaceColor', [0 0.4470 0.7410], 'FaceAlpha', 0.7)
hold on;
histogram(Z(1, I4), 'FaceColor', [0.8500 0.3250 0.0980], 'FaceAlpha', 0.7)
title('Histogram of PCA 1');
hold off;

% Plot projections on PCA components 2 and 3
figure;
t = tiledlayout(4, 4, 'TileSpacing', 'Compact', 'Padding', 'Compact');

% Histogram for PCA component 3 (left y-axis)
ax1 = nexttile(1, [3, 1]);
histogram(Z(3, I0), 'FaceColor', [0 0.4470 0.7410], 'FaceAlpha', 0.7)
hold on;
histogram(Z(3, I4), 'FaceColor', [0.8500 0.3250 0.0980], 'FaceAlpha', 0.7)
view(ax1, 90, -90); % Rotate the histogram to align it vertically
title('Histogram of PCA 3');
hold off;

% Scatter plot of PCA components 2 and 3
ax2 = nexttile(2, [3, 3]);
scatter(Z(2, I0), Z(3, I0), 20, 'filled', "MarkerFaceColor", [0 0.4470 0.7410])
hold on;
scatter(Z(2, I4), Z(3, I4), 20, 'filled', "MarkerFaceColor", [0.8500 0.3250 0.0980])
xlabel('PCA Component 2', 'FontSize', 11);
ylabel('PCA Component 3', 'FontSize', 11);
legend('Digit 0', 'Digit 4');
hold off;
title('Scatter-plot of PCA 2 VS PCA 3', 'FontSize', 13)

% Histogram for PCA component 2 (below x-axis)
ax3 = nexttile(14, [1, 3]);
histogram(Z(2, I0), 'FaceColor', [0 0.4470 0.7410], 'FaceAlpha', 0.7)
hold on;
histogram(Z(2, I4), 'FaceColor', [0.8500 0.3250 0.0980], 'FaceAlpha', 0.7)
title('Histogram of PCA 2');
hold off;



%% LDA - HandWrittenDigits
clear all
close all

load('HandwrittenDigits.mat')

I0 = find(I == 0);
I4 = find(I == 4);

X0 = X(:, I0);
X4 = X(:, I4);
X04 = [X0, X4];

%Cluster centroid
p1 = length(I0);
c1 = mean(X0, 2);
X1c = X0 - c1;

p2 = length(I4);
c2 = mean(X4, 2);
X2c = X4 - c2;

%the within-class scatter matrix
Sw = X1c * X1c' + X2c * X2c';

%the between-class scatter matrix
p = p1 + p2;
c = mean(X04, 2);
Sb = p1 * (c1 - c) * (c1 - c)' + p2 * (c2 - c) * (c2 - c)';

% Check if regularization is needed
epsilon = 1e-10;
if det(Sw) <= 1e-14
    disp('Regularization needed')
    Sw = Sw + epsilon * eye(size(Sw));
end

% Cholesky factorization of the within-cluster scatter matrix
K = chol(Sw, 'lower');
A = (K' \ Sb) / K;

%eigenvalues and eigenvectors of the matrix A
[W, D] = eig(A);
[D_sorted, idx] = sort(diag(D), 'descend');
W_lda = W(:, idx);

% Project data onto new feature space
Q = inv(K) * W_lda;
LDA_projection = Q(:, 1:3)' * X;

%Visualisation
figure;
t = tiledlayout(2, 3, 'TileSpacing', 'Compact', 'Padding', 'Compact');

% Scatter plot for LDA component 1
ax1 = nexttile(1, [1, 3]);
scatter(LDA_projection(1, I0), 20, 'filled', 'MarkerFaceColor', [0 0.4470 0.7410]);
hold on;
scatter(LDA_projection(1, I4), 20, 'filled', 'MarkerFaceColor', [0.8500 0.3250 0.0980]);
xlabel('LDA Component 1');
leg1 = scatter(NaN, NaN, 'filled', 'MarkerFaceColor', [0 0.4470 0.7410], 'DisplayName', 'Digit 0');
leg2 = scatter(NaN, NaN, 'filled', 'MarkerFaceColor', [0.8500 0.3250 0.0980], 'DisplayName', 'Digit 4');
legend([leg1, leg2], 'Location', 'best');
legend('boxoff');
hold off;

% Histogram for LDA component 1
ax2 = nexttile(4, [1, 3]);
real_LDA_projection_1_I0 = real(LDA_projection(1, I0));
real_LDA_projection_1_I4 = real(LDA_projection(1, I4));
histogram(real_LDA_projection_1_I0, 'FaceColor', [0 0.4470 0.7410], 'FaceAlpha', 0.7);
hold on;
histogram(real_LDA_projection_1_I4, 'FaceColor', [0.8500 0.3250 0.0980], 'FaceAlpha', 0.7);
hold off;

% Plot the projections on the second LDA direction
figure;
t = tiledlayout(2, 3, 'TileSpacing', 'Compact', 'Padding', 'Compact');

% Scatter plot for LDA component 2
ax1 = nexttile(1, [1, 3]);
scatter(LDA_projection(2, I0), 20, 'filled', 'MarkerFaceColor', [0 0.4470 0.7410]);
hold on;
scatter(LDA_projection(2, I4), 20, 'filled', 'MarkerFaceColor', [0.8500 0.3250 0.0980]);
xlabel('LDA Component 2');
leg1 = scatter(NaN, NaN, 'filled', 'MarkerFaceColor', [0 0.4470 0.7410], 'DisplayName', 'Digit 0');
leg2 = scatter(NaN, NaN, 'filled', 'MarkerFaceColor', [0.8500 0.3250 0.0980], 'DisplayName', 'Digit 4');
legend([leg1, leg2], 'Location', 'best');
legend('boxoff');
hold off;

% Histogram for LDA component 2
ax2 = nexttile(4, [1, 3]);
real_LDA_projection_2_I0 = real(LDA_projection(2, I0));
real_LDA_projection_2_I4 = real(LDA_projection(2, I4));
histogram(real_LDA_projection_2_I0, 'FaceColor', [0 0.4470 0.7410], 'FaceAlpha', 0.7);
hold on;
histogram(real_LDA_projection_2_I4, 'FaceColor', [0.8500 0.3250 0.0980], 'FaceAlpha', 0.7);
hold off;

% Plotting the eigenvalues with and without regularization
figure;
eig_Sw = eig(Sw);
semilogy(eig_Sw, '*');
hold on;
semilogy(eig_Sw + epsilon, 'sm');
legend('eigenvalues', 'regularized eigenvalues');
title('Eigenvalue of Sw vs regularized eigenvalue', 'FontSize', 13);
xlabel('Index', 'FontSize', 11);  % Adding x-axis label
ylabel('Eigenvalue', 'FontSize', 11);  % Adding y-axis label
hold off;

% Check determinant before and after regularization
disp('det(Sw) before regularization');
det_Sw = det(Sw);
disp(det_Sw);

if (det_Sw <= 1e-14)
    disp('Regularization applied');
    Sw = Sw + epsilon * eye(size(Sw));
    disp('det(Sw) after regularization');
    det(Sw)
end

% Plotting eigenvalues before and after regularization
figure;
sSw = eig(Sw);
sSw_reg = eig(Sw + epsilon * eye(size(Sw)));
semilogy(sSw, 'r*');
hold on;
semilogy(sSw_reg, 'bd');
legend('eig before', 'eig after');
title('Eigenvalue of Sw before and after regularization', 'FontSize', 13);
xlabel('Index', 'FontSize', 11);  % Adding x-axis label
ylabel('Eigenvalue', 'FontSize', 11);  % Adding y-axis label
hold off;

%% NMF - ANLS - HandWrittenDigits
close all
clear all
load HandwrittenDigits.mat

I0 = find(I == 0);
I4 = find(I == 4);

X0 = X(:,I0);
X4 = X(:,I4);
X04 = [X0, X4];

% Non-negative Matrix Factorization (NMF)
[n, p] = size(X04);
k_values = [5, 10, 20];

% Loop over different values of k
for k = k_values
    disp(['k = ', num2str(k)]);
    tau = 0.01; % Stopping criterion: iterate until relative change below this tolerance
    ch_curr = 1;

    % Initialize the matrices with random values
    rng(1); % Seed for reproducibility
    W = rand(n, k);
    H = rand(k, p);

    % Scale the feature vectors so that columns of W have unit l1 norm
    Wnorms = max(W);
    W = W * diag(1 ./ Wnorms);

    nmax = 100; % Maximum number of iterations
    t = 0;
    ch = NaN(1, nmax); % Array to store changes for plotting convergence

    % Iterate until the relative change is below tau or the maximum number of iterations
    while ch_curr > tau && t < nmax
        % Update H
        H_old = H;
        for j = 1:p
            H(:, j) = lsqnonneg(W, X04(:, j));
        end
        dH = norm(H - H_old, 'fro') / norm(H_old, 'fro'); % Relative change in H

        % Update W
        W_old = W;
        for j = 1:n
            Xr = X04(j, :);
            Wrt = lsqnonneg(H', Xr');
            W(j, :) = Wrt';
        end
        dW = norm(W - W_old, 'fro') / norm(W_old, 'fro'); % Relative change in W

        % Update the current change and iteration counter
        ch_curr = dH + dW;
        t = t + 1;
        ch(t) = ch_curr;
    end

    % Plot the convergence diagnostics (relative change) during the iterations
    figure(k);
    semilogy(ch(2:t), 'k-', 'LineWidth', 2);
    hold on;
    semilogy(ch(2:t), 'r.', 'MarkerSize', 12);
    hold off;
    title('Convergence diagnostics', 'FontSize', 13);
    xlabel('Iteration', 'FontSize', 11);
    ylabel('Relative change', 'FontSize', 11);

    % Number of iterations
    disp(['Iterations = ', num2str(t - 1)]);

    % Residual error
    res = X04 - W * H;
    rel_res = norm(res, 'fro') / norm(X04, 'fro');
    disp(['Relative residual = ', num2str(100 * rel_res, 3), '%']);

    % Plot the feature vectors as images
    figure(k + 1);
    tiledlayout('flow');
    for j = 1:k
        nexttile;
        imagesc(reshape(W(:, j), 16, 16)');
        axis('square');
        axis('off');
        colormap(1 - gray);
    end
    sgtitle(['Basis Vectors for k = ', num2str(k)], 'FontSize', 13);
end

% Identify the first feature vector
selected_feature_vector = 1;
coefficients = H(selected_feature_vector, :);
num_zeros = 0;
num_fours = 0;

% The first 319 elements in the "coefficients" correspond to '0', the others to '4'
for i = 1:length(coefficients)
    if i <= length(I0)
        % Corresponding to a '0'
        if coefficients(i) > 0.1 % lower than 0.1 is not significant
            num_zeros = num_zeros + 1;
        end
    else
        % Corresponding to a '4'
        if coefficients(i) > 0.1
            num_fours = num_fours + 1;
        end
    end
end

disp(['Number of significant coefficients for "0": ', num2str(num_zeros)]);
disp(['Number of significant coefficients for "4": ', num2str(num_fours)]);
if num_zeros > num_fours
    disp('The selected feature vector represents a "0".');
else
    disp('The selected feature vector represents a "4".');
end

%% PCA - Iris
clear all
close all

load IrisDataAnnotated.mat

I1 = find(I == 1);
I2 = find(I == 2);
I3 = find(I == 3);

%SVD
[U, D, ~] = svd(X, 'econ');
Z = U(:, 1:3)' * X;

% Histogram for PCA component 1
figure;
t = tiledlayout(4, 4, 'TileSpacing', 'Compact', 'Padding', 'Compact');

ax1 = nexttile(1, [3, 1]);
histogram(Z(1, I1), 'FaceColor', [0 0.4470 0.7410], 'FaceAlpha', 0.7)
hold on;
histogram(Z(1, I2), 'FaceColor', [0.8500 0.3250 0.0980], 'FaceAlpha', 0.7)
histogram(Z(1, I3), 'FaceColor', [0.9290 0.6940 0.1250], 'FaceAlpha', 0.7)
view(ax1, 90, -90); % Rotate the histogram to align it vertically
title('Histogram of PCA 1');
hold off;

% Scatter plot of PCA components 1 and 2
ax2 = nexttile(2, [3, 3]);
scatter(Z(1, I1), Z(2, I1), 20, 'filled', "MarkerFaceColor", [0 0.4470 0.7410])
hold on;
scatter(Z(1, I2), Z(2, I2), 20, 'filled', "MarkerFaceColor", [0.8500 0.3250 0.0980])
scatter(Z(1, I3), Z(2, I3), 20, 'filled', "MarkerFaceColor", [0.9290 0.6940 0.1250])
xlabel('PCA Component 1', 'FontSize', 11);
ylabel('PCA Component 2', 'FontSize', 11);
legend('Setosa', 'Versacolor', 'Virginica');
hold off;
title('Scatter-plot of the two-dimensional projection', 'FontSize', 13)
subtitle('PCA 1 VS PCA 2', 'FontSize', 11.5)

% Histogram for PCA component 2 (below x-axis)
ax3 = nexttile(14, [1, 3]);
histogram(Z(2, I1), 'FaceColor', [0 0.4470 0.7410], 'FaceAlpha', 0.7)
hold on;
histogram(Z(2, I2), 'FaceColor', [0.8500 0.3250 0.0980], 'FaceAlpha', 0.7)
histogram(Z(2, I3), 'FaceColor', [0.9290 0.6940 0.1250], 'FaceAlpha', 0.7)
title('Histogram of PCA 2');
hold off;

% Plot projections on PCA components 1 and 3
figure;
t = tiledlayout(4, 4, 'TileSpacing', 'Compact', 'Padding', 'Compact');

% Histogram for PCA component 3 (left y-axis)
ax1 = nexttile(1, [3, 1]);
histogram(Z(3, I1), 'FaceColor', [0 0.4470 0.7410], 'FaceAlpha', 0.7)
hold on;
histogram(Z(3, I2), 'FaceColor', [0.8500 0.3250 0.0980], 'FaceAlpha', 0.7)
histogram(Z(3, I3), 'FaceColor', [0.9290 0.6940 0.1250], 'FaceAlpha', 0.7)
view(ax1, 90, -90); % Rotate the histogram to align it vertically
title('Histogram of PCA 3');
hold off;

% Scatter plot of PCA components 1 and 3
ax2 = nexttile(2, [3, 3]);
scatter(Z(1, I1), Z(3, I1), 20, 'filled', "MarkerFaceColor", [0 0.4470 0.7410])
hold on;
scatter(Z(1, I2), Z(3, I2), 20, 'filled', "MarkerFaceColor", [0.8500 0.3250 0.0980])
scatter(Z(1, I3), Z(3, I3), 20, 'filled', "MarkerFaceColor", [0.9290 0.6940 0.1250])
xlabel('PCA Component 1', 'FontSize', 11);
ylabel('PCA Component 3', 'FontSize', 11);
legend('Setosa', 'Versacolor', 'Virginica');
hold off;
title('Scatter-plot of the two-dimensional projection', 'FontSize', 13)
subtitle('PCA 1 VS PCA 3', 'FontSize', 11.5)

% Histogram for PCA component 1 (below x-axis)
ax3 = nexttile(14, [1, 3]);
histogram(Z(1, I1), 'FaceColor', [0 0.4470 0.7410], 'FaceAlpha', 0.7)
hold on;
histogram(Z(1, I2), 'FaceColor', [0.8500 0.3250 0.0980], 'FaceAlpha', 0.7)
histogram(Z(1, I3), 'FaceColor', [0.9290 0.6940 0.1250], 'FaceAlpha', 0.7)
title('Histogram of PCA 1');
hold off;

% Plot projections on PCA components 2 and 3
figure;
t = tiledlayout(4, 4, 'TileSpacing', 'Compact', 'Padding', 'Compact');

% Histogram for PCA component 3 (left y-axis)
ax1 = nexttile(1, [3, 1]);
histogram(Z(3, I1), 'FaceColor', [0 0.4470 0.7410], 'FaceAlpha', 0.7)
hold on;
histogram(Z(3, I2), 'FaceColor', [0.8500 0.3250 0.0980], 'FaceAlpha', 0.7)
histogram(Z(3, I3), 'FaceColor', [0.9290 0.6940 0.1250], 'FaceAlpha', 0.7)
view(ax1, 90, -90); % Rotate the histogram to align it vertically
title('Histogram of PCA 3');
hold off;

% Scatter plot of PCA components 2 and 3
ax2 = nexttile(2, [3, 3]);
scatter(Z(2, I1), Z(3, I1), 20, 'filled', "MarkerFaceColor", [0 0.4470 0.7410])
hold on;
scatter(Z(2, I2), Z(3, I2), 20, 'filled', "MarkerFaceColor", [0.8500 0.3250 0.0980])
scatter(Z(2, I3), Z(3, I3), 20, 'filled', "MarkerFaceColor", [0.9290 0.6940 0.1250])
xlabel('PCA Component 2', 'FontSize', 11);
ylabel('PCA Component 3', 'FontSize', 11);
legend('Setosa', 'Versacolor', 'Virginica');
hold off;
title('Scatter-plot of the two-dimensional projection', 'FontSize', 13)
subtitle('PCA 2 VS PCA 3', 'FontSize', 11.5)

% Histogram for PCA component 2 (below x-axis)
ax3 = nexttile(14, [1, 3]);
histogram(Z(2, I1), 'FaceColor', [0 0.4470 0.7410], 'FaceAlpha', 0.7)
hold on;
histogram(Z(2, I2), 'FaceColor', [0.8500 0.3250 0.0980], 'FaceAlpha', 0.7)
histogram(Z(2, I3), 'FaceColor', [0.9290 0.6940 0.1250], 'FaceAlpha', 0.7)
title('Histogram of PCA 2');
hold off;


%% LDA - Iris
clear all
close all

load IrisDataAnnotated.mat

I1 = find(I == 1);
I2 = find(I == 2);
I3 = find(I == 3);

X1 = X(:, I1);
X2 = X(:, I2);
X3 = X(:, I3);

%cluster centroid 
p1 = length(I1);
c1 = mean(X1, 2);
X1c = X1 - c1;

p2 = length(I2);
c2 = mean(X2, 2);
X2c = X2 - c2;

p3 = length(I3);
c3 = mean(X3, 2);
X3c = X3 - c3;

%the within-cluster scatter matrix
Sw = X1c * X1c' + X2c * X2c' + X3c * X3c';

%the between-cluster scatter matrix
p = p1 + p2 + p3;
c = mean(X, 2);
Sb = p1 * (c1 - c) * (c1 - c)' + p2 * (c2 - c) * (c2 - c)' + p3 * (c3 - c) * (c3 - c)';

% Check if regularization is needed
epsilon = 1e-10;
if det(Sw) <= 1e-14
    disp('Regularization needed')
    Sw = Sw + epsilon * eye(size(Sw));
end

% Cholesky factorization of the within-cluster scatter matrix
K = chol(Sw, 'lower');
A = (K' \ Sb) / K;

%eigenvalues and eigenvectors of the matrix A
[W, D] = eig(A);
[D_sorted, idx] = sort(diag(D), 'descend');
W_lda = W(:, idx);

% Project data onto new feature space
Q = inv(K) * W_lda;
LDA_projection = Q(:, 1:3)' * X;

% Plot the results
figure;
t = tiledlayout(4, 4, 'TileSpacing', 'Compact', 'Padding', 'Compact');

% Histogram for LDA component 2 (left y-axis)
ax1 = nexttile(1, [3, 1]);
histogram(LDA_projection(2, I1), 'FaceColor', [0 0.4470 0.7410], 'FaceAlpha', 0.7)
hold on;
histogram(LDA_projection(2, I2), 'FaceColor', [0.8500 0.3250 0.0980], 'FaceAlpha', 0.7)
histogram(LDA_projection(2, I3), 'FaceColor', [0.9290 0.6940 0.1250], 'FaceAlpha', 0.7)
view(ax1, 90, -90)
title('Histogram of LDA 2');
hold off;

% Scatter plot of LDA components 1 and 2
ax2 = nexttile(2, [3, 3]);
scatter(LDA_projection(1, I1), LDA_projection(2, I1), 20, 'filled', "MarkerFaceColor", [0 0.4470 0.7410])
hold on;
scatter(LDA_projection(1, I2), LDA_projection(2, I2), 20, 'filled', "MarkerFaceColor", [0.8500 0.3250 0.0980])
scatter(LDA_projection(1, I3), LDA_projection(2, I3), 20, 'filled', "MarkerFaceColor", [0.9290 0.6940 0.1250])
xlabel('LDA Component 1', 'FontSize', 11);
ylabel('LDA Component 2', 'FontSize', 11);
legend('Setosa', 'Versacolor', 'Virginica');
hold off;
title('Scatter-plot of the the two-dimensional projection', 'FontSize', 13)
subtitle('LDA 1 VS LDA 2', 'FontSize', 11.5)

% Histogram for LDA component 1 (below x-axis)
ax3 = nexttile(14, [1, 3]);
histogram(LDA_projection(1, I1), 'FaceColor', [0 0.4470 0.7410], 'FaceAlpha', 0.7)
hold on;
histogram(LDA_projection(1, I2), 'FaceColor', [0.8500 0.3250 0.0980], 'FaceAlpha', 0.7)
histogram(LDA_projection(1, I3), 'FaceColor', [0.9290 0.6940 0.1250], 'FaceAlpha', 0.7)
title('Histogram of LDA 1');
hold off;

% Plot projections on LDA components 1 and 3
figure;
t = tiledlayout(4, 4, 'TileSpacing', 'Compact', 'Padding', 'Compact');

% Histogram for LDA component 3 (left y-axis)
ax1 = nexttile(1, [3, 1]);
histogram(LDA_projection(3, I1), 'FaceColor', [0 0.4470 0.7410], 'FaceAlpha', 0.7)
hold on;
histogram(LDA_projection(3, I2), 'FaceColor', [0.8500 0.3250 0.0980], 'FaceAlpha', 0.7)
histogram(LDA_projection(3, I3), 'FaceColor', [0.9290 0.6940 0.1250], 'FaceAlpha', 0.7)
view(ax1, 90, -90)
title('Histogram of LDA 3');
hold off;

% Scatter plot of LDA components 1 and 3
ax2 = nexttile(2, [3, 3]);
scatter(LDA_projection(1, I1), LDA_projection(3, I1), 20, 'filled', "MarkerFaceColor", [0 0.4470 0.7410])
hold on;
scatter(LDA_projection(1, I2), LDA_projection(3, I2), 20, 'filled', "MarkerFaceColor", [0.8500 0.3250 0.0980])
scatter(LDA_projection(1, I3), LDA_projection(3, I3), 20, 'filled', "MarkerFaceColor", [0.9290 0.6940 0.1250])
xlabel('LDA Component 1', 'FontSize', 11);
ylabel('LDA Component 3', 'FontSize', 11);
legend('Setosa', 'Versacolor', 'Virginica');
hold off;
title('Scatter-plot of the the two-dimensional projection', 'FontSize', 13)
subtitle('LDA 1 VS LDA 3', 'FontSize', 11.5)

% Histogram for LDA component 1 (below x-axis)
ax3 = nexttile(14, [1, 3]);
histogram(LDA_projection(1, I1), 'FaceColor', [0 0.4470 0.7410], 'FaceAlpha', 0.7)
hold on;
histogram(LDA_projection(1, I2), 'FaceColor', [0.8500 0.3250 0.0980], 'FaceAlpha', 0.7)
histogram(LDA_projection(1, I3), 'FaceColor', [0.9290 0.6940 0.1250], 'FaceAlpha', 0.7)
title('Histogram of LDA 1');
hold off;

% Plot projections on LDA components 2 and 3
figure;
t = tiledlayout(4, 4, 'TileSpacing', 'Compact', 'Padding', 'Compact');

% Histogram for LDA component 3 (left y-axis)
ax1 = nexttile(1, [3, 1]);
histogram(LDA_projection(3, I1), 'FaceColor', [0 0.4470 0.7410], 'FaceAlpha', 0.7)
hold on;
histogram(LDA_projection(3, I2), 'FaceColor', [0.8500 0.3250 0.0980], 'FaceAlpha', 0.7)
histogram(LDA_projection(3, I3), 'FaceColor', [0.9290 0.6940 0.1250], 'FaceAlpha', 0.7)
view(ax1, 90, -90)
title('Histogram of LDA 3');
hold off;

% Scatter plot of LDA components 2 and 3
ax2 = nexttile(2, [3, 3]);
scatter(LDA_projection(2, I1), LDA_projection(3, I1), 20, 'filled', "MarkerFaceColor", [0 0.4470 0.7410])
hold on;
scatter(LDA_projection(2, I2), LDA_projection(3, I2), 20, 'filled', "MarkerFaceColor", [0.8500 0.3250 0.0980])
scatter(LDA_projection(2, I3), LDA_projection(3, I3), 20, 'filled', "MarkerFaceColor", [0.9290 0.6940 0.1250])
xlabel('LDA Component 2', 'FontSize', 11);
ylabel('LDA Component 3', 'FontSize', 11);
legend('Setosa', 'Versacolor', 'Virginica');
hold off;
title('Scatter-plot of the the two-dimensional projection', 'FontSize', 13)
subtitle('LDA 3 VS LDA 2', 'FontSize', 11.5)

% Histogram for LDA component 2 (below x-axis)
ax3 = nexttile(14, [1, 3]);
histogram(LDA_projection(2, I1), 'FaceColor', [0 0.4470 0.7410], 'FaceAlpha', 0.7)
hold on;
histogram(LDA_projection(2, I2), 'FaceColor', [0.8500 0.3250 0.0980], 'FaceAlpha', 0.7)
histogram(LDA_projection(2, I3), 'FaceColor', [0.9290 0.6940 0.1250], 'FaceAlpha', 0.7)
title('Histogram of LDA 2');
hold off;

% Plotting the eigenvalues with and without regularization
figure;
eig_Sw = eig(Sw);
semilogy(eig_Sw, '*');
hold on;
semilogy(eig_Sw + epsilon, 'sm');
legend('eigenvalues', 'regularized eigenvalues');
title('Eigenvalue of Sw vs regularized eigenvalue', 'FontSize', 13);
xlabel('Index', 'FontSize', 11);  % Adding x-axis label
ylabel('Eigenvalue', 'FontSize', 11);  % Adding y-axis label
hold off;

% Check determinant before and after regularization
disp('det(Sw) before regularization');
det_Sw = det(Sw);
disp(det_Sw);

if (det_Sw <= 1e-14)
    disp('Regularization applied');
    Sw = Sw + epsilon * eye(size(Sw));
    disp('det(Sw) after regularization');
    det(Sw)
end

% Plotting eigenvalues before and after regularization
figure;
sSw = eig(Sw);
sSw_reg = eig(Sw + epsilon * eye(size(Sw)));
semilogy(sSw, 'r*');
hold on;
semilogy(sSw_reg, 'bd');
legend('eig before', 'eig after');
title('Eigenvalue of Sw before and after regularization', 'FontSize', 13);
xlabel('Index', 'FontSize', 11);  % Adding x-axis label
ylabel('Eigenvalue', 'FontSize', 11);  % Adding y-axis label
hold off;