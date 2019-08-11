

function [X_out,num_angles,ang] = double_projections(X,na,angles) 
    num_angles = na * 2 ; 
    ang = [angles;angles+180] ; 
    ang = mod (ang,360) ; 
    X_out =  [X,X(end:-1: 1, :)]; 
end
