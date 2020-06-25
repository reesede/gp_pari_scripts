
{
  gs_nstar () =

  local(roll);
  roll=d6x3;
  if (roll<=10,return(1),);
  if (roll<=15,return(2),);
  return(3);
}

gs_smasstable=vector(34);
gs_smasstable[1]=2.00;
gs_smasstable[2]=1.90;
gs_smasstable[3]=1.80;
gs_smasstable[4]=1.70;
gs_smasstable[5]=1.60;
gs_smasstable[6]=1.50;
gs_smasstable[7]=1.45;
gs_smasstable[8]=1.40;
gs_smasstable[9]=1.35;
gs_smasstable[10]=1.30;
gs_smasstable[11]=1.25;
gs_smasstable[12]=1.20;
gs_smasstable[13]=1.15;
gs_smasstable[14]=1.10;
gs_smasstable[15]=1.05;
gs_smasstable[16]=1.00;
gs_smasstable[17]=0.95
gs_smasstable[18]=0.90;
gs_smasstable[19]=0.85;
gs_smasstable[20]=0.80;
gs_smasstable[21]=0.75;
gs_smasstable[22]=0.70;
gs_smasstable[23]=0.65;
gs_smasstable[24]=0.60;
gs_smasstable[25]=0.55;
gs_smasstable[26]=0.50;
gs_smasstable[27]=0.45;
gs_smasstable[28]=0.40;
gs_smasstable[29]=0.35;
gs_smasstable[30]=0.30;
gs_smasstable[31]=0.25;
gs_smasstable[32]=0.20;
gs_smasstable[33]=0.15;
gs_smasstable[34]=0.10;

gs_smasslookup=matrix(18,18);
gs_smasslookup[3,3]=1
gs_smasslookup[3,4]=1
gs_smasslookup[3,5]=1
gs_smasslookup[3,6]=1
gs_smasslookup[3,7]=1
gs_smasslookup[3,8]=1
gs_smasslookup[3,9]=1
gs_smasslookup[3,10]=1
gs_smasslookup[3,11]=2
gs_smasslookup[3,12]=2
gs_smasslookup[3,13]=2
gs_smasslookup[3,14]=2
gs_smasslookup[3,15]=2
gs_smasslookup[3,16]=2
gs_smasslookup[3,17]=2
gs_smasslookup[3,18]=2
gs_smasslookup[4,3]=3
gs_smasslookup[4,4]=3
gs_smasslookup[4,5]=3
gs_smasslookup[4,6]=3
gs_smasslookup[4,7]=3
gs_smasslookup[4,8]=3
gs_smasslookup[4,9]=4
gs_smasslookup[4,10]=4
gs_smasslookup[4,11]=4
gs_smasslookup[4,12]=5
gs_smasslookup[4,13]=5
gs_smasslookup[4,14]=5
gs_smasslookup[4,15]=5
gs_smasslookup[4,16]=5
gs_smasslookup[4,17]=5
gs_smasslookup[4,18]=5
gs_smasslookup[5,3]=6
gs_smasslookup[5,4]=6
gs_smasslookup[5,5]=6
gs_smasslookup[5,6]=6
gs_smasslookup[5,7]=6
gs_smasslookup[5,8]=7
gs_smasslookup[5,9]=7
gs_smasslookup[5,10]=7
gs_smasslookup[5,11]=8
gs_smasslookup[5,12]=8
gs_smasslookup[5,13]=9
gs_smasslookup[5,14]=9
gs_smasslookup[5,15]=9
gs_smasslookup[5,16]=9
gs_smasslookup[5,17]=9
gs_smasslookup[5,18]=9
gs_smasslookup[6,3]=10
gs_smasslookup[6,4]=10
gs_smasslookup[6,5]=10
gs_smasslookup[6,6]=10
gs_smasslookup[6,7]=10
gs_smasslookup[6,8]=11
gs_smasslookup[6,9]=11
gs_smasslookup[6,10]=12
gs_smasslookup[6,11]=13
gs_smasslookup[6,12]=13
gs_smasslookup[6,13]=14
gs_smasslookup[6,14]=14
gs_smasslookup[6,15]=14
gs_smasslookup[6,16]=14
gs_smasslookup[6,17]=14
gs_smasslookup[6,18]=14
gs_smasslookup[7,3]=15
gs_smasslookup[7,4]=15
gs_smasslookup[7,5]=15
gs_smasslookup[7,6]=15
gs_smasslookup[7,7]=15
gs_smasslookup[7,8]=16
gs_smasslookup[7,9]=16
gs_smasslookup[7,10]=17
gs_smasslookup[7,11]=18
gs_smasslookup[7,12]=18
gs_smasslookup[7,13]=19
gs_smasslookup[7,14]=19
gs_smasslookup[7,15]=19
gs_smasslookup[7,16]=19
gs_smasslookup[7,17]=19
gs_smasslookup[7,18]=19
gs_smasslookup[8,3]=20
gs_smasslookup[8,4]=20
gs_smasslookup[8,5]=20
gs_smasslookup[8,6]=20
gs_smasslookup[8,7]=20
gs_smasslookup[8,8]=21
gs_smasslookup[8,9]=21
gs_smasslookup[8,10]=22
gs_smasslookup[8,11]=23
gs_smasslookup[8,12]=23
gs_smasslookup[8,13]=24
gs_smasslookup[8,14]=24
gs_smasslookup[8,15]=24
gs_smasslookup[8,16]=24
gs_smasslookup[8,17]=24
gs_smasslookup[8,18]=24
gs_smasslookup[9,3]=25
gs_smasslookup[9,4]=25
gs_smasslookup[9,5]=25
gs_smasslookup[9,6]=25
gs_smasslookup[9,7]=25
gs_smasslookup[9,8]=25
gs_smasslookup[9,9]=26
gs_smasslookup[9,10]=26
gs_smasslookup[9,11]=26
gs_smasslookup[9,12]=27
gs_smasslookup[9,13]=27
gs_smasslookup[9,14]=27
gs_smasslookup[9,15]=27
gs_smasslookup[9,16]=27
gs_smasslookup[9,17]=27
gs_smasslookup[9,18]=27
gs_smasslookup[10,3]=28
gs_smasslookup[10,4]=28
gs_smasslookup[10,5]=28
gs_smasslookup[10,6]=28
gs_smasslookup[10,7]=28
gs_smasslookup[10,8]=28
gs_smasslookup[10,9]=29
gs_smasslookup[10,10]=29
gs_smasslookup[10,11]=29
gs_smasslookup[10,12]=30
gs_smasslookup[10,13]=30
gs_smasslookup[10,14]=30
gs_smasslookup[10,15]=30
gs_smasslookup[10,16]=30
gs_smasslookup[10,17]=30
gs_smasslookup[10,18]=30
gs_smasslookup[11,3]=31
gs_smasslookup[11,4]=31
gs_smasslookup[11,5]=31
gs_smasslookup[11,6]=31
gs_smasslookup[11,7]=31
gs_smasslookup[11,8]=31
gs_smasslookup[11,9]=31
gs_smasslookup[11,10]=31
gs_smasslookup[11,11]=31
gs_smasslookup[11,12]=31
gs_smasslookup[11,13]=31
gs_smasslookup[11,14]=31
gs_smasslookup[11,15]=31
gs_smasslookup[11,16]=31
gs_smasslookup[11,17]=31
gs_smasslookup[11,18]=31
gs_smasslookup[12,3]=32
gs_smasslookup[12,4]=32
gs_smasslookup[12,5]=32
gs_smasslookup[12,6]=32
gs_smasslookup[12,7]=32
gs_smasslookup[12,8]=32
gs_smasslookup[12,9]=32
gs_smasslookup[12,10]=32
gs_smasslookup[12,11]=32
gs_smasslookup[12,12]=32
gs_smasslookup[12,13]=32
gs_smasslookup[12,14]=32
gs_smasslookup[12,15]=32
gs_smasslookup[12,16]=32
gs_smasslookup[12,17]=32
gs_smasslookup[12,18]=32
gs_smasslookup[13,3]=33
gs_smasslookup[13,4]=33
gs_smasslookup[13,5]=33
gs_smasslookup[13,6]=33
gs_smasslookup[13,7]=33
gs_smasslookup[13,8]=33
gs_smasslookup[13,9]=33
gs_smasslookup[13,10]=33
gs_smasslookup[13,11]=33
gs_smasslookup[13,12]=33
gs_smasslookup[13,13]=33
gs_smasslookup[13,14]=33
gs_smasslookup[13,15]=33
gs_smasslookup[13,16]=33
gs_smasslookup[13,17]=33
gs_smasslookup[13,18]=33
gs_smasslookup[14,3]=34
gs_smasslookup[14,4]=34
gs_smasslookup[14,5]=34
gs_smasslookup[14,6]=34
gs_smasslookup[14,7]=34
gs_smasslookup[14,8]=34
gs_smasslookup[14,9]=34
gs_smasslookup[14,10]=34
gs_smasslookup[14,11]=34
gs_smasslookup[14,12]=34
gs_smasslookup[14,13]=34
gs_smasslookup[14,14]=34
gs_smasslookup[14,15]=34
gs_smasslookup[14,16]=34
gs_smasslookup[14,17]=34
gs_smasslookup[14,18]=34
gs_smasslookup[15,3]=34
gs_smasslookup[15,4]=34
gs_smasslookup[15,5]=34
gs_smasslookup[15,6]=34
gs_smasslookup[15,7]=34
gs_smasslookup[15,8]=34
gs_smasslookup[15,9]=34
gs_smasslookup[15,10]=34
gs_smasslookup[15,11]=34
gs_smasslookup[15,12]=34
gs_smasslookup[15,13]=34
gs_smasslookup[15,14]=34
gs_smasslookup[15,15]=34
gs_smasslookup[15,16]=34
gs_smasslookup[15,17]=34
gs_smasslookup[15,18]=34
gs_smasslookup[16,3]=34
gs_smasslookup[16,4]=34
gs_smasslookup[16,5]=34
gs_smasslookup[16,6]=34
gs_smasslookup[16,7]=34
gs_smasslookup[16,8]=34
gs_smasslookup[16,9]=34
gs_smasslookup[16,10]=34
gs_smasslookup[16,11]=34
gs_smasslookup[16,12]=34
gs_smasslookup[16,13]=34
gs_smasslookup[16,14]=34
gs_smasslookup[16,15]=34
gs_smasslookup[16,16]=34
gs_smasslookup[16,17]=34
gs_smasslookup[16,18]=34
gs_smasslookup[17,3]=34
gs_smasslookup[17,4]=34
gs_smasslookup[17,5]=34
gs_smasslookup[17,6]=34
gs_smasslookup[17,7]=34
gs_smasslookup[17,8]=34
gs_smasslookup[17,9]=34
gs_smasslookup[17,10]=34
gs_smasslookup[17,11]=34
gs_smasslookup[17,12]=34
gs_smasslookup[17,13]=34
gs_smasslookup[17,14]=34
gs_smasslookup[17,15]=34
gs_smasslookup[17,16]=34
gs_smasslookup[17,17]=34
gs_smasslookup[17,18]=34
gs_smasslookup[18,3]=34
gs_smasslookup[18,4]=34
gs_smasslookup[18,5]=34
gs_smasslookup[18,6]=34
gs_smasslookup[18,7]=34
gs_smasslookup[18,8]=34
gs_smasslookup[18,9]=34
gs_smasslookup[18,10]=34
gs_smasslookup[18,11]=34
gs_smasslookup[18,12]=34
gs_smasslookup[18,13]=34
gs_smasslookup[18,14]=34
gs_smasslookup[18,15]=34
gs_smasslookup[18,16]=34
gs_smasslookup[18,17]=34
gs_smasslookup[18,18]=34

{
  gs_pstarmass () =

  local (roll1,roll2,table_index);
  roll1=d100;
  if (roll1 <= 50,
    roll1=d6x3;
    if (roll1 <= 8,return(0.015);,);
    if (roll1 <= 10,return(0.02);,);
    if (roll1 <= 12,return(0.03);,);
    if (roll1 <= 14,return(0.04);,);
    if (roll1 == 15,return(0.05);,);
    if (roll1 == 16,return(0.06);,);
    return(0.07);
  ,);
  roll1=d6x3;
  roll2=d6x3;
  table_index=gs_smasslookup[roll1,roll2];
  return (gs_smasstable[table_index]);
}

{
  gs_cstarmass (pmass) =

  local (i,roll1,roll2);

  if (pmass < 0.1,
    if (pmass >= 0.015,roll1=8;,);
    if (pmass >= 0.02,roll1=10;,);
    if (pmass >= 0.03,roll1=12;,);
    if (pmass >= 0.04,roll1=14;,);
    if (pmass >= 0.05,roll1=15;,);
    if (pmass >= 0.06,roll1=16;,);
    if (pmass >= 0.07,roll1=17;,);

    roll1=roll1-(d6x3-3);
    if (roll1 <= 8, return (0.015);,);
    if (roll1 <= 10, return (0.02);,);
    if (roll1 <= 12, return (0.03);,);
    if (roll1 <= 14, return (0.04);,);
    if (roll1 <= 15, return (0.05);,);
    if (roll1 <= 16, return (0.06);,);
    return (0.07);
  ,);
  i=1;
  while (i<=34, if (gs_smasstable[i]==pmass,break,i++));
  if (i>34,return(0.0),);
  roll1=d6-1;
  roll2=i;
  for(i=1,roll1,roll2+=d6);
  if (roll2==35,return(0.07);,);
  if (roll2==36,return(0.06);,);
  if (roll2==37,return(0.05);,);
  if (roll2==38,return(0.04);,);
  if (roll2==39,return(0.04);,);
  if (roll2==40,return(0.03);,);
  if (roll2==41,return(0.03);,);
  if (roll2==42,return(0.02);,);
  if (roll2==43,return(0.02);,);
  if (roll2>=44,return(0.015);,);
  return(gs_smasstable[roll2]);
}

{
  gs_starage () =

  local (roll1);

  roll1=d6x3;
  if (roll1==3,return(0.0),);
  if (roll1<=6,return(0.1+(d6-1)*0.3+(d6-1)*0.05),);
  if (roll1<=10,return(2.0+(d6-1)*0.6+(d6-1)*0.1),);
  if (roll1<=14,return(5.6+(d6-1)*0.6+(d6-1)*0.1),);
  if (roll1<=17,return(8.0+(d6-1)*0.6+(d6-1)*0.1),);
  return(8.0+(d6-1)*0.6+(d6-1)*0.1);
}

{
  gs_orbitmult () =

  local (roll1);

  roll1=d6x3 ();
  if (roll1 <=4, return (1.4),);
  if (roll1 <=6, return (1.5),);
  if (roll1 <=8, return (1.6),);
  if (roll1 <=12, return (1.7),);
  if (roll1 <=14, return (1.8),);
  if (roll1 <=16, return (1.9),);
  return (2.0);
}

{
  gs_axial () =

  local (roll1, roll2, roll3);

  roll1=d6x3 ();
  roll2=d6 ();
  roll3=d10 - 1;

  if (roll1<=6, return (0.0 + roll3),);
  if (roll1<=9, return (10.0 + roll3),);
  if (roll1<=12, return (20.0 + roll3),);
  if (roll1<=14, return (30.0 + roll3),);
  if (roll1<=16, return (40.0 + roll3),);
  if (roll2<=2, return (50.0 + roll3),);
  if (roll2<=4, return (60.0 + roll3),);
  if (roll2<=5, return (70.0 + roll3),);
  return (80.0 + roll3);
}

{
  gs_peccent (modifier) =

  local (roll1);

  if ((modifier != 0) && (modifier != 4) && (modifier != -6),return(-1),);
  roll1=d6x3+modifier;
  if (roll1 <= 3, return (0.0),);
  if (roll1 <= 6, return (0.05),);
  if (roll1 <= 9, return (0.10),);
  if (roll1 <= 11, return (0.15),);
  if (roll1 <= 12, return (0.20),);
  if (roll1 <= 13, return (0.30),);
  if (roll1 <= 14, return (0.40),);
  if (roll1 <= 15, return (0.50),);
  if (roll1 <= 16, return (0.60),);
  if (roll1 <= 17, return (0.70),);
  return (0.80);
}

{
  gs_convertEquToCart (rightAscension, declination, distance) =

    local (raHour, raMinute, raSecond, decDegree, decMinute, decSecond,
		intRA, intDec, x, y, z);

    /* Get components of right ascension.				*/

    raHour   = rightAscension[1];
    raMinute = rightAscension[2];
    raSecond = rightAscension[3];

    /* Get components of declination.					*/

    decDegree = declination[1];
    decMinute = declination[2];
    decSecond = declination[3];

    /* Verify the right ascension.					*/

    if ((raHour < 0.0) || (raHour > 23.0),
      print ("Error: raHour must satisfy 0.0 <= raHour <= 23.0");
      return ([0, 0, 0]);
    ,);

    if (raHour != truncate(raHour),
      print ("Error: raHour must be an integer.");
      return ([0,0,0]);
    ,);

    if ((raMinute < 0.0) || (raMinute > 59.0),
      print ("Error: raMinute must satisfy 0.0 <= raMinute <= 59.0");
      return ([0, 0, 0]);
    ,);

    if (raMinute != truncate(raMinute),
      print ("Error: raMinute must be an integer.");
      return ([0,0,0]);
    ,);

    if ((raSecond < 0.0) || (raSecond >= 60.0),
      print ("Error: raSecond must satisfy 0.0 <= raMinute < 60.0");
      return ([0, 0, 0]);
    ,);

    /* Verify the declination.						*/

    if ((decDegree < -90.0) || (decDegree > 90.0),
      print ("Error: decDegree must satisfy -90.0 <= decDegree <= 90.0");
      return ([0,0,0]);
    ,);

    if (decDegree != truncate(decDegree),
      print ("Error: decDegree must be an integer.");
      return ([0,0,0]);
    ,);

    if ((decMinute < 0.0) || (decMinute > 59.0),
      print ("Error: decMinute must satisfy 0.0 <= decMinute <= 59.0");
      return ([0,0,0]);
    ,);

    if (decMinute != truncate(decMinute),
      print ("Error: decMinute must be an integer.");
      return ([0,0,0]);
    ,);

    if ((decSecond < 0.0) || (decSecond >= 60.0),
      print ("Error: decSecond must satisfy 0.0 <= decSecond < 60.0");
      return ([0,0,0]);
    ,);

    if ((decDegree == -90.0) || (decDegree == 90.0),
      if ((decMinute > 0.0) || (decSecond > 0.0),
        print ("Error: if decDegree == +/- 90, decMinute and decSecond must be 0");
        return ([0,0,0]);
      ,);
    ,);

    /* Verify distance.							*/

    if (distance <= 0.0,
      print ("Error: distance must satisfy distance > 0.0");
      return ([0,0,0]);
    ,);

    /* Add together the raHour, raMinute, and raSecond to get a single	*/
    /* right ascension value.  Then, convert this into radians.		*/
    /* Since RA is measured east from the sun, it is the reverse of the	*/
    /* normal polar cooridinate value, so we need to subtract the RA	*/
    /* (in radians) from 2Pi in order to get the normal polar		*/
    /* coordinate angle.						*/

    intRA = raHour + (raMinute / 60.0) + (raSecond / 3600.0);
    intRA = intRA * 360.0 / 24.0;	/* Convert to degrees.		*/
    intRA = intRA * 2 * Pi / 360.0;	/* Convert to radians.		*/
    intRA = 2 * Pi - intRA;		/* Reverse E<->W direction.	*/

    /* Add together the decDegree, decMinute, and decSecond to get a	*/
    /* single declination.  Then, convert this to radians.  Note that	*/
    /* the components are added together first as a positive number,	*/
    /* with the negative sign applied only at the end.			*/

    intDec = abs (decDegree) + (decMinute / 60.0) + (decSecond / 3600.0);
    if (decDegree < 0.0,
      intDec = -intDec;
    ,);
    intDec = intDec * 2 * Pi / 360.0;	/* Convert to radians.		*/
  
    /* Now get the x, y, and z coordinates from the angles and the	*/
    /* distance.							*/

    x = distance * cos(intDec) * cos(intRA);
    y = distance * cos(intDec) * sin(intRA);
    z = distance * sin(intDec);

    return ([x,y,z]);
}

gs_sectorSize=10;

{
  gs_populateSector(avgDist) = 

    local (theRand, theDensity, i, x, y, z, starCount, lowIndex, highIndex,
	useHalfBox, edgeProbability, tempStarCount, totalCount);

    /* Verify the avgDist parameter.					*/

    if (avgDist <= 0.0,
      print ("Error: avgDist must be greater than 0.0");
      return;
    ,);

    /* Calculate the density of stars.					*/

    theDensity = 1/avgDist^3;

    /* We want to center on [0,0,0].  If the gs_sectorSize is even, it	*/
    /* means that the edges will only have half of a box.		*/

    if ((gs_sectorSize % 2) == 0,
      useHalfBox = 1;
      lowIndex = -(gs_sectorSize / 2);
      highIndex = gs_sectorSize / 2;
    ,
      useHalfBox = 0;
      lowIndex = -((gs_sectorSize - 1) / 2);
      highIndex = (gs_sectorSize - 1) / 2;
    );

    /* Iterate through each box, using a Poisson distribution to find	*/
    /* the number of stars in the box.					*/

    totalCount = 0;
    for (x=lowIndex,highIndex,
      for (y=lowIndex,highIndex,
        for (z=lowIndex,highIndex,

          /* Generate a random number and make it into a real number	*/
          /* between 0 and 1.						*/

          theRandom = random / (2^31);

          /* Start with 0 stars in a block.  If the random number is	*/
          /* less than the cumulative Poisson value (0..starCount)	*/
          /* based on the density, than don't continue checking.  If	*/
          /* it is greater, than increment the number of stars and	*/
          /* decrement the remaining random number.			*/

          starCount=-1;
          while (theRandom > 0.0,
            starCount++;
            theRandom -= exp(-theDensity)*theDensity^(starCount)/factorial(starCount);
          );

          /* If we're on an edge, than there is a lower probability 	*/
          /* we have a star, based on the number of edges.		*/

          edgeProbability = 1.0;
          if ((x == lowIndex) || (x == highIndex), edgeProbability /= 2;,);
          if ((y == lowIndex) || (y == highIndex), edgeProbability /= 2;,);
          if ((z == lowIndex) || (z == highIndex), edgeProbability /= 2;,);
          tempStarCount = starCount;
          for (i = 1, tempStarCount,
            theRandom = random / (2^31);
            if (theRandom > edgeProbability,
              starCount--;
            ,);
          );

          /* If the starCount is greater than 0, print out the location	*/
          /* and count.							*/

          if (starCount > 0,
            print ("[",x,",",y,",",z,"] = ", starCount);
            totalCount += starCount;
          ,);
        );
      );
    );

    print ("Total Star Count = ", totalCount);
    return (totalCount);
}
