function [kernel,p1,p2] = getPBKernel(iImg,S,px,py,h,psize)
    %GETPBKERNEL Summary of this function goes here
    %Detailed explanation goes here
    %patch for the central pixl
    r1 = S(1); r2 = S(2); c1 = S(3); c2 = S(4);
    dim = size(iImg);
    patch1 = zeros(2*psize+1);
    
    iMin = max(px-psize,1);
    iMax = min(px+psize,dim(1));
    jMin = max(py-psize,1);
    jMax = min(py+psize,dim(2));
    
    lr1 = px - psize;
    lr2 = px + psize;
    lc1 = py - psize;
    lc2 = py + psize;
    
    ir1 = max(lr1,iMin);
    ir2 = min(iMax,lr2);
    ic1 = max(lc1,jMin);
    ic2 = min(jMax,lc2);
    
    pbr1 = (psize+1)-px+max(lr1,iMin);
    pbr2 = (psize+1)+min(lr2,iMax)-px;
    pbc1 = (psize+1)-py+max(lc1,jMin);
    pbc2 = (psize+1)+min(lc2,jMax)-py;
    
    patch1(pbr1:pbr2, pbc1:pbc2) = iImg(ir1:ir2, ic1:ic2);
    p1 = patch1;
    
    kernel = zeros(r2-r1, c2-c1);
    for i=r1:r2
        iMin = max(i-psize,1);
        iMax = min(i+psize,dim(1));
        for j=c1:c2
            jMin = max(j-psize,1);
            jMax = min(j+psize,dim(2));
            patch2 = zeros(2*psize+1);
            
            lr1 = i - psize;
            lr2 = i + psize;
            lc1 = j - psize;
            lc2 = j + psize;

            ir1 = max(lr1,iMin);
            ir2 = min(iMax,lr2);
            ic1 = max(lc1,jMin);
            ic2 = min(jMax,lc2);

            pbr1 = (psize+1)-px+max(lr1,iMin);
            pbr2 = (psize+1)+min(lr2,iMax)-px;
            pbc1 = (psize+1)-py+max(lc1,jMin);
            pbc2 = (psize+1)+min(lc2,jMax)-py;
          
            patch2(pbr1:pbr2-(i-r1), pbc1:pbc2-(j-r2)) = iImg(ir1:ir2, ic1:ic2);
            p2 = patch2;
            
            kernel(i-r1+1,j-c1+1) = similarPatch(patch1,patch2,h);
        end
    end
    kernel = kernel/(sum(kernel(:)));
end