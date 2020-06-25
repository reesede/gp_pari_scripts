
{
ellfpfec(ec) = 

  local (i, j, fsize, count, the_list, the_vec);

/* Verify that the ec variable is OK. */

  if (type(ec) != "t_VEC",
    print ("***incorrect type of input parameter in ellfpfec.");
    return;
  ,);
  if (type(ec[1]) != "t_INTMOD",
    print ("***elliptic curve is not over a finite field in ellfpfec.");
    return;
  ,);

/* Extract the modulus, indicating the size of the finite field */

  fsize = component (ec[1], 1);

  if (type(fsize) != "t_INT",
    print ("***modulus is not an integer in ellfpfec.");
    return;
  ,);

/* Loop through all possible combinations of x,y in the finite field to */
/* find the valid points on the curve.					*/

  the_list = [];
  count = 0;
  for (i=0,fsize - 1,
    for (j=0,fsize - 1,
      if (ellisoncurve (ec, [Mod(i,fsize), Mod(j,fsize)]) == 1,
        the_list = concat (the_list, [[Mod(i,fsize),Mod(j,fsize)]]);
        count++;
      ,);
    );
  );

  return (the_list);

}
