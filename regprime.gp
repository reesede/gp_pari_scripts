
{
regprime(p) = 

  local (i, n);

  if (isprime (p) == 0,
    return (0);
  ,);
  if (p < 5,
    return (1);
  ,);

  for (i = 2, p - 3,
    n = numerator (bernfrac(i));
    if (n != 0,
      if ((n % p) == 0,
        return (0);
      ,);
    ,);
  );
  return (1);
}
