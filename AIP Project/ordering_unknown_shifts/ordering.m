%% Image ordering algotihm
clc;clear all; close all ; 
rng(0,'twister')

h = 256 ; 
num_angles = 1024 ; 

img = phantom(h) ;
% img = padarray(phantom(h),[30,30]) ; 

angles = linspace(0,180,num_angles) ;
angles = [0,angles(randperm(size(angles,2)))]' ; 

X = radon(img,angles,512) ;

%% Ordering based approach 
X_c = radon(img,angles,512) ;

ind_c = 1:size(X,2) ; 
order = [1] ;

X_c(:,1) = [] ; 
ind_c(1) = [] ; 

while size(X_c,2) > 0 
    curr_min = 100000000 ; 
    curr_ind = -1 ;
    for i=1:size(X_c,2) 
        curr_dist = norm(X(:,order(end)) - X_c(:,i)) ; 
        if curr_dist < curr_min 
            curr_min = curr_dist ; 
            curr_ind = i ;
        end
    end

    X_c(:,curr_ind) = [] ; 
    order(end+1) = ind_c(curr_ind) ; 
    ind_c(curr_ind) = [] ; 

end

order = order' ; 
order = order(1:4:end) ; 
order * 180 / num_angles ; 
out = iradon(X(:,order),angles(1:4:end)) ; 
imshow(out,[]) ; 

