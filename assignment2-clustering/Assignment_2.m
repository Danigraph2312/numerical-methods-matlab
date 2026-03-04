%% Iris Dataset - k-means
clear all
close all
load IrisDataAnnotated.mat

%PCA
X_cen = X - mean(X, 2);
[U,~,~] = svd(X_cen);
Z = U' * X_cen;

%k_means
[D, I_assign, Dnew, centroids, initial_means] = mykm(Z, 3, 1.0e-30);

for h = 1:3
    Orig{h} = Z(:, I == h);
end

%Viusalisation
%2d scatter-plot of the original partitioning
figure;
plot(Orig{1}(1, :), Orig{1}(2, :), 'r.', 'MarkerSize', 15); % Cluster 1 (red)
hold on;
plot(Orig{2}(1, :), Orig{2}(2, :), 'g.', 'MarkerSize', 15); % Cluster 2 (green)
plot(Orig{3}(1, :), Orig{3}(2, :), 'b.', 'MarkerSize', 15); % Cluster 3 (blue)
xlabel('PC 1', 'FontSize', 11);
ylabel('PC 2', 'FontSize', 11);
title('2D Scatter Plot of the original Clustering', 'FontSize', 13);
legend('Setosa', 'Versacolor', 'Virginica');
grid on;

%2d scatter-plot of the initial partitioning
figure;
plot(D{1}(1, :), D{1}(2, :), 'r.', 'MarkerSize', 15); % Cluster 1 (red)
hold on;
plot(D{2}(1, :), D{2}(2, :), 'g.', 'MarkerSize', 15); % Cluster 2 (green)
plot(D{3}(1, :), D{3}(2, :), 'b.', 'MarkerSize', 15); % Cluster 3 (blue)
plot(initial_means(1, 1), initial_means(2, 1), 'kx', 'MarkerSize', 18, 'LineWidth', 2); % Centroid for cluster 1
plot(initial_means(1, 2), initial_means(2, 2), 'kx', 'MarkerSize', 18, 'LineWidth', 2); % Centroid for cluster 2
plot(initial_means(1, 3), initial_means(2, 3), 'kx', 'MarkerSize', 18, 'LineWidth', 2); % Centroid for cluster 3
xlabel('PC 1', 'FontSize', 11);
ylabel('PC 2', 'FontSize', 11);
title('2D Scatter Plot of the initial Clustering', 'FontSize', 13);
legend('Setosa', 'Versacolor', 'Virginica', 'Initial seed');
grid on;

%2d scatter-plot of the new partitioning
figure;
plot(Dnew{1}(1, :), Dnew{1}(2 ,:), 'r.', 'MarkerSize', 15); % Cluster 1 (red)
hold on;
plot(Dnew{2}(1, :), Dnew{2}(2, :), 'g.', 'MarkerSize', 15); % Cluster 2 (green)
plot(Dnew{3}(1, :), Dnew{3}(2, :), 'b.', 'MarkerSize', 15); % Cluster 3 (blue)
plot(centroids(1, 1), centroids(2, 1), 'kx', 'MarkerSize', 18, 'LineWidth', 2); % Centroid for cluster 1
plot(centroids(1, 2), centroids(2, 2), 'kx', 'MarkerSize', 18, 'LineWidth', 2); % Centroid for cluster 2
plot(centroids(1, 3), centroids(2, 3), 'kx', 'MarkerSize', 18, 'LineWidth', 2); % Centroid for cluster 3
xlabel('PC 1', 'FontSize', 11);
ylabel('PC 2', 'FontSize', 11);
title('K-means Algorithm', 'FontSize', 16)
subtitle('2D Scatter Plot of the new Clustering', 'FontSize', 11.5);
legend('Setosa', 'Versacolor', 'Virginica', 'Centroids');
grid on;


%3d scatter-plot of the initial partitioning
figure;
plot3(D{1}(1, :), D{1}(2, :), D{1}(3, :), 'r.', 'MarkerSize', 15); % Cluster 1 (red)
hold on;
plot3(D{2}(1, :), D{2}(2, :), D{2}(3, :), 'g.', 'MarkerSize', 15); % Cluster 2 (green)
plot3(D{3}(1, :), D{3}(2, :), D{3}(3, :), 'b.', 'MarkerSize', 15); % Cluster 3 (blue)
plot3(initial_means(1, 1), initial_means(2, 1), initial_means(3, 1), 'kx', 'MarkerSize', 18, 'LineWidth', 2); % Centroid for cluster 1
plot3(initial_means(1, 2), initial_means(2, 2), initial_means(3, 2),'kx', 'MarkerSize', 18, 'LineWidth', 2); % Centroid for cluster 2
plot3(initial_means(1, 3), initial_means(2, 3), initial_means(3, 3),'kx', 'MarkerSize', 18, 'LineWidth', 2); % Centroid for cluster 3
xlabel('PC 1', 'FontSize', 11);
ylabel('PC 2', 'FontSize', 11);
zlabel('PC 3', 'FontSize', 11);
title('3D Scatter Plot of the initial Clustering', 'FontSize', 13);
legend('Setosa', 'Versacolor', 'Virginica', 'Initial seed');
grid on;
    
%3d scatter-plot of the new partitioning
figure;
plot3(Dnew{1}(1,:), Dnew{1}(2, :), Dnew{1}(3, :), 'r.', 'MarkerSize', 15); % Cluster 1 (red)
hold on;
plot3(Dnew{2}(1, :), Dnew{2}(2, :), Dnew{2}(3, :), 'g.', 'MarkerSize', 15); % Cluster 2 (green)
plot3(Dnew{3}(1, :), Dnew{3}(2, :), Dnew{3}(3, :), 'b.', 'MarkerSize', 15); % Cluster 3 (blue)
plot3(centroids(1, 1), centroids(2, 1), centroids(3, 1), 'kx', 'MarkerSize', 18, 'LineWidth', 2); % Centroid for cluster 1
plot3(centroids(1, 2), centroids(2, 2), centroids(3, 2),'kx', 'MarkerSize', 18, 'LineWidth', 2); % Centroid for cluster 2
plot3(centroids(1, 3), centroids(2, 3), centroids(3, 3),'kx', 'MarkerSize', 18, 'LineWidth', 2); % Centroid for cluster 3
xlabel('PC 1', 'FontSize', 11);
ylabel('PC 2', 'FontSize', 11);
zlabel('PC 3', 'FontSize', 11);
title('K-means Algorithm', 'FontSize', 16)
subtitle('3D Scatter-Plot of the new Clustering', 'FontSize', 11.5);
legend('Setosa', 'Versacolor', 'Virginica', 'Centroids');
grid on;

%Confusion chart
figure;
cm = confusionchart(I, I_assign);
title('Confusion Chart');

%% Iris Dataset - k-medoids
clear all
close all
load IrisDataAnnotated.mat

%distance matrix
[n, p] = size(X);
for i = 1:p
        for j = i:p
            if (i == j)
                D(i, j) = 0;
            else
            D(i, j) = norm(X(:, i) - X(:, j), 1); 
            %TRY ALSO NORM 1 and NORM 'inf'
            %compare also the iteration number
            end
        end
%     end
end
D = D+D';

%k-medoids
[I_assign, I_m, starting_medoids] = my_k_medoids(D, 3, 1.0e-30);

%PCA
X_cen = X - mean(X, 2);
[U,~,~] = svd(X_cen);
Z = U' * X_cen;

%clustering
for j = 1:3
        Dnew{j} = Z(:, find(I_assign == j)); %k-ith  cluster
        X_final_medoids{j} = Z(:, I_m(j));
        X_init_medoids{j} =Z(:, starting_medoids(j));

        Orig{j} = Z(:, find(I == j)); %original clustering
end

%visualisation 
%2D scatterplot of the initial clustering
figure;
plot(Z(1, :), Z(2, :), 'k.', 'MarkerSize', 15)
hold on
plot(X_init_medoids{1}(1, 1), X_init_medoids{1}(2, 1), 'rx', 'MarkerSize', 18, 'LineWidth', 2)
hold on
plot(X_init_medoids{2}(1, 1), X_init_medoids{2}(2, 1), 'rx', 'MarkerSize', 18, 'LineWidth', 2)
hold on
plot(X_init_medoids{3}(1, 1), X_init_medoids{3}(2, 1), 'rx', 'MarkerSize', 18, 'LineWidth', 2)
xlabel('Iris flower 1', 'FontSize', 11);
ylabel('Iris flower 2', 'FontSize', 11);
legend('Iris', 'Medoids');
title('2D Scatter-plot of the initial clustering', 'FontSize', 13);
grid on;

%3D scatterplot of the intial clustering
figure;
plot3(Z(1, :), Z(2, :), Z(3, :), 'k.', 'MarkerSize', 15)
hold on
plot3(X_init_medoids{1}(1, 1), X_init_medoids{1}(2, 1), X_init_medoids{1}(3, 1), 'rx', 'MarkerSize', 18, 'LineWidth', 2)
hold on
plot3(X_init_medoids{2}(1, 1), X_init_medoids{2}(2, 1), X_init_medoids{2}(3, 1), 'rx', 'MarkerSize', 18, 'LineWidth', 2)
hold on
plot3(X_init_medoids{3}(1, 1), X_init_medoids{3}(2, 1), X_init_medoids{3}(3, 1), 'rx', 'MarkerSize', 18, 'LineWidth', 2)
xlabel('Iris flower 1', 'FontSize', 11);
ylabel('Iris flower 2', 'FontSize', 11);
zlabel('Iris flower 3', 'FontSize', 11);
legend('Iris', 'Medoids');
title('3D Scatter-plot of the initial clustering', 'FontSize', 13);
grid on;

%2D scatterplot of the original clustering
figure;
plot(Orig{1}(1, :), Orig{1}(2, :), 'r.', 'MarkerSize', 15)
hold on
plot(Orig{2}(1, :), Orig{2}(2, :), 'b.' ,'MarkerSize', 15)
hold on
plot(Orig{3}(1, :), Orig{3}(2, :), 'g.', 'MarkerSize', 15)
xlabel('Iris flower 1', 'FontSize', 11);
ylabel('Iris flower 2', 'FontSize', 11);
legend('Setosa', 'Versacolor', 'Virginica');
title('2D Scatter-plot of the original clustering', 'FontSize', 13);
grid on;

%2D scatterplot of the final clustering
figure;
plot(Dnew{1}(1, :), Dnew{1}(2, :), 'r.', 'MarkerSize', 15)
hold on
plot(Dnew{2}(1, :), Dnew{2}(2, :), 'b.' ,'MarkerSize', 15)
hold on
plot(Dnew{3}(1, :), Dnew{3}(2, :), 'g.', 'MarkerSize', 15)
hold on
plot(X_final_medoids{1}(1, 1), X_final_medoids{1}(2, 1), 'kx', 'MarkerSize', 18, 'LineWidth', 2)
hold on
plot(X_final_medoids{2}(1, 1), X_final_medoids{2}(2, 1), 'kx', 'MarkerSize', 18, 'LineWidth', 2)
hold on
plot(X_final_medoids{3}(1, 1), X_final_medoids{3}(2, 1), 'kx', 'MarkerSize', 18, 'LineWidth', 2)
xlabel('Iris flower 1', 'FontSize', 11);
ylabel('Iris flower 2', 'FontSize', 11);
legend('Setosa', 'Versacolor', 'Virginica', 'Medoids');
title('K-medoids (PAM) Algorithm', 'FontSize', 16)
subtitle('2D Scatter-plot of the final clustering', 'FontSize', 11.5);
grid on;

%3D Scatter-plot of the final clustering
figure;
plot3(Dnew{1}(1, :), Dnew{1}(2, :), Dnew{1}(3, :), 'r.', 'MarkerSize', 15)
hold on
plot3(Dnew{2}(1, :), Dnew{2}(2, :), Dnew{2}(3, :), 'b.' ,'MarkerSize', 15)
hold on
plot3(Dnew{3}(1, :), Dnew{3}(2, :), Dnew{3}(3, :), 'g.', 'MarkerSize', 15)
hold on
plot3(X_final_medoids{1}(1, 1), X_final_medoids{1}(2, 1), X_final_medoids{1}(3, 1), 'kx', 'MarkerSize', 18, 'LineWidth', 2)
hold on
plot3(X_final_medoids{2}(1, 1), X_final_medoids{2}(2, 1), X_final_medoids{2}(3, 1), 'kx', 'MarkerSize', 18, 'LineWidth', 2)
hold on
plot3(X_final_medoids{3}(1, 1), X_final_medoids{3}(2, 1), X_final_medoids{3}(3, 1), 'kx', 'MarkerSize', 18, 'LineWidth', 2)
xlabel('Iris flower 1', 'FontSize', 11);
ylabel('Iris flower 2', 'FontSize', 11);
zlabel('Iris flower 3', 'FontSize', 11);
legend('Setosa', 'Versacolor', 'Virginica', 'Medoids');
title('K-medoids (PAM) Algorithm', 'FontSize', 16)
subtitle('3D Scatter-plot of the final clustering', 'FontSize', 11.5);
grid on;

%confusion matrix
figure;
cm_1 = confusionchart(I, I_assign);
title('Confusion Chart')

%% Biopsy Dataset
clear all
close all
load BiopsyData.mat

%missing values
NaN_col = any(isnan(X), 1);
X = X(:, ~NaN_col);

%distance matrix
[n, p] = size(X);

D = zeros(p);
for i = 1:p
        for j = i:p
            if (i == j)
                D(i,j) = 0;
            else
            D(i,j) = norm(X(:, i) - X(:, j), 2); 
            %TRY ALSO NORM 1 and NORM 'inf'
            %compare also the iteration number
            end
        end
%     end
end
D = D+D';

%k-medoids
[I_assign, I_m, starting_medoids] = my_k_medoids(D, 2, 1.0e-100);

%PCA
D_cen = D - mean(D, 2);
[U,~,~] = svd(D_cen);
Z = U' * D_cen;


for j = 1:2
        X_final_medoids_X{j} = X(:, I_m(j));
        X_init_medoids_X{j} = X(:, starting_medoids(j));
end
%clustering
for j = 1:2
        Dnew{j} = Z(:, find(I_assign == j)); %k-ith  cluster
        X_final_medoids{j} = Z(:, I_m(j));
        X_init_medoids{j} = Z(:, starting_medoids(j));
end

%visualisation 
%2D scatterplot of the initial clustering
figure;
plot(Z(1, :), Z(2, :), 'k.', 'MarkerSize', 15)
hold on
plot(X_init_medoids{1}(1, 1), X_init_medoids{1}(2, 1), 'rx', 'MarkerSize', 18, 'LineWidth', 2)
hold on
plot(X_init_medoids{2}(1, 1), X_init_medoids{2}(2, 1), 'rx', 'MarkerSize', 18, 'LineWidth', 2)
xlabel('PC 1', 'FontSize', 11);
ylabel('PC 2', 'FontSize', 11);
legend('Biopsy data', 'Medoids');
title('2D Scatter-plot of the initial clustering', 'FontSize', 13);
grid on;

%3D scatterplot of the intial clustering
figure;
plot3(Z(1, :), Z(2, :), Z(3, :), 'k.', 'MarkerSize', 15)
hold on
plot3(X_init_medoids{1}(1, 1), X_init_medoids{1}(2, 1), X_init_medoids{1}(3, 1), 'rx', 'MarkerSize', 18, 'LineWidth', 2)
hold on
plot3(X_init_medoids{2}(1, 1), X_init_medoids{2}(2, 1), X_init_medoids{2}(3, 1), 'rx', 'MarkerSize', 18, 'LineWidth', 2)
xlabel('PC 1', 'FontSize', 11);
ylabel('PC 2', 'FontSize', 11);
zlabel('PC 3', 'FontSize', 11);
legend('Biopsy data', 'Medoids');
title('3D Scatter-plot of the initial clustering', 'FontSize', 13);
grid on;

%2D scatterplot of the final clustering
figure;
plot(Dnew{1}(1, :), Dnew{1}(2, :), 'r.', 'MarkerSize', 15)
hold on
plot(Dnew{2}(1, :), Dnew{2}(2, :), 'g.' ,'MarkerSize', 15)
hold on
plot(X_final_medoids{1}(1, 1), X_final_medoids{1}(2, 1), 'kx', 'MarkerSize', 18, 'LineWidth', 2)
hold on
plot(X_final_medoids{2}(1, 1), X_final_medoids{2}(2, 1), 'kx', 'MarkerSize', 18, 'LineWidth', 2)
xlabel('PC 1', 'FontSize', 11);
ylabel('PC 2', 'FontSize', 11);
legend('Beningn', 'Malignant', 'Medoids');
title('K-medoids (PAM) Algorithm', 'FontSize', 16);
subtitle('2D Scatter-plot of the final clustering', 'FontSize', 11.5);
grid on;

%3D Scatter-plot of the final clustering
figure;
plot3(Dnew{1}(1, :), Dnew{1}(2, :), Dnew{1}(3, :), 'r.', 'MarkerSize', 15)
hold on
plot3(Dnew{2}(1, :), Dnew{2}(2, :), Dnew{2}(3, :), 'g.' ,'MarkerSize', 15)
hold on
plot3(X_final_medoids{1}(1, 1), X_final_medoids{1}(2, 1), X_final_medoids{1}(3, 1), 'kx', 'MarkerSize', 18, 'LineWidth', 2)
hold on
plot3(X_final_medoids{2}(1, 1), X_final_medoids{2}(2, 1), X_final_medoids{2}(3, 1), 'kx', 'MarkerSize', 18, 'LineWidth', 2)
xlabel('PC 1', 'FontSize', 11);
ylabel('PC 2', 'FontSize', 11);
zlabel('PC 3', 'FontSize', 11);
legend('Beningn', 'Malignant', 'Medoids');
title('K-medoids (PAM) Algorithm', 'FontSize', 16);
subtitle('3D Scatter-plot of the final clustering', 'FontSize', 11.5);
grid on;
%% Congress Votes Dataset
clear all
close all
load CongressionalVoteData.mat

%missing values
zero_col = all(X == 0, 1);
X = X(:, ~zero_col);
I = I(:, ~zero_col);
[n,p]=size(X);

%distance matrix
D = zeros(p);
for i = 1:p
    for j = i+1:p
        %field in which both representives vote
        Comm_vot = (X(:, i) ~= 0 & X(:, j) ~= 0);

        % Compute dissimilarity index
        num_disagr = sum(X(Comm_vot, i) ~= X(Comm_vot, j));
        tot_vot = sum(Comm_vot);
        
        if tot_vot > 0
            dissim_ind = num_disagr / tot_vot;
        else
            % Assign neutral value for pairs with no simultaneous voting record
            dissim_ind = 0.5;
        end
        
        % Store dissimilarity index in distance matrix
        D(i, j) = dissim_ind;
        D(j, i) = dissim_ind; % Distance matrix is symmetric
    end
end

%k_medoids
[I_assign, I_m, starting_medoids] = my_k_medoids(D, 2, 1.0e-100);

%PCA
D_cen = D - mean(D, 2);
[U,~,~] = svd(D_cen);
Z = U' * D_cen;

%clustering
I_assign = I_assign - 1;
for j = 1:2
        Dnew{j} = Z(:, find(I_assign == j-1)); %k-ith  cluster
        X_final_medoids{j} = Z(:, I_m(j));
        X_init_medoids{j} = Z(:, starting_medoids(j));

        Orig{j} = Z(:, find(I == j-1)); %original clustering
end

%visualisation 
%2D scatterplot of the initial clustering
figure;
plot(Z(1, :), Z(2, :), 'k.', 'MarkerSize', 15)
hold on
plot(X_init_medoids{1}(1, 1), X_init_medoids{1}(2, 1), 'rx', 'MarkerSize', 18, 'LineWidth', 2)
hold on
plot(X_init_medoids{2}(1, 1), X_init_medoids{2}(2, 1), 'rx', 'MarkerSize', 18, 'LineWidth', 2)
xlabel('PC 1', 'FontSize', 11);
ylabel('PC 2', 'FontSize', 11);
legend('Votes', 'Medoids');
title('2D Scatter-plot of the initial clustering', 'FontSize', 13);
grid on;

%3D scatterplot of the intial clustering
figure;
plot3(Z(1, :), Z(2, :), Z(3, :), 'k.', 'MarkerSize', 15)
hold on
plot3(X_init_medoids{1}(1, 1), X_init_medoids{1}(2, 1), X_init_medoids{1}(3, 1), 'rx', 'MarkerSize', 18, 'LineWidth', 2)
hold on
plot3(X_init_medoids{2}(1, 1), X_init_medoids{2}(2, 1), X_init_medoids{2}(3, 1), 'rx', 'MarkerSize', 18, 'LineWidth', 2)
xlabel('PC 1', 'FontSize', 11);
ylabel('PC 2', 'FontSize', 11);
zlabel('PC 3', 'FontSize', 11);
legend('Votes', 'Medoids');
title('3D Scatter-plot of the final clustering', 'FontSize', 13);
grid on;

%2D scatterplot of the original clustering
figure;
plot(Orig{1}(1, :), Orig{1}(2, :), 'r.', 'MarkerSize', 15)
hold on
plot(Orig{2}(1, :), Orig{2}(2, :), 'g.' ,'MarkerSize', 15)
xlabel('PC 1', 'FontSize', 11);
ylabel('PC 2', 'FontSize', 11);
legend('Republican', 'Democrat');
title('2D Scatter-plot of the original clustering', 'FontSize', 13);
grid on;

%2D scatterplot of the final clustering
figure;
plot(Dnew{1}(1, :), Dnew{1}(2, :), 'r.', 'MarkerSize', 15)
hold on
plot(Dnew{2}(1, :), Dnew{2}(2, :), 'g.' ,'MarkerSize', 15)
hold on
plot(X_final_medoids{1}(1, 1), X_final_medoids{1}(2, 1), 'kx', 'MarkerSize', 18, 'LineWidth', 2)
hold on
plot(X_final_medoids{2}(1, 1), X_final_medoids{2}(2, 1), 'kx', 'MarkerSize', 18, 'LineWidth', 2)
xlabel('PC 1', 'FontSize', 11);
ylabel('PC 2', 'FontSize', 11);
legend('Republican', 'Democrat', 'Medoids');
title('K-medoids (PAM) Algorithm', 'FontSize', 16);
subtitle('2D Scatter-plot of the final clustering', 'FontSize', 11.5);
grid on;

%3D Scatter-plot of the final clustering
figure;
plot3(Dnew{1}(1, :), Dnew{1}(2, :), Dnew{1}(3, :), 'r.', 'MarkerSize', 15)
hold on
plot3(Dnew{2}(1, :), Dnew{2}(2, :), Dnew{2}(3, :), 'g.' ,'MarkerSize', 15)
hold on
plot3(X_final_medoids{1}(1, 1), X_final_medoids{1}(2, 1), X_final_medoids{1}(3, 1), 'kx', 'MarkerSize', 18, 'LineWidth', 2)
hold on
plot3(X_final_medoids{2}(1, 1), X_final_medoids{2}(2, 1), X_final_medoids{2}(3, 1), 'kx', 'MarkerSize', 18, 'LineWidth', 2)
xlabel('PC 1', 'FontSize', 11);
ylabel('PC 2', 'FontSize', 11);
zlabel('PC 3', 'FontSize', 11);
legend('Republican', 'Democrat', 'Medoids');
title('K-medoids (PAM) Algorithm', 'FontSize', 16);
subtitle('3D Scatter-plot of the final clustering', 'FontSize', 11.5);
grid on;

%confusion Chart
figure;
cm = confusionchart(I, I_assign);
title('Confusion Chart');