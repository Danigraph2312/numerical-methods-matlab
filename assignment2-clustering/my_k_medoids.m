function [I_assign, I_m, starting_medoids] = my_k_medoids(D, k, tol)

%rng(1); %set seed for replicability
p = size(D, 1);
I_m = sort(randperm(p, k));  %pick up 3 random ind

starting_medoids = I_m; %starting_medoids indeces

 
crit = 1;
maxiteration = 100000; 
t = 0;
while (t < maxiteration)
    
    %% assignment step
    
    D_m = D(:, I_m); %distances w.r.t. medoids submatrix
   
    [q, I_assign] = min(D_m'); %TRANSPOSE! %index to clusters
    
    Q = sum(q); %Efficient strategy for PAM
   
    oldI_m = I_m;
 
    
    %% updating step
    for h = 1:k
        
        I_k = find(I_assign == h); % Indices to points in the cluster
        
        D_k = D(I_k, I_k);
        
        [ql_new(h), j] = min(sum(D_k));
        
        
        %from local to global indices
        I_m(h) = I_k(j); %swap (updating) of the medoids indeces
        
    end
    
    %% recompute the global coherence
    Qnew = sum(ql_new);
    
    
    %% if not converged,  continue from the assignment step
    crit = abs(Q - Qnew); 
    
    Err(t+1) = crit;
    
    t = t+1;
    
    if (crit < tol)
        break
    else
        Q = Qnew;
    end
end

final_medoids = I_m;

figure;
semilogy(Err, 'o-', 'MarkerSize', 10, 'LineWidth', 1)
xlim([1 5])
title('Error plot', 'FontSize', 18);
subtitle('Coherence over iteration', 'FontSize', 13);
xlabel('t (iteration)', 'FontSize', 11);
ylabel('Overall Coherence |Q_t - Q_{t+1}|', 'FontSize', 11);