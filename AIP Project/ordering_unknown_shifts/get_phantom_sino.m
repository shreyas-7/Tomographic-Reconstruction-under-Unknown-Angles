function out = get_phantom_sino(img,angles,range)
    out = zeros(500,size(angles,2))  ;
    for i=1:size(angles,2) 
        trans = imtranslate(img,[randi(2*range)-range,randi(2*range)-range]) ; 
%         figure; imshow(trans,[]) ; 
        out(:,i) = radon(trans,...
            angles(i),...
            500); 
 
        
    end
    
end

