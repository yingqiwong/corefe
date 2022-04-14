function [th] = modelinit 


% model parameters from Matsumura et al. 2021
th.rho0     = 7.19;
th.KT0      = 83.12;
th.KT0pr    = 5.73;
th.gamma0   = 2.26;
th.b        = 0.86;
th.e0       = 1.27e-4;
th.g        = -1.01;

fldnames = fieldnames(th);
for fi = 1:length(fldnames)
    fld.(fldnames{fi}) = fi;
end

% populate params struct
th.fld = fld;

% default parameters
th.R   = 8.31446261815324;       % gas constant, J/mol/K
th.Ar  = 55.845;                 % atomic mass of Fe
th.n   = 1;                      % number of moles
th.T0  = 2000;                   % reference temperature, K



end