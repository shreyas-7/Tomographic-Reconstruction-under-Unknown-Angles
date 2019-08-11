
function predicted_angles = predict_angles ( L_hat ) 

[ev,eval] = eig(L_hat)  ;
% diag(ev)
eval = diag(eval) ;
[~,sorting_ind] = sort(eval,'descend') ;
eig_val = eval(sorting_ind) ; 
eig_vec = ev(:,sorting_ind);
% 
% non_zero_eig_val = find(abs(eig_val)>=1e-4); 
% eig_val = eig_val(non_zero_eig_val);
% eig_vec = eig_vec(:,non_zero_eig_val);

% These won't be trivial
% eig_vec = ev ;  
% eig_vec(1:10,1)
% eig_vec(1:10,2) 
% eig_vec(1:10,3) 

phi1 = eig_vec(:,2) ; 
phi2 = eig_vec(:,3) ; 

thetas = atan (phi1 ./ phi2) ; 
[~,order] = sort(thetas) ; 

predicted_angles = order ; 
% predicted_angles = 180 * (thetas+pi/2) / pi; 
% predicted_angles = 360 * order / max (order )  ;
% predicted_angles = predicted_angles(order) ; 
% min(predicted_angles) ;
% max(predicted_angles) ;

end
