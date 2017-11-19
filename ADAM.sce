clc ;
function y = f(x)
    y = (100*(x(2)-x(1)^2)^2)+(1-x(1)^2) ;
endfunction

function g = gr(x)
    g = [(-400*x(1)*(x(2)-x(1)^2)-2*(1-x(1))),200*(x(2)-x(1)^2)] ;
endfunction

alpha = 0.001 ;
beta1 = 0.9 ;
beta2 = 0.999 ;
e = 10^(-8) ;
m0 = 0 ;
v0 = 0 ;
t = 0 ;
cnt = 100000;
x=[-2,2] ;
xprev = x ;
mtprev = 0 ;
vtprev = 0 ;
while (cnt>0)
    t=t+1 ;
    gt=gr(xprev) ;
    mt=beta1*mtprev+(1-beta1)*gt ;
    vt=beta2*vtprev+(1-beta2)*(gt*gt') ;
    mthat=mt/(1-(beta1^t)) ;
    vthat=vt/(1-(beta2^t)) ;
    x=xprev-alpha*mthat/(sqrt(vthat)+e) ;
    xprev=x ;
    mtprev=mt ;
    vtprev=vt ;
    cnt=cnt-1 ;
end

disp(x,"minimizer x*: ") ;
disp(f(x),"minimum value :") ;

