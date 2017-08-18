function [Ks] = spaceKernel(sig)
%SPACEKERNEL Summary of this function goes here
%   Detailed explanation goes here
    Ks_ = zeros(6*sig+1);
    for(i = -3*sig:3*sig)
        for(j = -3*sig:3*sig)
          Ks_(1+3*sig+i,1+3*sig+j)=exp(-((i)^2+(j)^2)/2*sig^2);
        end
    end
    Ks = Ks_/sum(Ks_(:));
end

