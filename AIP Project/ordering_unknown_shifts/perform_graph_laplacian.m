function recon = perform_graph_laplacian(X,angles,mN,N,m,eps)

X = double_projections(X,mN,angles) ; 
% [n,~] = size(X) ;

L_hat = get_L_hat ( X , eps )  ;
predicted_angles = predict_angles ( L_hat ) ; 

X = X (:,predicted_angles) ; 
predicted_angles = linspace (0,180,N)'; 

% Get eigenvals, sorting and removing trivial ones
recon = iradon(X(:,1:2*m:end), predicted_angles,'spline','Hamming') ; 

end

