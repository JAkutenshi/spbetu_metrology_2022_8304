program newdr;	
var	x,x2	: real;
	alldone	: boolean;
	error	: boolean;

procedure func(x: real;
		var fx,dfx: real);

{ the vapor pressure of lead }
const
   a = 18.19;
   b = -23180.0;
   c = -0.8858;
   logp = -4.60517  { ln(.01) };
begin
  fx:= a + b/x + c*ln(x) - logp;
  dfx:= -b/(x*x) + c/x
end;	{ func }

procedure newton(var x: real);
const 	tol	= 1.0E-4;
var	fx,dfx,dx,x1:	real;
begin	{ newton }
  repeat
    x1:=x;
    func(x,fx,dfx);
    if(abs(dfx)<tol) then
       begin
          if(dfx>=0.0) then dfx:=tol
          else dfx := -tol
       end;
    dx:=fx/dfx;
    x:=x1-dx;
    writeln('x=',x1,',fx=',fx,',dfx=',dfx);
  until abs(dx)<=abs(tol*x)
end;	{ newton }

begin		{ main program }
  alldone:=false;
  repeat
    writeln;
    write('First guess (999. to exit): ');	{ first guess }
    readln(x);
    if x=999. then alldone:=true
    else
      begin
	newton(x);
	writeln;
	writeln('The solution is ',x);
	writeln
      end
  until alldone
end.