
nj_random_tab=matrix(53,3);

{
  nj_inittab () = 

  local (i);

  for(i=1,13,
    nj_random_tab[i,1]=i;
    nj_random_tab[i,2]="H";
    nj_random_tab[i,3]=1;

    nj_random_tab[i+13,1]=i;
    nj_random_tab[i+13,2]="S";
    nj_random_tab[i+13,3]=1;

    nj_random_tab[i+26,1]=i;
    nj_random_tab[i+26,2]="D";
    nj_random_tab[i+26,3]=1;

    nj_random_tab[i+39,1]=i;
    nj_random_tab[i+39,2]="C";
    nj_random_tab[i+39,3]=1;
  );

  nj_random_tab[53,1]=0;
  nj_random_tab[53,2]="J";
  nj_random_tab[53,3]=1;

  print ("Initialized.");
}

{
  nj_select () =

    local (i, count);

    count=0;
    for(i=1,53,
      count += nj_random_tab[i,3];
    );
    if (count == 0,
      print ("Error: empty table.");
      return ([-1,"E"]);
    ,);

    while (1==1,
      i = dx(53);
      if (nj_random_tab[i,3] == 1,
        nj_random_tab[i,3] = 0;
        return ([nj_random_tab[i,1], nj_random_tab[i,2]]);
      );
    );
}

{
  nj_scen(thePeriod, theType) = 

  local (theSelect, theResult);

  theResult=vector(6);
  theResult=["None","None","None","None","None", ""];

  if ((thePeriod != 1) && (thePeriod !=2),
    print ("Error: thePeriod must be 1 or 2.");
    theResult=["None","None","None","None","None", ""];
    return (theResult);
  ,);

  if ((theType != "Random") && (theType != "Normal") && (theType != "Massive"),
    print ("Error: theType must be \"Random\", \"Normal\", or \"Massive\"");
    theResult=["None","None","None","None","None", ""];
    return (theResult);
  ,);

  if (theType == "Random",
    theSelect=nj_select ();
    if ((theSelect[1] == -1) || (theSelect[1] == 0),
      theResult=["None","None","None","None","None", ""];
      return (theResult);
    ,);
    if ((theSelect[1] >= 11) && (theSelect[1] <= 13),
      theResult[1]="Massive";
    ,
      theResult[1]="Normal";
    );
  ,);

  if (theType == "Normal",
    theResult[1]="Normal";
  ,);

  if (theType == "Massive",
    theResult[1]="Massive";
  ,);

  theSelect=nj_select ();
  if ((theSelect[1] == -1) || (theSelect[1] == 0),
    theResult=["None","None","None","None","None", ""];
    return (theResult);
  ,);

  if (theSelect[2] == "H",
    theResult[2] = "Dunaja";
  ,);
  if (theSelect[2] == "S",
    theResult[2] = "Himmelbett A";
  ,);
  if (theSelect[2] == "D",
    theResult[2] = "Himmelbett B";
  ,);
  if (theSelect[2] == "C",
    theResult[2] = "Himmelbett C";
  ,);

  if (theSelect[1] == 11,
    theResult[6] = "NF return to base; replace with radio beacon NF; perform scenario";
  ,);
  if (theSelect[1] == 12,
    theResult[6] = "NF return to base after scenario";
  ,);
  if (theSelect[1] == 13,
    theResult[6] = "If zone empty, replace with radio beacon NF; perform scenario";
  ,);

  theSelect=nj_select ();
  if ((theSelect[1] == -1) || (theSelect[1] == 0),
    theResult=["None","None","None","None","None", ""];
  ,);

  if (thePeriod == 1,
    if (theResult[1] == "Normal",
      if (theSelect[1] == 1,
        theResult[3] = "Main";
        theResult[4] = "Halifax Mk. I";
        theResult[5] = "High";
      ,);
      if (theSelect[1] == 2,
        theResult[3] = "Straggler";
        theResult[4] = "Hampden Mk. I";
        theResult[5] = "Normal";
      ,);
      if (theSelect[1] == 3,
        theResult[3] = "Straggler";
        theResult[4] = "Wellington Mk. Ic";
        theResult[5] = "Low";
      ,);
      if (theSelect[1] == 4,
        theResult[3] = "Straggler";
        theResult[4] = "Wellington Mk. Ic";
        theResult[5] = "Normal";
      ,);
      if (theSelect[1] == 5,
        theResult[3] = "Straggler";
        theResult[4] = "Wellington Mk. Ic";
        theResult[5] = "Normal";
      ,);
      if (theSelect[1] == 6,
        theResult[3] = "Straggler";
        theResult[4] = "Stirling Mk. I";
        theResult[5] = "Low";
      ,);
      if (theSelect[1] == 7,
        theResult[3] = "Straggler";
        theResult[4] = "Stirling Mk. I";
        theResult[5] = "Normal";
      ,);
      if (theSelect[1] == 8,
        theResult[3] = "Straggler";
        theResult[4] = "Lancaster Mk. I";
        theResult[5] = "Normal";
      ,);
      if (theSelect[1] == 9,
        theResult[3] = "Straggler";
        theResult[4] = "Halifax Mk. I";
        theResult[5] = "Normal";
      ,);
      if (theSelect[1] == 10,
        theResult[3] = "Main";
        theResult[4] = "Wellington Mk. Ic";
        theResult[5] = "Normal";
      ,);
      if (theSelect[1] == 11,
        theResult[3] = "Main";
        theResult[4] = "Wellington Mk. Ic";
        theResult[5] = "Normal";
      ,);
      if (theSelect[1] == 12,
        theResult[3] = "Main";
        theResult[4] = "Stirling Mk. I";
        theResult[5] = "Normal";
      ,);
      if (theSelect[1] == 13,
        theResult[3] = "Main";
        theResult[4] = "Lancaster Mk. I";
        theResult[5] = "High";
      ,);
    ,);

    if (theResult[1] == "Massive",
      if (theSelect[1] == 1,
        theResult[3] = "Main";
        theResult[4] = "Halifax Mk. I";
        theResult[5] = "Normal";
      ,);
      if (theSelect[1] == 2,
        theResult[3] = "Straggler";
        theResult[4] = "Wellington Mk. Ic";
        theResult[5] = "Normal";
      ,);
      if (theSelect[1] == 3,
        theResult[3] = "Straggler";
        theResult[4] = "Stirling Mk. I";
        theResult[5] = "Normal";
      ,);
      if (theSelect[1] == 4,
        theResult[3] = "Straggler";
        theResult[4] = "Lancaster Mk. I";
        theResult[5] = "Normal";
      ,);
      if (theSelect[1] == 5,
        theResult[3] = "Straggler";
        theResult[4] = "Halifax Mk. I";
        theResult[5] = "Normal";
      ,);
      if (theSelect[1] == 6,
        theResult[3] = "Main";
        theResult[4] = "Wellington Mk. Ic";
        theResult[5] = "Low";
      ,);
      if (theSelect[1] == 7,
        theResult[3] = "Main";
        theResult[4] = "Wellington Mk. Ic";
        theResult[5] = "Normal";
      ,);
      if (theSelect[1] == 8,
        theResult[3] = "Main";
        theResult[4] = "Wellington Mk. Ic";
        theResult[5] = "Normal";
      ,);
      if (theSelect[1] == 9,
        theResult[3] = "Main";
        theResult[4] = "Stirling Mk. I";
        theResult[5] = "Normal";
      ,);
      if (theSelect[1] == 10,
        theResult[3] = "Main";
        theResult[4] = "Stirling Mk. I";
        theResult[5] = "Normal";
      ,);
      if (theSelect[1] == 11,
        theResult[3] = "Main";
        theResult[4] = "Lancaster Mk. I";
        theResult[5] = "High";
      ,);
      if (theSelect[1] == 12,
        theResult[3] = "Main";
        theResult[4] = "Lancaster Mk. I";
        theResult[5] = "High";
      ,);
      if (theSelect[1] == 13,
        theResult[3] = "Main";
        theResult[4] = "Halifax Mk. I";
        theResult[5] = "Normal";
      ,);
    ,);
  ,);

  if (thePeriod == 2,
    if (theResult[1] == "Normal",
      if (theSelect[1] == 1,
        theResult[3] = "Main";
        theResult[4] = "Halifax Mk. I";
        theResult[5] = "High";
      ,);
      if (theSelect[1] == 2,
        theResult[3] = "Straggler";
        theResult[4] = "Stirling Mk. I";
        theResult[5] = "Low";
      ,);
      if (theSelect[1] == 3,
        theResult[3] = "Straggler";
        theResult[4] = "Stirling Mk. I";
        theResult[5] = "Normal";
      ,);
      if (theSelect[1] == 4,
        theResult[3] = "Straggler";
        theResult[4] = "Lancaster Mk. I";
        theResult[5] = "Normal";
      ,);
      if (theSelect[1] == 5,
        theResult[3] = "Straggler";
        theResult[4] = "Lancaster Mk. I";
        theResult[5] = "Normal";
      ,);
      if (theSelect[1] == 6,
        theResult[3] = "Straggler";
        theResult[4] = "Halifax Mk. I";
        theResult[5] = "Normal";
      ,);
      if (theSelect[1] == 7,
        theResult[3] = "Straggler";
        theResult[4] = "Halifax Mk. I";
        theResult[5] = "Normal";
      ,);
      if (theSelect[1] == 8,
        theResult[3] = "Straggler";
        theResult[4] = "Halifax Mk. I";
        theResult[5] = "Normal";
      ,);
      if (theSelect[1] == 9,
        theResult[3] = "Main";
        theResult[4] = "Stirling Mk. I";
        theResult[5] = "Normal";
      ,);
      if (theSelect[1] == 10,
        theResult[3] = "Main";
        theResult[4] = "Lancaster Mk. I";
        theResult[5] = "Normal";
      ,);
      if (theSelect[1] == 11,
        theResult[3] = "Main";
        theResult[4] = "Lancaster Mk. I";
        theResult[5] = "Normal";
      ,);
      if (theSelect[1] == 12,
        theResult[3] = "Main";
        theResult[4] = "Lancaster Mk. I";
        theResult[5] = "High";
      ,);
      if (theSelect[1] == 13,
        theResult[3] = "Main";
        theResult[4] = "Halifax Mk. I";
        theResult[5] = "Normal";
      ,);
    ,);

    if (theResult[1] == "Massive",
      if (theSelect[1] == 1,
        theResult[3] = "Main";
        theResult[4] = "Halifax Mk. I";
        theResult[5] = "High";
      ,);
      if (theSelect[1] == 2,
        theResult[3] = "Straggler";
        theResult[4] = "Stirling Mk. I";
        theResult[5] = "Normal";
      ,);
      if (theSelect[1] == 3,
        theResult[3] = "Straggler";
        theResult[4] = "Lancaster Mk. I";
        theResult[5] = "Normal";
      ,);
      if (theSelect[1] == 4,
        theResult[3] = "Straggler";
        theResult[4] = "Halifax Mk. I";
        theResult[5] = "Normal";
      ,);
      if (theSelect[1] == 5,
        theResult[3] = "Straggler";
        theResult[4] = "Stirling Mk. I";
        theResult[5] = "Normal";
      ,);
      if (theSelect[1] == 6,
        theResult[3] = "Main";
        theResult[4] = "Stirling Mk. I";
        theResult[5] = "Normal";
      ,);
      if (theSelect[1] == 7,
        theResult[3] = "Main";
        theResult[4] = "Lancaster Mk. I";
        theResult[5] = "Normal";
      ,);
      if (theSelect[1] == 8,
        theResult[3] = "Main";
        theResult[4] = "Lancaster Mk. I";
        theResult[5] = "Normal";
      ,);
      if (theSelect[1] == 9,
        theResult[3] = "Main";
        theResult[4] = "Lancaster Mk. I";
        theResult[5] = "High";
      ,);
      if (theSelect[1] == 10,
        theResult[3] = "Main";
        theResult[4] = "Lancaster Mk. I";
        theResult[5] = "High";
      ,);
      if (theSelect[1] == 11,
        theResult[3] = "Main";
        theResult[4] = "Halifax Mk. I";
        theResult[5] = "Normal";
      ,);
      if (theSelect[1] == 12,
        theResult[3] = "Main";
        theResult[4] = "Halifax Mk. I";
        theResult[5] = "Normal";
      ,);
      if (theSelect[1] == 13,
        theResult[3] = "Main";
        theResult[4] = "Halifax Mk. I";
        theResult[5] = "Normal";
      ,);
    ,);
  ,);


  return(theResult);
}

{
  nj_move (aa, bb, dir, hfp) =

        /* aa = row 1 */
        /* bb = column 1 */
        /* dir = "NNE","E","SSE","SSW","W","NNW" */
        /* hfp = number of transitions */

  local (i, intDir, intAA, intBB, temp);

  /* Perform error checking on the aa and bb parameters. */

  if (aa >= 1,
    intAA = aa;
  ,
    print ("Error: aa must be greater than or equal to 1");
    return ([-1,-1]);
  );

  if (bb >= 1,
    intBB = bb;
  ,
    print ("Error: bb must be greater than or equal to 1");
    return ([-1,-1]);
  );

  /* Perform error checking on the dir parameter. */

  intDir = "ERROR";
  if ((dir == "N") || (dir == "n"),
    intDir="N";
  ,);

  if ((dir == "NNE") || (dir == "NNe") || (dir == "NnE") || (dir == "Nne") ||
      (dir == "nNE") || (dir == "nNe") || (dir == "nnE") || (dir == "nne"),
    intDir="NNE";
  ,);

  if ((dir == "E") || (dir == "e"),
    intDir="E";
  ,);

  if ((dir == "SSE") || (dir == "SSe") || (dir == "SsE") || (dir == "Sse") ||
      (dir == "sSE") || (dir == "sSe") || (dir == "ssE") || (dir == "sse"),
    intDir="SSE";
  ,);

  if ((dir == "SSW") || (dir == "SSw") || (dir == "SsW") || (dir == "Ssw") ||
      (dir == "sSW") || (dir == "sSw") || (dir == "ssW") || (dir == "ssw"),
    intDir="SSW";
  ,);

  if ((dir == "W") || (dir == "w"),
    intDir="W";
  ,);

  if ((dir == "NNW") || (dir == "NNw") || (dir == "NnW") || (dir == "Nnw") ||
      (dir == "nNW") || (dir == "nNw") || (dir == "nnW") || (dir == "nnw"),
    intDir="NNW";
  ,);

  if (intDir == "ERROR",
    print ("Error: dir must be one of \"NNE\",\"E\",\"SSE\",\"SSW\",\"W\",\"NNW\"");
    return ([-1,-1]);
  ,);

  /* Perform error checking on the hfp parameter. */

  if (hfp <= 0,
    print ("Error: hfp must be greater than or equal to 1");
    return ([-1,-1]);
  ,);

  /* Loop through each HFP in the desired direction. */

  for (i = 1, hfp,

    /* Perform moves based on the direction and whether we're on a      */
    /* side or in a space.                                              */

    if (intDir == "NNE",

      /* Process according to whether we start on an even or odd row.   */

      if ((intAA % 2) == 0,
        intAA += 1;                     /* Even row.                    */
      ,
        intAA += 1;                     /* Odd row.                     */
        intBB += 1;
      );
    ,);

    if (intDir == "E",
      intBB += 1;
    ,);

    if (intDir == "SSE",

      /* Process according to whether we start on an even or odd row.   */

      if ((intAA % 2) == 0,
        intAA -= 1;                     /* Even row.                    */
      ,
        intAA -= 1;                     /* Odd row.                     */
        intBB += 1;
      );
    ,);

    if (intDir == "SSW",

      /* Process according to whether we start on an even or odd row.   */

      if ((intAA % 2) == 0,
        intAA -= 1;                     /* Even row.                    */
        intBB -= 1;
      ,
        intAA -= 1;                     /* Odd row.                     */
      );
    ,);

    if (intDir == "W",
      intBB -= 1;
    ,);

    if (intDir == "NNW",

      /* Process according to whether we start on an even or odd row.   */

      if ((intAA % 2) == 0,
        intAA += 1;                     /* Even row.                    */
        intBB -= 1;
      ,
        intAA += 1;                     /* Odd row.                     */
      );
    ,);

  );

  return ([intAA,intBB]);
}

