function [p, Vp, Ks] = eosfe (rho, th, T)
% 
% [p, Vp, Ks] = eosfe (rho, th, T)
% 
% equation of state for liquid iron as lifted from Matsumura et al. 2021
% YQW, 13 April 2022

% precalculate manipulations of rho that will be used repeatedly
rhofrac = th.rho0./rho;
rho13   = rhofrac.^(1/3);
rhog    = rhofrac.^th.g;
rhob    = rhofrac.^th.b;

gamma   = th.gamma0.*rhob;

Eth     = 3*th.n*th.R*(   T  + th.e0.*rhog .*    T .^2 );
Eth0    = 3*th.n*th.R*(th.T0 + th.e0.*rhog .* th.T0.^2 );

% atomic volume
V       = 1e3*th.Ar./rho;

% thermal pressure
dPth = gamma./V.*(Eth - Eth0);

% pressure at reference temperature
PT0  = 3*th.KT0.*rhofrac.^(-2/3).*(1-rho13).*exp(1.5*(th.KT0pr - 1).*(1-rho13));

% pressure
p    = PT0 + dPth;


% calculate adiabatic bulk modulus (a lot of math here, breakup dpdrho)
t1 = exp(-1.5*(th.KT0pr-1).*rho13 - 1);
t2 = th.KT0*rho13.*(3*th.KT0pr*rho13 - 5*rho13 + 4) - 1./rho.*3*th.rho0*th.KT0*(th.KT0pr-1);
t3 = th.e0*(th.b + th.g - 1)*(th.T0^2 - T.^2).*rhog + (th.b-1)*(th.T0 - T);
t4 = 3/th.Ar*1e-3*th.gamma0*th.n*th.R*rhob;

dpdrho = 0.5*t1.*t2./th.rho0 + t3.*t4;
dpdT   = t4.*rho.*(2*th.e0*T.*rhog + 1);

Ks = rho.* dpdrho + dpdT.*gamma.*T;

% p-wave velocity
Vp      = sqrt(Ks./rho);

end