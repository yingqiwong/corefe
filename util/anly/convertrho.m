function [rhoout] = convertrho (rhoin, unit)
% 
% [rhoout] = convertrho (rhoin, unit);
% 
% function to convert density between g/cm3 and kg/m3
% 
% INPUTS
% rhoin     density input
% unit      define the unit of input density 
%               1 or gcm3
%               2 or kgm3
% 
% OUTPUT
% rhoout    output density in new units
% 
% YQW, 14 April 2022


switch unit
    case {1, 'gcm3'}
        rhoout = 1e3*rhoin;
        
    case {2, 'kgm3'}
        rhoout = 1e-3*rhoin;
        
    otherwise
        rhoout = rhoin;
        warning('invalid unit input, returning input rho');
            
end

end