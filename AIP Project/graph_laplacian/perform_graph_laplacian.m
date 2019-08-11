function recon = perform_graph_laplacian(X,angles,mN,N,m,eps)
%% 1. Double the projections
%% 2. Get L_hat
%% 3. Predict Angles
%% 4. Generate uniform set of angles
%% 5. Recover using a subset of angles
%% Code :

X = double_projections(X,mN,angles) ; 
% [n,~] = size(X) ;

L_hat = get_L_hat ( X , eps )  ;
angle_order = predict_angles ( L_hat ) ; 

X = X (:,angle_order) ; 
predicted_angles = linspace (0,180,N)'; 

% Get eigenvals, sorting and removing trivial ones
recon = iradon(X(:,1:2*m:end), predicted_angles,'spline','Hamming') ; 

end

