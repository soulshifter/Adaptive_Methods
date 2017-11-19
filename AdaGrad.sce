clc ;
function y = f(x)
    y = (100*(x(2)-x(1)^2)^2)+(1-x(1)^2) ;
endfunction

function g = gr(x)
    g = [(-400*x(1)*(x(2)-x(1)^2)-2*(1-x(1))),200*(x(2)-x(1)^2)] ;
endfunction

alpha = 0.001 ;
cnt = 100000 ;
t = 0 ;
Gt = 0 ;
x=[-2,2] ;
xprev = x ;
e = 10^(-8) ;
while(cnt>0)
    t = t+1 ;
    gt = gr(xprev) ;
    Gt = Gt + gr(xprev)*gr(xprev)' ;
    //disp(alpha/sqrt(Gt+e)*gt) ;
    x = xprev - (alpha/sqrt(Gt+e))*gt ;
    xprev = x ;
    cnt = cnt-1 ;
end 

disp(x,"minimizer x*: ") ;
disp(f(x),"minimum value :") ;

