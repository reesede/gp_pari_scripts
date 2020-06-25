
{
mersennelike1 (n, stop_i) = 
  local (p, i);

  i = 1;
  while (i <= stop_i,
    p = i;
    print ("Checking ", i);
    if ((2^i-n)>1,
      if (isprime(2^p-n),
        write ("mersennelike1.txt", "2^", p, "-", n " is Prime.");
      ,);
    ,);
    i += 1;
  );
  write ("mersennelike1.txt","");
}

