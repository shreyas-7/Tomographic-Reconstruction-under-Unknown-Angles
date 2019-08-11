function out = move_centroid_noisy(X)
%% Get the centroid of the sinograms for noisy versions
    out = zeros(size(X)); 
    for i=1:size(X,2) 
        
        nonzeros = find ( X(:,i) > 1e-3 ) ;
        mid = floor(sum(nonzeros) / size(nonzeros,1)) ; 
        actmid = floor(size(X,1)/2) ; 
        out(:,i) = imtranslate(X(:,i),[0,actmid-mid]) ; 

   end

end

