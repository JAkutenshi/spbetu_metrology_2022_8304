program quick;

const   max     = 80;

type    ary     = array[1..max]of real;

var     x		: ary;
        i,n     	: integer;

procedure sort(var x: ary; n: integer);

var	left,right	: array[1..20] of integer;
	i,j,sp,mid	: integer;
	pivot		: real;


procedure swap(var p,q: real);
var	hold	: real;

begin
  hold:=p;
  p:=q;
  q:=hold
end;		{ swap }

begin
  left[1]:=1;
  right[1]:=n;
  sp:=1;
  while sp>0 do
    begin
      if left[sp]>=right[sp] then sp:=sp-1
      else
	begin
	  i:=left[sp];
	  j:=right[sp];
	  pivot:=x[j];
	  mid:=(i+j)div 2;
	  if (j-i)>5 then
	    if ((x[mid]<pivot)and(x[mid]>x[i]))
	      or
		((x[mid]>pivot)and(x[mid]<x[i]))
		  then swap(x[mid],x[j])
	    else
	      if((x[i]<x[mid])and(x[i]>pivot))
		or ((x[i]>x[mid])and(x[i]<pivot))
		  then swap(x[i],x[j]);
    pivot:=x[j];
    while i<j do
      begin
	while x[i]<pivot do
	  i:=i+1;
	j:=j-1;
	while (i<j)and(pivot<x[j]) do
	  j:=j-1;
	if i<j then swap(x[i],x[j])
    end;	{ while }
    j:=right[sp];	{ pivot to i }
    swap(x[i],x[j]);
    if i-left[sp]>=right[sp]-i then
      begin		{ put shorter part first }
	left[sp+1]:=left[sp];
	right[sp+1]:=i-1;
	left[sp]:=i+1
      end
    else
      begin
	left[sp+1]:=i+1;
	right[sp+1]:=right[sp];
	right[sp]:=i-1
      end;
    sp:=sp+1		{ push stack }
  end		{ if }
 end		{ while }
end;	{ QUICK SORT }





begin
 n:=max;
 randomize;
 for i:=1 to n do
   x[i]:= random(100);
 sort( x,n );
 writearr
end.