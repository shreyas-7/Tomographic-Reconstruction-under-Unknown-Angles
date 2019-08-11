function out = move_centroid(X)
    out = zeros(size(X)) ; 
    for i=1:size(X,2) 
        j=1; k = size(X,1) ; 
        while X(j,i) == 0 ; j=j+1; end
        while X(k,i) == 0 ; k=k-1; end
        mid = floor((j+k)/2) ; 
        actmid = floor(size(X,1)/2) ; 
        % move mid to
        out(:,i) = imtranslate(X(:,i),[0,actmid-mid]) ; 
    end
    
end

