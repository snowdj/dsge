function [residual, g1, g2] = Ex1_1_static(y, x, params)
%
% Status : Computes static model for Dynare
%
% Inputs : 
%   y         [M_.endo_nbr by 1] double    vector of endogenous variables in declaration order
%   x         [M_.exo_nbr by 1] double     vector of exogenous variables in declaration order
%   params    [M_.param_nbr by 1] double   vector of parameter values in declaration order
%
% Outputs:
%   residual  [M_.endo_nbr by 1] double    vector of residuals of the static model equations 
%                                          in order of declaration of the equations
%   g1        [M_.endo_nbr by M_.endo_nbr] double    Jacobian matrix of the static model equations;
%                                                     columns: variables in declaration order
%                                                     rows: equations in order of declaration
%   g2        [M_.endo_nbr by (M_.endo_nbr)^2] double   Hessian matrix of the static model equations;
%                                                       columns: variables in declaration order
%                                                       rows: equations in order of declaration
%
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

residual = zeros( 23, 1);

%
% Model equations
%

T48 = y(23)*y(15)^params(5)*y(14)^params(1);
T50 = y(17)^(1-params(1));
T208 = 1/params(20)/(y(20)/params(20));
T228 = 1/params(24)/(y(23)/params(24));
lhs =(1-y(20))*y(18);
rhs =params(21)*y(1)/(1-y(17));
residual(1)= lhs-rhs;
lhs =y(16);
rhs =params(2)*y(16)*(1-params(4)+(1-y(20))*y(19));
residual(2)= lhs-rhs;
lhs =y(16);
rhs =1/y(1);
residual(3)= lhs-rhs;
lhs =y(14);
rhs =(1-params(4))*y(14)+y(12);
residual(4)= lhs-rhs;
lhs =y(15);
rhs =(1-params(4))*y(15)+y(13);
residual(5)= lhs-rhs;
lhs =y(22);
rhs =T48*T50;
residual(6)= lhs-rhs;
lhs =y(18)*y(17);
rhs =y(22)*(1-params(1));
residual(7)= lhs-rhs;
lhs =y(19)*y(14);
rhs =y(22)*params(1);
residual(8)= lhs-rhs;
lhs =log(y(23)/params(24));
rhs =log(y(23)/params(24))*params(17)+x(4);
residual(9)= lhs-rhs;
lhs =y(13)+y(11)+y(21);
rhs =y(20)*(y(18)*y(17)+y(19)*y(14));
residual(10)= lhs-rhs;
lhs =y(11)-params(6);
rhs =(y(11)-params(6))*params(14)+x(1);
residual(11)= lhs-rhs;
lhs =y(13)-params(7);
rhs =(y(13)-params(7))*params(15)+x(2);
residual(12)= lhs-rhs;
lhs =log(y(20)/params(20));
rhs =log(y(20)/params(20))*params(16)+x(3);
residual(13)= lhs-rhs;
lhs =y(22);
rhs =y(13)+y(11)+y(1)+y(12);
residual(14)= lhs-rhs;
lhs =y(10);
rhs =100*(y(22)-params(23))/params(23);
residual(15)= lhs-rhs;
lhs =y(2);
rhs =100*(y(1)-params(3))/params(3);
residual(16)= lhs-rhs;
lhs =y(4);
rhs =100*(y(12)-params(8))/params(8);
residual(17)= lhs-rhs;
lhs =y(6);
rhs =100*(y(17)-params(12));
residual(18)= lhs-rhs;
lhs =y(7);
rhs =100*(y(18)-params(13))/params(13);
residual(19)= lhs-rhs;
lhs =y(8);
rhs =100*(y(19)-params(19));
residual(20)= lhs-rhs;
lhs =y(9);
rhs =100*(y(21)-params(22));
residual(21)= lhs-rhs;
lhs =y(3);
rhs =100*(y(11)/y(22)-params(6)/params(23));
residual(22)= lhs-rhs;
lhs =y(5);
rhs =100*(y(13)/y(22)-params(7)/params(23));
residual(23)= lhs-rhs;
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
if nargout >= 2,
  g1 = zeros(23, 23);

  %
  % Jacobian matrix
  %

  g1(1,1)=(-(params(21)*1/(1-y(17))));
  g1(1,17)=(-(params(21)*y(1)/((1-y(17))*(1-y(17)))));
  g1(1,18)=1-y(20);
  g1(1,20)=(-y(18));
  g1(2,16)=1-params(2)*(1-params(4)+(1-y(20))*y(19));
  g1(2,19)=(-(params(2)*(1-y(20))*y(16)));
  g1(2,20)=(-(params(2)*y(16)*(-y(19))));
  g1(3,1)=(-((-1)/(y(1)*y(1))));
  g1(3,16)=1;
  g1(4,12)=(-1);
  g1(4,14)=1-(1-params(4));
  g1(5,13)=(-1);
  g1(5,15)=1-(1-params(4));
  g1(6,14)=(-(T50*y(23)*y(15)^params(5)*getPowerDeriv(y(14),params(1),1)));
  g1(6,15)=(-(T50*y(14)^params(1)*y(23)*getPowerDeriv(y(15),params(5),1)));
  g1(6,17)=(-(T48*getPowerDeriv(y(17),1-params(1),1)));
  g1(6,22)=1;
  g1(6,23)=(-(T50*y(15)^params(5)*y(14)^params(1)));
  g1(7,17)=y(18);
  g1(7,18)=y(17);
  g1(7,22)=(-(1-params(1)));
  g1(8,14)=y(19);
  g1(8,19)=y(14);
  g1(8,22)=(-params(1));
  g1(9,23)=T228-params(17)*T228;
  g1(10,11)=1;
  g1(10,13)=1;
  g1(10,14)=(-(y(20)*y(19)));
  g1(10,17)=(-(y(20)*y(18)));
  g1(10,18)=(-(y(20)*y(17)));
  g1(10,19)=(-(y(20)*y(14)));
  g1(10,20)=(-(y(18)*y(17)+y(19)*y(14)));
  g1(10,21)=1;
  g1(11,11)=1-params(14);
  g1(12,13)=1-params(15);
  g1(13,20)=T208-params(16)*T208;
  g1(14,1)=(-1);
  g1(14,11)=(-1);
  g1(14,12)=(-1);
  g1(14,13)=(-1);
  g1(14,22)=1;
  g1(15,10)=1;
  g1(15,22)=(-(100/params(23)));
  g1(16,1)=(-(100/params(3)));
  g1(16,2)=1;
  g1(17,4)=1;
  g1(17,12)=(-(100/params(8)));
  g1(18,6)=1;
  g1(18,17)=(-100);
  g1(19,7)=1;
  g1(19,18)=(-(100/params(13)));
  g1(20,8)=1;
  g1(20,19)=(-100);
  g1(21,9)=1;
  g1(21,21)=(-100);
  g1(22,3)=1;
  g1(22,11)=(-(100*1/y(22)));
  g1(22,22)=(-(100*(-y(11))/(y(22)*y(22))));
  g1(23,5)=1;
  g1(23,13)=(-(100*1/y(22)));
  g1(23,22)=(-(100*(-y(13))/(y(22)*y(22))));
  if ~isreal(g1)
    g1 = real(g1)+2*imag(g1);
  end
end
if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],23,529);
end
end
