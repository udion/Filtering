function [oImg,p1,p2] = myPatchBasedFiltering(iImg, w, h, psize)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    [r,c] = size(iImg);
    oImg = zeros(r,c);
    for i=1:r
        iMin = max(i-w,1);
        iMax = min(i+w,r);
        for j=1:c
            jMin = max(j-w,1);
            jMax = min(j+w,c);
            [K_PB,p1,p2] = getPBKernel(iImg,[iMin,iMax,jMin,jMax],i,j,h,psize);
            I = iImg(iMin:iMax,jMin:jMax);
            oImg(i,j) = sum(I(:).*K_PB(:))/sum(K_PB(:));
        end
    end

end

