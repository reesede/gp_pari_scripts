
/* Calculates the probability based on a normal		*/
/* distribution.  Works OK for x < 8.			*/
/*							*/
/* Arguments:						*/
/* 	val	- number > 0.				*/

{
normdist (x) = 
  local (tval, n, nmax);

  tval = 0.0;
  nmax = 120;
  n = 0;
  while (n <= nmax,
    tval += (-1)^n*x^(2*n+1)/(n!*2^n*(2*n+1));
    n++;
  );
  tval = tval /sqrt(2*Pi) + 0.5;

  return (tval);
}


