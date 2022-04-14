
%%

% Script to calculate the equation of state of liquid iron for a range of
% temperatures and densities, which give us the pressure, 
% i.e. p = p(rho, T)
% also calculates p-wave velocity Vp and adiabatic bulk modulus Ks
% 
% The equation of state is taken according to the Mie-Grüneisen equation, 
% cast in the form from Matsumura et al. (2021), where we calculate 
% pressure as a function of density, temperature, and some fitting 
% parameters. We use the estimated model parameters from Matsumura. 
% 
% Ying-Qi Wong, 14 April 2022

%% clear variables and add the necessary paths

clear all; clc

addpath('../src/');
addpath('../util/plot/');
addpath('../util/anly/');

%%

% load default model parameters
th = modelinit

Nrho   = 1001;
rho_g  = linspace(7,14,Nrho);               % density vector in g/cm3

Tvec = 4000:1000:9000;                      % vector of temperatures in Kelvin
NT   = length(Tvec);

p  = zeros(NT,Nrho);
Vp = zeros(NT,Nrho);
Ks = zeros(NT,Nrho);

for ti = 1:NT
    [p(ti,:), Vp(ti,:), Ks(ti,:)] = eosfe(rho_g, th, Tvec(ti));
end

%% plot outputs

figure;
[hAx,pos] = setupaxes(3,1);
colororder(parula(NT+1));

axes(hAx(1));
plot(rho_g, p);
xlabel('density [g/cm$^3$]'); 
ylabel('pressure [GPa]');
hleg = legend(num2str(Tvec(:)),'Location','northwest'); 
title(hleg,'Temp [K]');


axes(hAx(2));
plot(rho_g, Vp);
xlabel('density [g/cm$^3$]'); 
ylabel('p-wave velocity [m/s]');

axes(hAx(3));
plot(rho_g, Ks);
xlabel('density [g/cm$^3$]'); 
ylabel('adiabatic bulk modulus [/GPa]');
