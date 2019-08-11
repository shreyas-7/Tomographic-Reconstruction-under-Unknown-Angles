function X = run_diff_angles(img,mN,epsilon)

h = size(img,1) ; 
% mN = 2048 ; % Number of angles 
m = 4 ; 
N = mN/m ; % Final number of angles 
w=h;

% img(end:end+10,end:end+10) = 0 ; 
% img = padarray(img,[30,30],0) ; 

% angles = 360*rand(mN,1);
angles = linspace(0,360,mN) ;
angles = angles(randperm(size(angles,2))) ; 

X = radon(img,angles,500) ; 
out = perform_graph_laplacian(X,angles,mN,N,m,epsilon);
figure; imshow(out,[]) ; title (['mN = ',num2str(mN)]) ; 


end

