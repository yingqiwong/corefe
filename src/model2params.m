function [th, rho] = model2params (th, m)
%
% converts vector of model params into params struct needed for eos and
% unobserved data

fld       = th.fld; %fieldnames

th.rho0   = m(fld.rho0  );
th.KT0    = m(fld.KT0   );
th.KT0pr  = m(fld.KT0pr );
th.gamma0 = m(fld.gamma0);
th.b      = m(fld.b     );
th.e0     = m(fld.e0    );
th.g      = m(fld.g     );

rho       = m(fld.rho   );

end