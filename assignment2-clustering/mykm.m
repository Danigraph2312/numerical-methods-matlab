function [D, I_assign, Dnew, centroids, initial_means] = mykm(X, k, tol)

%rng(1);

[n_row, n_col] = size(X); %where i is the number of rows (variable) and j is the number of columns (obsrvations)

%initial partitioning
init_seed = X(:,randperm(n_col, k));

len_par = floor(n_col/k);
D = cell(1, k);
for h = 1:k
    D{h} = X(:, ((h-1)*len_par + 1):(h*len_par));

    ql(h) = sum(norm((D{h} - init_seed(:,h)), 2)); %WSS k clusters 
end
Q = sum(ql, 2); %overall coherence of the clustering


initial_means = init_seed; %I need the former init_seed for visualisation.

Dnew = cell(1, k); 
centroids = zeros(n_row, k);
Dist = zeros(k, n_col);
I_assign = zeros(1, n_col); 
min_values = zeros(1, n_col);

crit = 1;
maxiteration = 100000;
t = 0;
while (t < maxiteration)
    for h = 1:k
        for j = 1:n_col
            Dist(h, j) = norm(X(:, j) - init_seed(:,h), 2); %distance all data points - centroid
                    
        end
    end
                
    [min_values, I_assign] = min(Dist, [], 1); %minimum between each value

    for h = 1:k
        % Assign data points to the corresponding clusters
        Dnew{h} = X(:, I_assign == h);
    
        centroids(:, h) = mean(Dnew{h}, 2); %computre centroids as mean of each cluster

        ql_Dnew(h) = sum(vecnorm((Dnew{h} - centroids(:, h)), 2, 1)); %WSS new h clusters
    end

    Qnew = sum(ql_Dnew); %overall coherence of the new clustering  
    crit = abs(Q - Qnew); %criterium 

    Err(t+1) = crit;
    
    if (crit < tol)
        break;
    else
        init_seed = centroids;  
        Q = Qnew;
    end
    
    t = t+1;
end

%coherence over iteration plot
figure;
semilogy(Err, 'o-', 'MarkerSize', 10, 'LineWidth', 1)
title('Error plot', 'FontSize', 18);
subtitle('Coherence over iteration', 'FontSize', 13);
xlabel('t (iteration)', 'FontSize', 11);
ylabel('Overall Coherence |Q_t - Q_{t+1}|', 'FontSize', 11);