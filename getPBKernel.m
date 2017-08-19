function [kernel] = getPBKernel(iImg,S,px,py,h,psize)
    %GETPBKERNEL Summary of this function goes here
    %Detailed explanation goes here
    %patch for the central pixl
    r1 = S(1); r2 = S(2); c1 = S(3); c2 = S(4);
    dim = size(iImg);
   
    iMin = max(px-psize,1);
    iMax = min(px+psize,dim(1));
    jMin = max(py-psize,1);
    jMax = min(py+psize,dim(2));
    
    patch1 = iImg(iMin:iMax,jMin:jMax);

    kernel = zeros(r2-r1, c2-c1);
    for i=r1:r2
        iMin = max(i-psize,1);
        iMax = min(i+psize,dim(1));
        for j=c1:c2
            jMin = max(j-psize,1);
            jMax = min(j+psize,dim(2));
            
            patch2 = iImg(iMin:iMax,jMin:jMax);

            kernel(i-r1+1,j-c1+1) = similarPatch(patch1,patch2,h);
        end
    end
    kernel = kernel/(sum(kernel(:)));
end