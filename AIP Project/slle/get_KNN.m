function out_ids = get_KNN(X,K) 
%% Getting K nearest neighbours of the data points to increase efficiency of the algorithm
    [~,N] = size(X) ;
    out_ids = zeros (N,K) ;
    dist = zeros(N,1) ;
    for i=1:N  
        dist = sum((X - repmat (X(:,i),1,N)).^2,1) ; 
        [~,ind] = sort(dist) ;
        out_ids (i,:) = ind(2:K+1) ; 
    end
    
end