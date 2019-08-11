function [out] = run_sLLE(img,num_angles,K)

angles = randi([0,180],num_angles,1) ; 
X = radon(img,angles,500) ;
eps =1e6;

F_X = fft(X) ; 
KNN = get_KNN(F_X,K) ;
W = get_weights_2(F_X,KNN,eps) ; 

%% Iterative procedure to solve min(trace(Y'MY)) s.t Y'BY=Z'Z=I
D = 2 ; 
N = size(W,2) ;
M = (eye(N) - W)'*(eye(N) - W) ; 
B = eye(N) ; 
for i=1:40
    [v,ev] = eig(M,B) ; 
    ev = diag(ev) ; 
    [ev,ind] = sort(ev) ; 
%     while (ev(1) < 1e-10) ; ev(1) = [] ; ind(1) = [] ; end 
    v = v(:,ind) ;
    Y = v(:,2:3) ; 
    for j=1:N
        B(j,j) = 1 ./ (Y(j,:)*Y(j,:)');
    end
end

%% Return Z as sqrt(B) * Y, sort the angles and calculate iradon.
Z = sqrt(B) * Y ; 
Phi = atan ( Z (:,2) ./ Z (:,1)) ; 
[~,ind] = sort(Phi); 
% [angles,ind2] = sort(angles) ; 
out = iradon ( X (:,ind) , linspace(0,180,num_angles) ) ; 
% figure; imshow(out,[]) ; title(['Num angles= ',num2str(num_angles),' K= ',num2str(K)]); 

end

