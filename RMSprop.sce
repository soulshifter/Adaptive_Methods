clc ;
function y = f(x)
    y = (100*(x(2)-x(1)^2)^2)+(1-x(1)^2) ;
endfunction

function g = gr(x)
    g = [(-400*x(1)*(x(2)-x(1)^2)-2*(1-x(1))),200*(x(2)-x(1)^2)] ;
endfunction

alpha = 0.001 ;
cnt = 1000 ;
t = 0 ;
Gt = 0 ;
Gtprev = 0 ;
x=[-2,2] ;
xprev = x ;
e = 10^(-8) ;
gama = 0.9 ;
while(cnt>0)
    t = t+1 ;
    gt = gr(xprev) ;
    Gt = gama*Gtprev + (1-gama)*(gt*gt') ; 
    x = xprev - (alpha/sqrt(Gt))*gt ; 
    Gtprev = Gt ;
    xprev = x ;
    cnt = cnt-1 ;
end

disp(x,"minimizer x*: ") ;
disp(f(x),"minimum value :") ;

