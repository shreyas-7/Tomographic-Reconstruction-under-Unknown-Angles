function W = get_weights_2 ( X, KNN , eps) 
    N = size(X,2) ; 
    W = zeros(N);
    for i=1:N
        for j=i+1:N
            W(i,j) = exp  (-norm( (X(:,j) - X(:,i)))^2  / 2/ eps) ;
            W(j,i) = W(i,j) ;
        end
    end 
    for i=1:N
        W(i,:) = W(i,:) / sum(W(i,:)) ;
    end
end