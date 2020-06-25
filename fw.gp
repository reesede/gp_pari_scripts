
{
  fw_lh () =
    local (roll);
    roll=d100();
    if (roll==  1,  return (-115),);
    if (roll==  2,  return (-97),);
    if (roll==  3,  return (-87),);
    if (roll==  4,  return (-79),);
    if (roll==  5,  return (-74),);
    if (roll==  6,  return (-69),);
    if (roll==  7,  return (-65),);
    if (roll==  8,  return (-61),);
    if (roll==  9,  return (-58),);
    if (roll== 10,  return (-55),);
    if (roll== 11,  return (-52),);
    if (roll== 12,  return (-50),);
    if (roll== 13,  return (-48),);
    if (roll== 14,  return (-45),);
    if (roll== 15,  return (-43),);
    if (roll== 16,  return (-41),);
    if (roll== 17,  return (-40),);
    if (roll== 18,  return (-38),);
    if (roll== 19,  return (-36),);
    if (roll== 20,  return (-35),);
    if (roll== 21,  return (-33),);
    if (roll== 22,  return (-32),);
    if (roll== 23,  return (-30),);
    if (roll== 24,  return (-29),);
    if (roll== 25,  return (-27),);
    if (roll== 26,  return (-26),);
    if (roll== 27,  return (-25),);
    if (roll== 28,  return (-24),);
    if (roll== 29,  return (-22),);
    if (roll== 30,  return (-21),);
    if (roll== 31,  return (-20),);
    if (roll== 32,  return (-19),);
    if (roll== 33,  return (-18),);
    if (roll== 34,  return (-17),);
    if (roll== 35,  return (-15),);
    if (roll== 36,  return (-14),);
    if (roll== 37,  return (-13),);
    if (roll== 38,  return (-12),);
    if (roll== 39,  return (-11),);
    if (roll== 40,  return (-10),);
    if (roll== 41,  return (-9),);
    if (roll== 42,  return (-8),);
    if (roll== 43,  return (-7),);
    if (roll== 44,  return (-6),);
    if (roll== 45,  return (-5),);
    if (roll== 46,  return (-4),);
    if (roll== 47,  return (-3),);
    if (roll== 48,  return (-2),);
    if (roll== 49,  return (-1),);
    if (roll== 50,  return (0),);
    if (roll== 51,  return (1),);
    if (roll== 52,  return (2),);
    if (roll== 53,  return (3),);
    if (roll== 54,  return (4),);
    if (roll== 55,  return (5),);
    if (roll== 56,  return (6),);
    if (roll== 57,  return (7),);
    if (roll== 58,  return (8),);
    if (roll== 59,  return (9),);
    if (roll== 60,  return (10),);
    if (roll== 61,  return (11),);
    if (roll== 62,  return (12),);
    if (roll== 63,  return (13),);
    if (roll== 64,  return (14),);
    if (roll== 65,  return (15),);
    if (roll== 66,  return (17),);
    if (roll== 67,  return (18),);
    if (roll== 68,  return (19),);
    if (roll== 69,  return (20),);
    if (roll== 70,  return (21),);
    if (roll== 71,  return (22),);
    if (roll== 72,  return (24),);
    if (roll== 73,  return (25),);
    if (roll== 74,  return (26),);
    if (roll== 75,  return (27),);
    if (roll== 76,  return (29),);
    if (roll== 77,  return (30),);
    if (roll== 78,  return (32),);
    if (roll== 79,  return (33),);
    if (roll== 80,  return (35),);
    if (roll== 81,  return (36),);
    if (roll== 82,  return (38),);
    if (roll== 83,  return (40),);
    if (roll== 84,  return (41),);
    if (roll== 85,  return (43),);
    if (roll== 86,  return (45),);
    if (roll== 87,  return (48),);
    if (roll== 88,  return (50),);
    if (roll== 89,  return (52),);
    if (roll== 90,  return (55),);
    if (roll== 91,  return (58),);
    if (roll== 92,  return (61),);
    if (roll== 93,  return (65),);
    if (roll== 94,  return (69),);
    if (roll== 95,  return (74),);
    if (roll== 96,  return (79),);
    if (roll== 97,  return (87),);
    if (roll== 98,  return (97),);
    if (roll== 99,  return (115),);
    if (roll== 100, 
      roll=dx(2);
      if (roll==1,return(-130),);
      if (roll==2,return(130),);
    ,);
}

{
  fw_pquality (x) = 

  local (r1, plevel, keeneye, ace, hero, crackshot, gifted, missions, tempmissions, tempplevel, kills, promomissions);

  if ((x < 1) || (x > 5),
    print ("x must be in the range 1..5");
    return;
  ,);

  plevel = 0;
  keeneye = 0;
  ace = 0;
  hero = 0;
  crackshot = 0;
  gifted = 0;
  kills = 0;
  missons = 0;

  r1 = d10;
  if (x == 1,
    if (r1 <= 3, plevel=1;,);
    if ((r1 >= 4) && (r1 <= 6), plevel=2;,);
    if (r1 >= 7, plevel=3;,);
  ,);

  if (x == 2,
    if (r1 <= 2, plevel=1;,);
    if ((r1 >= 3) && (r1 <= 6), plevel=2;,);
    if ((r1 >= 7) && (r1 <= 9), plevel=3;,);
    if (r1 >= 10, plevel=4;,);
  ,);

  if (x == 3,
    if (r1 <= 1, plevel=1;,);
    if ((r1 >= 2) && (r1 <= 4), plevel=2;,);
    if ((r1 >= 5) && (r1 <= 9), plevel=3;,);
    if ((r1 >= 10), plevel=4;,);
  ,);

  if (x == 4,
    if (r1 <= 1, plevel=1;,);
    if ((r1 >= 2) && (r1 <= 3), plevel=2;,);
    if ((r1 >= 4) && (r1 <= 8), plevel=3;,);
    if ((r1 >= 9), plevel=4;,);
  ,);

  if (x == 5,
    if (r1 <= 2, plevel=2;,);
    if ((r1 >= 3) && (r1 <= 8), plevel=3;,);
    if ((r1 >= 9), plevel=4;,);
  ,);

  if (plevel == 1,
    if (d10 == 1, keeneye = 1;,);
  ,);

  if (plevel == 2,
    if (d10 == 1, keeneye = 1;,);
    if (d10 == 1, crackshot = 1;,);
  ,);

  if (plevel == 3,
    if (d10 <= 2, keeneye = 1;,);
    if (d10 == 1, ace = 1;,);
    if (d10 == 1, hero = 1;,);
    if (d10 == 1, crackshot = 1;,);
    if (ace == 1, 
      if (d10 == 1, crackshot = 1;,);
    ,);
    if (d10 == 1, gifted = 1;,);
  ,);
  
  if (plevel == 4,
    if (d10 <= 2, keeneye = 1;,);
    if (d10 <= 3, ace = 1;,);
    if (d10 <= 2, hero = 1;,);
    if (d10 <= 2, crackshot = 1;,);
    if (ace == 1, 
      if (d10 <= 2, crackshot = 1;,);
    ,);
    if (d10 <= 2, gifted = 1;,);
  ,);
  
  tempplevel = 1;
  missions = 0;
  tempmissions = 0;
  while (tempplevel < plevel,
    tempmissions = tempmissions + 1;
    if ((tempplevel == 1) && (tempmissions >= 3),
      if (d10 <= 8,
        missions += tempmissions;
        tempmissions = 0;
        tempplevel += 1;
      ,);
    ,);
    if ((tempplevel == 2) && (tempmissions >= 5),
      if (d10 <= 6,
        missions += tempmissions;
        tempmissions = 0;
        tempplevel += 1;
      ,);
    ,);
    if ((tempplevel == 3) && (tempmissions >= 5),
      if (d10 <= 6,
        missions += tempmissions;
        tempmissions = 0;
        tempplevel += 1;
      ,);
    ,);
  );

  if (plevel == 1, 
    promomissions = dx(3) - 1;
    missions += promomissions;
  ,);

  if (plevel == 2,
    promomissions = dx(5) - 1;
    missions += promomissions;
  ,);

  if (plevel == 3,
    promomissions = dx(5) - 1;
    missions += promomissions;
  ,);

  if (plevel == 4,
    promomissions = d10 - 1;
    missions += promomissions;
  ,);

  if (ace == 1, kills = 4 + dx(5);,);
  if ((plevel >= 3) && (ace == 0),
    kills = d10 - 6;
    if (kills < 0, kills = 0;,);
  ,);

  if (plevel == 1,print1("Recruit");,);
  if (plevel == 2,print1("Green");,);
  if (plevel == 3,print1("Regular");,);
  if (plevel == 4,print1("Veteran");,);

  if (keeneye == 1, print1 (", Keen Eyes");,);
  if (ace == 1, print1 (", Ace");,);
  if (hero == 1, print1 (", Hero");,);
  if (crackshot == 1, print1 (", Crack Shot");,);
  if (gifted == 1, print1 (", Gifted");,);
  print1 (", missions=", missions, " (", promomissions, ")");
  print  (", kills=", kills);
}

{
  fw_move (aa, bb, cc, dd, onSide, dir, hfp) = 

	/* aa = row 1 */
	/* bb = column 1 */
	/* cc = row 2 (only used if onside == 1) */
	/* dd = column 2 (only used if onside == 1) */
	/* onSide = 0 if in hex, 1 if between hexes */
	/* dir = "N","NNE","NE","E","SE","SSE","S","SSW","SW","W","NW","NNW" */
	/* hfp = number of transitions */

  local (i, intDir, intOnSide, intAA, intBB, intCC, intDD, temp);

  /* Perform error checking on the onSide parameter. */

  if ((onSide == 0) || (onSide == 1),
    intOnSide = onSide
  ,
    print ("Error: onSide must be 0 or 1");
    return ([-1,-1,-1,-1]);
  );

  /* Perform error checking on the aa, bb, cc, and dd parameters. */

  if (aa >= 1, 
    intAA = aa;
  ,
    print ("Error: aa must be greater than or equal to 1");
    return ([-1,-1,-1,-1]);
  );

  if (bb >= 1, 
    intBB = bb;
  ,
    print ("Error: bb must be greater than or equal to 1");
    return ([-1,-1,-1,-1]);
  );

  /* Only check cc and dd if onSide is 1. */

  if (onSide == 1,
    if (cc >= 1, 
      intCC = cc;
    ,
      print ("Error: cc must be greater than or equal to 1");
      return ([-1,-1,-1,-1]);
    );

    if (dd >= 1, 
      intDD = dd;
    ,
      print ("Error: dd must be greater than or equal to 1");
      return ([-1,-1,-1,-1]);
    );
  ,
    intCC = -1;
    intDD = -1;
  );

  /* Perform error checking on the dir parameter. */

  intDir = "ERROR";
  if ((dir == "N") || (dir == "n"),
    intDir="N";
  ,);

  if ((dir == "NNE") || (dir == "NNe") || (dir == "NnE") || (dir == "Nne") ||
      (dir == "nNE") || (dir == "nNe") || (dir == "nnE") || (dir == "nne"),
    intDir="NNE";
    if (onSide == 1,
      print ("Error: for dir="NNE", onSide must be 0");
      return ([-1,-1,-1,-1]);
    ,);
  ,);

  if ((dir == "NE") || (dir == "Ne") || (dir == "nE") || (dir == "ne"),
    intDir="NE";
  ,);

  if ((dir == "E") || (dir == "e"),
    intDir="E";
    if (onSide == 1,
      print ("Error: for dir="E", onSide must be 0");
      return ([-1,-1,-1,-1]);
    ,);
  ,);

  if ((dir == "SE") || (dir == "Se") || (dir == "sE") || (dir == "se"),
    intDir="SE";
  ,);

  if ((dir == "SSE") || (dir == "SSe") || (dir == "SsE") || (dir == "Sse") ||
      (dir == "sSE") || (dir == "sSe") || (dir == "ssE") || (dir == "sse"),
    intDir="SSE";
    if (onSide == 1,
      print ("Error: for dir="SSE", onSide must be 0");
      return ([-1,-1,-1,-1]);
    ,);
  ,);

  if ((dir == "S") || (dir == "s"),
    intDir="S";
  ,);

  if ((dir == "SSW") || (dir == "SSw") || (dir == "SsW") || (dir == "Ssw") ||
      (dir == "sSW") || (dir == "sSw") || (dir == "ssW") || (dir == "ssw"),
    intDir="SSW";
    if (onSide == 1,
      print ("Error: for dir="SSW", onSide must be 0");
      return ([-1,-1,-1,-1]);
    ,);
  ,);

  if ((dir == "SW") || (dir == "Sw") || (dir == "sW") || (dir == "sw"),
    intDir="SW";
  ,);

  if ((dir == "W") || (dir == "w"),
    intDir="W";
    if (onSide == 1,
      print ("Error: for dir="W", onSide must be 0");
      return ([-1,-1,-1,-1]);
    ,);
  ,);

  if ((dir == "NW") || (dir == "Nw") || (dir == "nW") || (dir == "nw"),
    intDir="NW";
  ,);

  if ((dir == "NNW") || (dir == "NNw") || (dir == "NnW") || (dir == "Nnw") ||
      (dir == "nNW") || (dir == "nNw") || (dir == "nnW") || (dir == "nnw"),
    intDir="NNW";
    if (onSide == 1,
      print ("Error: for dir="NNW", onSide must be 0");
      return ([-1,-1,-1,-1]);
    ,);
  ,);

  if (intDir == "ERROR",
    print ("Error: dir must be one of \"N\",\"NNE\",\"NE\",\"E\",\"SE\",\"SSE\",\"S\",\"SSW\",\"SW\",\"W\",\"NW\",\"NNW\"");
    return ([-1,-1,-1,-1]);
  ,);

  /* Perform error checking on the hfp parameter. */

  if (hfp <= 0, 
    print ("Error: hfp must be greater than or equal to 1");
    return ([-1,-1,-1,-1]);
  ,);

  /* Loop through each HFP in the desired direction. */

  for (i = 1, hfp,

    /* Perform moves based on the direction and whether we're on a	*/
    /* side or in a space.					 	*/

    if (intDir == "N",
      if (intOnSide == 0,

        /* Process in space according to whether the row is even	*/
	/* or odd.							*/

        if ((intAA % 2) == 0,
          intAA = intAA + 1;		/* Initial even space.		*/
          intBB = intBB - 1;
          intCC = intAA;
          intDD = intBB + 1;
          intOnSide = 1;
        ,
          intAA = intAA + 1;		/* Initial odd space.		*/
          intCC = intAA;
          intDD = intBB + 1;
          intOnSide = 1;
        );
      ,

        /* Process the edge according to whether the row is even	*/
	/* or odd.							*/

        if ((intAA % 2) == 0,
          intAA = intAA + 1;
          intCC = -1;
          intDD = -1;
          intOnSide = 0;
        ,
          intAA = intAA + 1;
          intBB = intDD;
          intCC = -1;
          intDD = -1;
          intOnSide = 0;
        );
      );
    ,);

    if (intDir == "NNE",

      /* Process according to whether we start on an even or odd row.	*/

      if ((intAA % 2) == 0,
        intAA += 1;			/* Even row.			*/
      ,
        intAA += 1;			/* Odd row.			*/
        intBB += 1;
      );
    ,);

    if (intDir == "NE",

      /* Process according to whether we're in a space or on a side.	*/

      if (intOnSide == 0,

        /* Process according to whether we're in an even row or an odd	*/
	/* row.								*/

        if ((intAA % 2) == 0,
          intAA += 1;			/* Even row.			*/
          intCC = intAA - 1;
          intDD = intBB + 1;
          intOnSide = 1;
        ,
          intAA += 1;			/* Odd row.			*/
          intBB += 1;
          intCC = intAA - 1;
          intDD = intBB;
          intOnSide = 1;
        );
      , 				/* On side.			*/

        /* Make sure that intAA/intBB represent the northern-most row.	*/
        /* If not, switch intAA/intBB with intCC/intDD.			*/

        if (intAA < intCC,
          temp = intAA;
          intAA = intCC;
          intCC = temp;
          temp = intBB;
          intBB = intDD;
          intDD = temp;
        ,);

        /* If we're on a side, verify that the two locations are valid.	*/

        if ((intAA - intCC) != 1,
          print ("Error: in NE move from edge, (intAA - intCC) must be 1.");
          return ([-1,-1,-1,-1]);
        ,);

        if ((intAA % 2) == 0,
          if (intBB != intDD,
            print ("Error: in NE move from even edge, intBB must equal intDD.");
            return ([-1,-1,-1,-1]);
          ,);
        ,
          if ((intDD - intBB) != 1,
            print ("Error: in NE move from odd edge, intBB must be 1 less than intDD.");
            return ([-1,-1,-1,-1]);
          ,);
        );

        /* Perform move (same for even row and odd row).		*/

        intBB = intBB + 1;
        intCC = -1;
        intDD = -1;
        intOnSide = 0;
      );
    ,);

    if (intDir == "E",
      intBB += 1;
    ,);

    if (intDir == "SE",

      /* Process according to whether we're in a space or on a side.	*/

      if (intOnSide == 0,

        /* Process according to whether we're in an even row or an odd	*/
	/* row.								*/

        if ((intAA % 2) == 0,
          intBB = intBB + 1;		/* Even row.			*/
          intCC = intAA - 1;
          intDD = intBB - 1;
          intOnSide = 1;
        ,
          intBB += 1;			/* Odd row.			*/
          intCC = intAA - 1;
          intDD = intBB;
          intOnSide = 1;
        );
      , 				/* On side.			*/

        /* Make sure that intAA/intBB represent the northern-most row.	*/
        /* If not, switch intAA/intBB with intCC/intDD.			*/

        if (intAA < intCC,
          temp = intAA;
          intAA = intCC;
          intCC = temp;
          temp = intBB;
          intBB = intDD;
          intDD = temp;
        ,);

        /* If we're on a side, verify that the two locations are valid.	*/

        if ((intAA - intCC) != 1,
          print ("Error: in SE move from edge, (intAA - intCC) must be 1.");
          return ([-1,-1,-1,-1]);
        ,);

        if ((intAA % 2) == 0,
          if ((intBB - intDD) != 1,
            print ("Error: in SE move from even edge, intDD must be 1 less than intBB.");
            return ([-1,-1,-1,-1]);
          ,);
        ,
          if (intBB != intDD,
            print ("Error: in SE move from odd edge, intBB must equal intDD.");
            return ([-1,-1,-1,-1]);
          ,);
        );

        /* Perform move depending on whether intAA is even or odd.	*/

        if ((intAA % 2) == 0,
          intAA = intAA - 1;			/* Even row.		*/
          intCC = -1;
          intDD = -1;
          intOnSide = 0;
        ,
          intAA = intAA - 1;			/* Odd row.		*/
          intBB = intBB + 1;
          intCC = -1;
          intDD = -1;
          intOnSide = 0;
        );
      );
    ,);

    if (intDir == "SSE",

      /* Process according to whether we start on an even or odd row.	*/

      if ((intAA % 2) == 0,
        intAA -= 1;			/* Even row.			*/
      ,
        intAA -= 1;			/* Odd row.			*/
        intBB += 1;
      );
    ,);

    if (intDir == "S",
      if (intOnSide == 0,

        /* Process in space according to whether the row is even	*/
	/* or odd.							*/

        if ((intAA % 2) == 0,
          intAA = intAA - 1;		/* Initial even space.		*/
          intBB = intBB - 1;
          intCC = intAA;
          intDD = intBB + 1;
          intOnSide = 1;
        ,
          intAA = intAA - 1;		/* Initial odd space.		*/
          intCC = intAA;
          intDD = intBB + 1;
          intOnSide = 1;
        );
      ,

        /* Process the edge according to whether the row is even	*/
	/* or odd.							*/

        if ((intAA % 2) == 0,
          intAA = intAA - 1;
          intCC = -1;
          intDD = -1;
          intOnSide = 0;
        ,
          intAA = intAA - 1;
          intBB = intDD;
          intCC = -1;
          intDD = -1;
          intOnSide = 0;
        );
      );
    ,);

    if (intDir == "SSW",

      /* Process according to whether we start on an even or odd row.	*/

      if ((intAA % 2) == 0,
        intAA -= 1;			/* Even row.			*/
        intBB -= 1;
      ,
        intAA -= 1;			/* Odd row.			*/
      );
    ,);

    if (intDir == "SW",

      /* Process according to whether we're in a space or on a side.	*/

      if (intOnSide == 0,

        /* Process according to whether we're in an even row or an odd	*/
	/* row.								*/

        if ((intAA % 2) == 0,
          intBB -= 1;			/* Even row.			*/
          intCC = intAA - 1;
          intDD = intBB;
          intOnSide = 1;
        ,
          intBB -= 1;			/* Odd row.			*/
          intCC = intAA - 1;
          intDD = intBB + 1;
          intOnSide = 1;
        );
      , 				/* On side.			*/

        /* Make sure that intAA/intBB represent the northern-most row.	*/
        /* If not, switch intAA/intBB with intCC/intDD.			*/

        if (intAA < intCC,
          temp = intAA;
          intAA = intCC;
          intCC = temp;
          temp = intBB;
          intBB = intDD;
          intDD = temp;
        ,);

        /* If we're on a side, verify that the two locations are valid.	*/

        if ((intAA - intCC) != 1,
          print ("Error: in SW move from edge, (intAA - intCC) must be 1.");
          return ([-1,-1,-1,-1]);
        ,);

        if ((intAA % 2) == 0,
          if (intBB != intDD,
            print ("Error: in SW move from even edge, intBB must equal intDD.");
            return ([-1,-1,-1,-1]);
          ,);
        ,
          if ((intDD - intBB) != 1,
            print ("Error: in SW move from odd edge, intBB must be 1 less than intDD.");
            return ([-1,-1,-1,-1]);
          ,);
        );

        /* Perform move depending on whether intAA is even or odd.	*/

        if ((intAA % 2) == 0,
          intAA = intAA - 1;			/* Even row.		*/
          intBB = intBB - 1;
          intCC = -1;
          intDD = -1;
          intOnSide = 0;
        ,
          intAA = intAA - 1;			/* Odd row.		*/
          intCC = -1;
          intDD = -1;
          intOnSide = 0;
        );
      );
    ,);

    if (intDir == "W",
      intBB -= 1;
    ,);

    if (intDir == "NW",

      /* Process according to whether we're in a space or on a side.	*/

      if (intOnSide == 0,

        /* Process according to whether we're in an even row or an odd	*/
	/* row.								*/

        if ((intAA % 2) == 0,
          intAA += 1;			/* Even row.			*/
          intBB -= 1;
          intCC = intAA - 1;
          intDD = intBB;
          intOnSide = 1;
        ,
          intAA += 1;			/* Odd row.			*/
          intCC = intAA - 1;
          intDD = intBB - 1;
          intOnSide = 1;
        );
      , 				/* On side.			*/

        /* Make sure that intAA/intBB represent the northern-most row.	*/
        /* If not, switch intAA/intBB with intCC/intDD.			*/

        if (intAA < intCC,
          temp = intAA;
          intAA = intCC;
          intCC = temp;
          temp = intBB;
          intBB = intDD;
          intDD = temp;
        ,);

        /* If we're on a side, verify that the two locations are valid.	*/

        if ((intAA - intCC) != 1,
          print ("Error: in NW move from edge, (intAA - intCC) must be 1.");
          return ([-1,-1,-1,-1]);
        ,);

        if ((intAA % 2) == 0,
          if ((intBB - intDD) != 1,
            print ("Error: in NW move from even edge, intDD must be 1 less than intBB.");
            return ([-1,-1,-1,-1]);
          ,);
        ,
          if (intBB != intDD,
            print ("Error: in NW move from odd edge, intBB must equal intDD.");
            return ([-1,-1,-1,-1]);
          ,);
        );

        /* Perform move (same for even and odd rows).			*/

        intBB = intBB - 1;
        intCC = -1;
        intDD = -1;
        intOnSide = 0;
      );
    ,);


    if (intDir == "NNW",

      /* Process according to whether we start on an even or odd row.	*/

      if ((intAA % 2) == 0,
        intAA += 1;			/* Even row.			*/
        intBB -= 1;
      ,
        intAA += 1;			/* Odd row.			*/
      );
    ,);

  );

  if (intOnSide == 0,
    return ([intAA,intBB,-1,-1]);
  ,
    return ([intAA,intBB,intCC,intDD]);
  );
}


