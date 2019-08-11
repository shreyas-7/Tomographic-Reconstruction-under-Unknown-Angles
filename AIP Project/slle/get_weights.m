function W = get_weights(X,KNN,eps) 
    %% Solving the convex optimisation problem to get the weights that best represent the projection similarities
    N = size(X,2) ; 
    K = size(KNN,2) ; 
    
    cvx_begin 
        variable W(N,K) nonnegative
        objective = 0 ;
        for i=1:N
            val =X(:,KNN(i,:)) * W(i,:)' ;
            objective = objective + norm ( X(:,i) - val ) ; 
        end
        minimize ( objective ) 
        
        subject to 
            sum(W,2) == ones(N,1)  
    cvx_end
 %{
    
    for i=1:N
        if mod(i,100) == 0 
            fprintf('i is %d\n',i); 
        end
        
        for j = KNN(i,:)
            W(i,j) = 1 / (1 +  norm(X(:,j) - X(:,i))^2 / 2/ eps ); 
%             W(i,j) = exp ( - W(i,j)) ; 
            W(j,i) = W(i,j) ; 
        end
        
    end
    
     for i=1:N
%         
%         W(i,:)
         W (i,:) = W(i,:) / sum(W(i,:)) ;
%         W(i,:)
% %         fprintf('Weights sum = %f\n',W(i,:));  
% %         assert ( sum (W(i,:)) == 1 ) ; 
%         
     end
     
     %}
end

