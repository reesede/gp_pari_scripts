
{
matexp(x) = 

  local (i, max_i, tsum);

  max_i = 100;

  tsum = x^0;
  for (i = 1, max_i,
    tsum += x^i / i!;
  );
  return (tsum*1.0);
}
