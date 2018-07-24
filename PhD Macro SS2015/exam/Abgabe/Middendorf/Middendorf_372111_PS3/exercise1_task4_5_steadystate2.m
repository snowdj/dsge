function [ys_, params, info] = exercise1_task4_5_steadystate2(ys_, exo_, params)
% Steady state generated by Dynare preprocessor
    info = 0;
    ys_(9)=params(16);
    ys_(12)=params(16)*0.20;
    ys_(8)=params(16)*0.02;
    ys_(13)=0;
    ys_(2)=2;
    ys_(4)=0.3333333333333333;
    ys_(14)=0;
    ys_(15)=0;
    ys_(16)=0;
    ys_(17)=0;
    ys_(18)=0;
    ys_(19)=0;
    ys_(20)=0;
    ys_(21)=0;
    ys_(22)=0;
    ys_(1)=(ys_(13)+ys_(12)+ys_(8))/(ys_(2)*ys_(4)+ys_(9)*params(4));
    ys_(11)=(1/params(2)-1+params(3))/(1-ys_(1));
    ys_(5)=ys_(9)*params(4)/ys_(11);
    ys_(6)=params(3)*ys_(5);
    ys_(3)=ys_(9)-ys_(6)-ys_(12)-ys_(8);
    ys_(23)=1/ys_(3);
    ys_(7)=ys_(8)/params(3);
    ys_(10)=ys_(9)/(ys_(7)^params(5)*ys_(5)^params(4)*ys_(4)^(1-params(4)));
    % Auxiliary equations
    check_=0;
end