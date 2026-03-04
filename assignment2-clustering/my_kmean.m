function [D, I_assign, Dnew, centroids] = my_kmean(X, k, maxiteration)

[n_row, n_col] = size(X); %where i is the number of rows (variable) and j is the number of columns (obsrvations)

%initial partitioning
init_seed = X(:, randperm(n_col, k));

len_par = floor(n_col/k);
D = cell(1, k);
for i = 1:n_row
    for h = 1:k
        D{h} = X(:, ((h-1)*len_par + 1):(h*len_par));
    
        ql(i,h) = sum(norm((D{i, h} - init_seed(i,h)), 2)); %WSS k clusters 
        Q(i,:) = sum(ql(i,:), 2); %overall coherence of the clustering
    end
end


init_seed_1 = init_seed; %I need the former init_seed for visualisation.

Dnew = cell(1, k); 
centroids = zeros(1, k);
Dist = cell(1, k);
I_assign = zeros(1, n_col); 
min_values = zeros(1, n_col);
crit=1;
tol=1.0e-4;
t = 1;
while (t < maxiteration && crit(1,:) > tol)
    for i = 1:n_row
        for h = 1:k
            for j = 1:n_col
                Dist{1,h}(1,:) = sqrt((X(:,j) - init_seed_1(1,h)).^2); %distance all data points - centroid
                    
            end
                
            variable_i_values = cat(1, Dist{1,:});
            [min_values(1, :), I_assign(1,:)] = min(variable_i_values, [], 1); %minimum between each value
    
            % Assign data points to the corresponding clusters
            Dnew{1, h} = X(1, find(I_assign(1,:) == h));
    
            centroids(1,h) = mean(Dnew{1,h}); %computre centroids as mean of each cluster
    
            ql_Dnew(1,h) = sum(norm((Dnew{1, h} - centroids(1,h)), 2)); %WSS new h clusters
            Qnew(1,:) = sum(ql_Dnew(1,h)); %overall coherence of the new clustering
            
            crit(1,:) = abs(Q(1,:) - Qnew(1,:)); %criterium 
    
    
            if max(crit(1,:)) < tolerance
                break;
            else
                init_seed_1(1,h) = centroids(1,h);  
            end
        end
    end

    t = t+1;
end


%everything downside is for visualisation 
len_Dnew = zeros(1, k);
zero_rows = Dnew;
centroids_nz_rows = centroids;
init_seed_nz_rows = init_seed;
D_nz_rows = D;
for i = 1:n_row
    Empty_cell_row = cellfun('isempty', zero_rows); % Check emptiness of cells in the i-th row
    rows_to_del = any(Empty_cell_row, 2); %rows to delete in which there is, at least, one zero-rows

    zero_rows(rows_to_del,:) = []; %Dnew without zero_rows
    D_nz_rows(rows_to_del,:) = []; %D taking the same rows as dnew for better visualisation
    centroids_nz_rows(rows_to_del,:) = []; %centroids without zero_rows
    init_seed_nz_rows(rows_to_del,:) = []; %init_seed taking the same rows as centroids for better visualisation

    col_size = zeros(size(zero_rows, 1), k); %initialize col_size

    for j = 1:size(zero_rows, 1) %new row size since i delete them
        for h = 1:k
        col_size(j,h) = size(zero_rows{j,h}, 2); %column size of each cell
        len_Dnew(1,h) = min(col_size(:,h)); %minimum column size for each k
        end
    end
end

%2d scatter-plot of the initial partitioning
figure;
plot(D_nz_rows{1, 1}(1,1:len_par), D_nz_rows{2,1}(1,1:len_par), 'r.', 'MarkerSize', 15); % Cluster 1 (red)
hold on;
plot(D_nz_rows{1, 2}(1,1:len_par), D_nz_rows{2,2}(1,1:len_par), 'g.', 'MarkerSize', 15); % Cluster 2 (green)
plot(D_nz_rows{1, 3}(1,1:len_par), D_nz_rows{2,3}(1,1:len_par), 'b.', 'MarkerSize', 15); % Cluster 3 (blue)
plot(init_seed_nz_rows(1, 1), init_seed_nz_rows(2, 1), 'kx', 'MarkerSize', 18, 'LineWidth', 2); % Centroid for cluster 1
plot(init_seed_nz_rows(1, 2), init_seed_nz_rows(2, 2), 'kx', 'MarkerSize', 18, 'LineWidth', 2); % Centroid for cluster 2
plot(init_seed_nz_rows(1, 3), init_seed_nz_rows(2, 3), 'kx', 'MarkerSize', 18, 'LineWidth', 2); % Centroid for cluster 3
xlabel('Variable 1');
ylabel('Variable 2');
title('Scatter Plot of the initial Clustering');
legend('Cluster 1', 'Cluster 2', 'Cluster 3', 'Initial seed');
grid on;

%2d scatter-plot of the new partitioning
figure;
plot(zero_rows{1, 1}(1,1:len_Dnew(1,1)), zero_rows{2,1}(1,1:len_Dnew(1,1)), 'r.', 'MarkerSize', 15); % Cluster 1 (red)
hold on;
plot(zero_rows{1, 2}(1,1:len_Dnew(1,2)), zero_rows{2,2}(1,1:len_Dnew(1,2)), 'g.', 'MarkerSize', 15); % Cluster 2 (green)
plot(zero_rows{1, 3}(1,1:len_Dnew(1,3)), zero_rows{2,3}(1,1:len_Dnew(1,3)), 'b.', 'MarkerSize', 15); % Cluster 3 (blue)
plot(centroids_nz_rows(1, 1), centroids_nz_rows(2, 1), 'kx', 'MarkerSize', 18, 'LineWidth', 2); % Centroid for cluster 1
plot(centroids_nz_rows(1, 2), centroids_nz_rows(2, 2), 'kx', 'MarkerSize', 18, 'LineWidth', 2); % Centroid for cluster 2
plot(centroids_nz_rows(1, 3), centroids_nz_rows(2, 3), 'kx', 'MarkerSize', 18, 'LineWidth', 2); % Centroid for cluster 3
xlabel('Variable 1');
ylabel('Variable 2');
title('Scatter Plot of the new Clustering');
legend('Cluster 1', 'Cluster 2', 'Cluster 3', 'Centroids');
grid on;

if size(D_nz_rows, 1) >= 3
    %3d scatter-plot of the initial partitioning
    figure;
    plot3(D_nz_rows{1, 1}(1,1:len_par), D_nz_rows{2,1}(1,1:len_par), D_nz_rows{3,1}(1,1:len_par), 'r.', 'MarkerSize', 15); % Cluster 1 (red)
    hold on;
    plot3(D_nz_rows{1, 2}(1,1:len_par), D_nz_rows{2,2}(1,1:len_par), D_nz_rows{3,2}(1,1:len_par), 'g.', 'MarkerSize', 15); % Cluster 2 (green)
    plot3(D_nz_rows{1, 3}(1,1:len_par), D_nz_rows{2,3}(1,1:len_par), D_nz_rows{3,3}(1,1:len_par), 'b.', 'MarkerSize', 15); % Cluster 3 (blue)
    plot3(init_seed_nz_rows(1, 1), init_seed_nz_rows(2, 1), init_seed_nz_rows(3, 1), 'kx', 'MarkerSize', 18, 'LineWidth', 2); % Centroid for cluster 1
    plot3(init_seed_nz_rows(1, 2), init_seed_nz_rows(2, 2), init_seed_nz_rows(3, 2),'kx', 'MarkerSize', 18, 'LineWidth', 2); % Centroid for cluster 2
    plot3(init_seed_nz_rows(1, 3), init_seed_nz_rows(2, 3), init_seed_nz_rows(3, 3),'kx', 'MarkerSize', 18, 'LineWidth', 2); % Centroid for cluster 3
    xlabel('Variable 1');
    ylabel('Variable 2');
    zlabel('Variable 3');
    title('Scatter Plot of the initial Clustering');
    legend('Cluster 1', 'Cluster 2', 'Cluster 3', 'Initial seed');
    grid on;
    
    %3d scatter-plot of the new partitioning
    figure;
    plot3(zero_rows{1, 1}(1,1:len_Dnew(1,1)), zero_rows{2,1}(1,1:len_Dnew(1,1)), zero_rows{3,1}(1,1:len_Dnew(1,1)), 'r.', 'MarkerSize', 15); % Cluster 1 (red)
    hold on;
    plot3(zero_rows{1, 2}(1,1:len_Dnew(1,2)), zero_rows{2,2}(1,1:len_Dnew(1,2)), zero_rows{3,2}(1,1:len_Dnew(1,2)), 'g.', 'MarkerSize', 15); % Cluster 2 (green)
    plot3(zero_rows{1, 3}(1,1:len_Dnew(1,3)), zero_rows{2,3}(1,1:len_Dnew(1,3)), zero_rows{3,3}(1,1:len_Dnew(1,3)), 'b.', 'MarkerSize', 15); % Cluster 3 (blue)
    plot3(centroids_nz_rows(1, 1), centroids_nz_rows(2, 1), centroids_nz_rows(3, 1), 'kx', 'MarkerSize', 18, 'LineWidth', 2); % Centroid for cluster 1
    plot3(centroids_nz_rows(1, 2), centroids_nz_rows(2, 2), centroids_nz_rows(3, 2),'kx', 'MarkerSize', 18, 'LineWidth', 2); % Centroid for cluster 2
    plot3(centroids_nz_rows(1, 3), centroids_nz_rows(2, 3), centroids_nz_rows(3, 3),'kx', 'MarkerSize', 18, 'LineWidth', 2); % Centroid for cluster 3
    xlabel('Variable 1');
    ylabel('Variable 2');
    zlabel('Variable 3');
    title('3d-Scatter-Plot of the new Clustering');
    legend('Cluster 1', 'Cluster 2', 'Cluster 3', 'Centroids');
    grid on;
end