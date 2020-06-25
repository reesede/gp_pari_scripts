
{
chisquareQ (Q, n) = 
  local (x, low_x, high_x, errorval);

/* Verify that the desired probability is correct */

  if ((Q < 0) || (Q > 1.0), return (-1.0),);
  if (Q == 0, return (0.0),);
  if (Q == 1.0, return (1e8000),);

/* Verify that n is OK. */

  if (n <= 0, return (-1.0),);

/* Find a probability less than the desired value. */

  x = 1.0;
  curprob = incgam(n/2, x/2)/gamma(n/2);
  while (curprob > Q,
    x = x * 2.0;
    curprob = incgam(n/2,x/2)/gamma(n/2);
  );
  low_x = x;
  if (curprob == Q, return (x);,);

/* Find a probability greater than the desired value. */

  x = 1.0;
  curprob = incgam(n/2,x/2)/gamma(n/2);
  while (curprob < Q,
    x = x / 2.0;
    curprob = incgam(n/2,x/2)/gamma(n/2);
  );
  high_x = x;
  if (curprob == Q, return (x);,);

/* Now repeatedly refine the values of curprob until we	*/
/* find a value within the error range.			*/

  errorval = 0.00000000000001;
  x = (low_x + high_x) / 2.0;
  curprob = incgam(n/2,x/2)/gamma(n/2);
  while (abs(curprob - Q) > errorval,
    if (curprob > Q,
      high_x = x;
    ,
      low_x = x;
    );
    x = (low_x + high_x) / 2.0;
    curprob = incgam(n/2,x/2)/gamma(n/2);
  );

  return (x);
}


{
  chisquareP (P, n) =

  return (chisquareQ (1.0-P,n));
}
