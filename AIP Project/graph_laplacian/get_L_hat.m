function L_hat = get_L_hat ( X, eps ) 
%% Calculating the laplcaian matrix
    N = size(X,2) ; 
    W = zeros(N);
    for i=1:N
        for j=1:N
            W(i,j) = exp  (-sum ( (X(:,j) - X(:,i)).^2 ) / 2/ eps) ; 
        end
    end
%     W(1:4,1:4) - eye(4) 
    D_inv = diag(1./sum(W,2)) ; 
    W_hat = D_inv * W * D_inv ; 
    D_hat_inv = diag(1./sum(W_hat,2)) ; 
    L_hat = D_hat_inv * W_hat - eye(N) ; 
end
    
    