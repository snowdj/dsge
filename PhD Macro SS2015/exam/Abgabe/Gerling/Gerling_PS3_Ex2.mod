/////////////////////////////////////////////////////////////
////    Advanced Macroeconomics                          ////
////    Problem Set 3                               	 ////
////    Author:  Lena Gerling (PhD Student)              ////
////    Date: September 04, 2015    			   		 ////
/////////////////////////////////////////////////////////////

%///////////////////////////////////////////////////////////
%////   EXERCISE 2: An and Schorfheide                  ////
%///////////////////////////////////////////////////////////

%-------------------------------------------------------------------------
% Declaration of endogenous and exogenous variables and parameters
%-------------------------------------------------------------------------
set_dynare_seed(123);
var y c p R g z YGR INFL INT;
varexo e_z e_g e_R;
varobs YGR INFL INT;
parameters tau kap psi1 psi2 rhoR rhog rhoz r_A p_A gam_Q stdR stdg stdz;

%-------------------------------------------------------------------------
% Calibration of the model parameters
%-------------------------------------------------------------------------

tau     = 2.00; 
kap     = 0.15;
psi1    = 1.50; 
psi2    = 1.00;  
rhoR    = 0.60; 
rhog    = 0.95;
rhoz    = 0.65;
p_A     = 4.00; 
r_A     = 4.00;
gam_Q   = 0.50;
stdR    = 0.20; 
stdg    = 0.80; 
stdz    = 0.45; 

%-------------------------------------------------------------------------
% Declare the model equations
%-------------------------------------------------------------------------

model;
#bet = 1/(1+r_A/400);
y = y(+1) + g - g(+1) -1/tau*(R-p(+1)-z(+1));
p = bet*p(+1) + kap*(y-g);
c = y-g;
R = rhoR*R(-1) + (1-rhoR)*psi1*p + (1-rhoR)*psi2*(y-g) + stdR/100*e_R;
g = rhog*g(-1) + stdg/100*e_g;
z = rhoz*z(-1) + stdz/100*e_z;
YGR = gam_Q + 100*(y-y(-1)+z);
INFL = p_A + 400*p;
INT = p_A + r_A + 4*gam_Q+400*R;
end;

%-------------------------------------------------------------------------
% Shocks
%-------------------------------------------------------------------------

shocks;
var e_R; stderr 1;
var e_g; stderr 1;
var e_z; stderr 1;
end;

%-------------------------------------------------------------------------
% Specification of the steady state model
%-------------------------------------------------------------------------

steady_state_model;
c    = 0; 
p    = 0;
y    = 0;
R    = 0;
g    = 0;
z    = 0;
YGR  = gam_Q;
INFL = p_A;
INT  = p_A + r_A + 4*gam_Q;
end;

steady;
check;
resid;

%-------------------------------------------------------------------------
% Estimated Parameters
%-------------------------------------------------------------------------

estimated_params;
tau,    gamma_pdf,      2.00,   0.50; 		
kap,    beta_pdf,       0.20,   0.10;
psi1,   gamma_pdf,      1.50,   0.25;		
psi2,   gamma_pdf,      0.50,   0.25;
rhoR,   beta_pdf,       0.50,   0.20;		
rhog,   beta_pdf,       0.80,   0.10;
rhoz,   beta_pdf,       0.66,   0.15;
p_A,    normal_pdf,     4.00,   0.50;
r_A,    normal_pdf,     4.00,   0.50;
gam_Q,  normal_pdf,     0.50,   0.50;
stdR,   inv_gamma_pdf,  0.40,   0.25;
stdg,   inv_gamma_pdf,  1.00,   0.25;		
stdz,   inv_gamma_pdf,  0.50,   0.25;
end;

%-------------------------------------------------------------------------
% Simulation of stochastic model
%-------------------------------------------------------------------------


stoch_simul(order=1,nocorr,nomoments,irf=0,periods=1000);  

%-------------------------------------------------------------------------
% Saving file as matfile simdat.mat
%-------------------------------------------------------------------------

save('simdat');

%-------------------------------------------------------------------------
% Estimation of the model
%-------------------------------------------------------------------------

estimation(order=1,datafile=simdat,first_obs=401,nobs=200,
mh_replic=2500,mh_nblocks=3,mh_jscale=0.65); % estimation