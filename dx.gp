
{
  d4() =
    return (random(4)+1);
}

{
  d6() =
    return (random(6)+1);
}

{
  d6x2() =
    return (random(6)+random(6)+2);
}

{
  d6x3() =
    return (random(6)+random(6)+random(6)+3);
}

{
  d8() =
    return (random(8)+1);
}

{
  d10() =
    return (random(10)+1);
}

{
  d12() =
    return (random(12)+1);
}

{
  d20() =
    return (random(20)+1);
}

{
  d30() =
    return (random(30)+1);
}

{
  d100() =
    return (random(100)+1);
}

{
  dx(x) =
    return (random(x)+1);
}

{
  sr() =
    local (the_val);

    the_val = [0,0];
    the_val[1] = d100();
    the_val[2] = d10();

    return (the_val);
}

{
  pcheck (x) =
    local (mval, i);

    mval = 40.0 / x;

    for (i = 1, x,
      if ((random(10000) * 1.0 / 100.0) <= mval,
        print(i);
      ,);
    );
}

{
  hcheck (x) = 
    local (i);

    for (i = 1, x,
      if (d100 > 95,
        print (i, " (", d100, ")");
      ,);
    );
}

{
  ucheck (x) = 
    local (i, j, k, done, usage, umatrix, temp);

    umatrix=matrix(x, 3);
    for (i = 1, x,
      umatrix[i, 1] = 0;
      umatrix[i, 2] = 0;
      umatrix[i, 3] = 0;
    );
    k = 0;
    for (i = 1, 30,
      usage = random (x) + 1;
      j = 1;
      done = 0;
      while ((j <= x) && (done == 0),
        if (umatrix[j, 1] == 0,
          umatrix[j, 1] = usage;
          umatrix[j, 2] = 1;
          done = 1;
          k = j;
        ,
          if (umatrix[j, 1] == usage,
            umatrix[j, 2]++;
            done = 1;
          ,
            j++;
          );
        );
      );
      if (random(10000) < 150,
        umatrix[j, 3] = 1;
      ,);
    );
    for (i = 1, k,
      for (j = 1, k,
        if (umatrix[j, 1] > umatrix[i, 1],
          temp = umatrix[j, 1];
          umatrix[j, 1] = umatrix[i, 1];
          umatrix[i, 1] = temp;
          temp = umatrix[j, 2];
          umatrix[j, 2] = umatrix[i, 2];
          umatrix[i, 2] = temp;
          temp = umatrix[j, 3];
          umatrix[j, 3] = umatrix[i, 3];
          umatrix[i, 3] = temp;
        ,);
      );
    );
    for (i = 1, x,
      if (umatrix[i, 1] != 0,
        print (umatrix[i, 1], "  ", umatrix[i, 2], "  ", umatrix[i, 3]);
      ,);
    );
}

{
  attcheck(r1, r2) =

    local (i, lx, hx, rx);

    if (r1 >= r2,
      hx = r1;
      lx = r2;
    ,
      hx = r2;
      lx = r1;
    );

    rx = lx + hx;
    if ((rx % 2) != 0,
      if (d6() >= 4,
        rx += 1;
      ,
        rx -= 1;
      );
    ,);
    rx = rx/2;
    i = d6();
    if (i == 1, rx = lx;,);
    if (i == 6, rx = hx;,);
    i = d6();
    if (i == 1, rx -= 2;,);
    if (i == 2, rx -= 1;,);
    if (i == 5, rx += 1;,);
    if (i == 6, rx += 2;,);
    return (rx);
}

{
  dnd_char() =
    dnd_char_3d6_method();
}

{
  dnd_char_3d6_method() =
    local (i, j, k, l, r, s, temp, attr_array);
    temp = matrix (3,1);
    attr_array = matrix (7,1);
    for (i = 1, 7,
      for (j = 1, 3,temp[j,1] = 0);
      for (j = 1, 3, 
        r = d6();
        k = 1;
        while (k <= 3,
          if (r > temp[k,1],break;,;);
          k++;
        );
        l = 3;
        while (l > k,
          temp[l,1] = temp[l-1,1];
          l--;
        );
        temp[k,1] = r;
      );
      attr_array[i,1]=temp[1,1]+temp[2,1]+temp[3,1];
    );
    print ("STR=", attr_array[1,1]);
    print ("DEX=", attr_array[2,1]);
    print ("CON=", attr_array[3,1]);
    print ("INT=", attr_array[4,1]);
    print ("WIS=", attr_array[5,1]);
    print ("CHA=", attr_array[6,1]);
    print ("APP=", attr_array[7,1], " (optional)");
} 

{
  dnd_char_4d6_method() =
    local (i, j, k, l, r, s, temp,attr_array);
    temp = matrix (4,1);
    attr_array = matrix (7,1);
    for (i = 1, 7,
      for (j = 1, 4,temp[j,1] = 0);
      for (j = 1, 4, 
        r = d6();
        k = 1;
        while (k <= 4,
          if (r > temp[k,1],break;,;);
          k++;
        );
        l = 4;
        while (l > k,
          temp[l,1] = temp[l-1,1];
          l--;
        );
        temp[k,1] = r;
      );
      attr_array[i,1]=temp[1,1]+temp[2,1]+temp[3,1];
    );
    print ("STR=", attr_array[1,1]);
    print ("DEX=", attr_array[2,1]);
    print ("CON=", attr_array[3,1]);
    print ("INT=", attr_array[4,1]);
    print ("WIS=", attr_array[5,1]);
    print ("CHA=", attr_array[6,1]);
    print ("APP=", attr_array[7,1], " (optional)");
} 

{
  cs_char() =
    local (i, j, k, l, r, s, temp);
    temp = matrix (11,1);
    for (i = 1, 11,temp[i,1] = 0);
    for (i = 1, 11,
      r = d10() + d10();
      k = 1;
      while (k <= 11,
        if (r > temp[k,1],break;,;);
        k++;
      );
      l = 11;
      while (l > k,
        temp[l,1] = temp[l-1,1];
        l--;
      );
      temp[k,1] = r;
    );
    print (temp[1,1]);
    print (temp[2,1]);
    print (temp[3,1]);
    print (temp[4,1]);
    print (temp[5,1]);
    print (temp[6,1]);
    print (temp[7,1]);
    print (temp[8,1]);
    print (temp[9,1]);
} 

{
  trav_char() =
    local (i, j, k, l, r, s, temp);
    temp = matrix (7,1);
    for (i = 1, 7,temp[i,1] = 0);
    for (i = 1, 7,
      r = d6() + d6() + d6();
      k = 1;
      while (k <= 7,
        if (r > temp[k,1],break;,;);
        k++;
      );
      l = 7;
      while (l > k,
        temp[l,1] = temp[l-1,1];
        l--;
      );
      temp[k,1] = r;
    );
    print (temp[1,1]);
    print (temp[2,1]);
    print (temp[3,1]);
    print (temp[4,1]);
    print (temp[5,1]);
    print (temp[6,1]);
} 


{
  coc_char() =
    local (i, j, k, l, r, s, temp);
    temp = matrix (8,1);
    for (i = 1, 8,temp[i,1] = 0);
    temp[1,1]=d6()+d6()+d6();
    temp[2,1]=d6()+d6()+d6();
    temp[3,1]=6+d6()+d6();
    temp[4,1]=d6()+d6()+d6();
    temp[5,1]=d6()+d6()+d6();
    temp[6,1]=6+d6()+d6();
    temp[7,1]=d6()+d6()+d6();
    temp[8,1]=6+d6()+d6();
    print ("STR=", temp[1,1]);
    print ("CON=", temp[2,1]);
    print ("SIZ=", temp[3,1]);
    print ("DEX=", temp[4,1]);
    print ("APP=", temp[5,1]);
    print ("INT=", temp[6,1]);
    print ("POW=", temp[7,1]);
    print ("EDU=", temp[8,1]);
} 


{
  tdc(n) =
    local (i, tdc_matrix, temp, found, value);
    if (n < 1,
      print ("Error - n < 1");
      return;
    ,);
    if (n > 24,
      print ("Error - n > 24");
      return;
    ,);
    tdc_matrix = matrix(24,2);
    tdc_matrix[1,1] = tdc_matrix[2,1] = -3;
    tdc_matrix[3,1] = tdc_matrix[4,1] = tdc_matrix[5,1] = tdc_matrix[6,1] = -2;
    tdc_matrix[7,1] = tdc_matrix[8,1] = tdc_matrix[9,1] = tdc_matrix[10,1] = -1;
    tdc_matrix[11,1] = tdc_matrix[12,1] = tdc_matrix[13,1] = tdc_matrix[14,1] = 0;
    tdc_matrix[15,1] = tdc_matrix[16,1] = tdc_matrix[17,1] = tdc_matrix[18,1] = 1;
    tdc_matrix[19,1] = tdc_matrix[20,1] = tdc_matrix[21,1] = tdc_matrix[22,1] = 2;
    tdc_matrix[23,1] = tdc_matrix[24,1] = 3;
    for (i = 1, 24,
      tdc_matrix[i,2] = 0;
    );
    i = 1;
    while (i <= n,
      found = 0;
      while (found == 0,
        temp = dx(24);
        if (tdc_matrix[temp, 2] == 0,
          tdc_matrix[temp, 2] = 1;
          value = tdc_matrix[temp, 1];
          found = 1;
        ,);
      );
      if (value > 0,
        print ("TDC ", i, " = +", value);
      ,
        print ("TDC ", i, " = ", value);
      );
      i++;
    );
}

{
  tdc2(wp, n) =
    local (i, tdc_matrix, tdc_max, temp, found, value);
    if (wp < 1,
      print ("Error - wp < 1");
      return;
    ,);
    if (wp > 5,
      print ("Error - wp < 1");
      return;
    ,);
    if (n < 1,
      print ("Error - n < 1");
      return;
    ,);
    if (n > 20,
      print ("Error - n > 40");
      return;
    ,);
    if (wp == 1,
      tdc_max = 40;
      tdc_matrix = matrix(40,2);
      tdc_matrix[1,1]  = -4;
      tdc_matrix[2,1]  = -3;
      tdc_matrix[3,1]  = -3;
      tdc_matrix[4,1]  = -3;
      tdc_matrix[5,1]  = -2;
      tdc_matrix[6,1]  = -2;
      tdc_matrix[7,1]  = -2;
      tdc_matrix[8,1]  = -2;
      tdc_matrix[9,1]  = -2;
      tdc_matrix[10,1] = -2;
      tdc_matrix[11,1] = -2;
      tdc_matrix[12,1] = -1;
      tdc_matrix[13,1] = -1;
      tdc_matrix[14,1] = -1;
      tdc_matrix[15,1] = -1;
      tdc_matrix[16,1] = -1;
      tdc_matrix[17,1] = -1;
      tdc_matrix[18,1] = -1;
      tdc_matrix[19,1] = -1;
      tdc_matrix[20,1] =  0;
      tdc_matrix[21,1] =  0;
      tdc_matrix[22,1] =  0;
      tdc_matrix[23,1] =  0;
      tdc_matrix[24,1] =  0;
      tdc_matrix[25,1] =  0;
      tdc_matrix[26,1] =  0;
      tdc_matrix[27,1] =  0;
      tdc_matrix[28,1] =  1;
      tdc_matrix[29,1] =  1;
      tdc_matrix[30,1] =  1;
      tdc_matrix[31,1] =  1;
      tdc_matrix[32,1] =  1;
      tdc_matrix[33,1] =  1;
      tdc_matrix[34,1] =  1;
      tdc_matrix[35,1] =  2;
      tdc_matrix[36,1] =  2;
      tdc_matrix[37,1] =  2;
      tdc_matrix[38,1] =  2;
      tdc_matrix[39,1] =  3;
      tdc_matrix[40,1] =  4;
    ,);
    if (wp == 2,
      tdc_max = 40;
      tdc_matrix = matrix(40,2);
      tdc_matrix[1,1]  = -4;
      tdc_matrix[2,1]  = -3;
      tdc_matrix[3,1]  = -3;
      tdc_matrix[4,1]  = -3;
      tdc_matrix[5,1]  = -2;
      tdc_matrix[6,1]  = -2;
      tdc_matrix[7,1]  = -2;
      tdc_matrix[8,1]  = -2;
      tdc_matrix[9,1]  = -2;
      tdc_matrix[10,1] = -2;
      tdc_matrix[11,1] = -2;
      tdc_matrix[12,1] = -1;
      tdc_matrix[13,1] = -1;
      tdc_matrix[14,1] = -1;
      tdc_matrix[15,1] = -1;
      tdc_matrix[16,1] = -1;
      tdc_matrix[17,1] = -1;
      tdc_matrix[18,1] = -1;
      tdc_matrix[19,1] = -1;
      tdc_matrix[20,1] =  0;
      tdc_matrix[21,1] =  0;
      tdc_matrix[22,1] =  0;
      tdc_matrix[23,1] =  0;
      tdc_matrix[24,1] =  0;
      tdc_matrix[25,1] =  0;
      tdc_matrix[26,1] =  0;
      tdc_matrix[27,1] =  0;
      tdc_matrix[28,1] =  0;
      tdc_matrix[29,1] =  1;
      tdc_matrix[30,1] =  1;
      tdc_matrix[31,1] =  1;
      tdc_matrix[32,1] =  1;
      tdc_matrix[33,1] =  1;
      tdc_matrix[34,1] =  1;
      tdc_matrix[35,1] =  1;
      tdc_matrix[36,1] =  1;
      tdc_matrix[37,1] =  2;
      tdc_matrix[38,1] =  2;
      tdc_matrix[39,1] =  3;
      tdc_matrix[40,1] =  4;
    ,);
    if (wp == 3,
      tdc_max = 42;
      tdc_matrix = matrix(42,2);
      tdc_matrix[1,1]  = -4;
      tdc_matrix[2,1]  = -3;
      tdc_matrix[3,1]  = -3;
      tdc_matrix[4,1]  = -2;
      tdc_matrix[5,1]  = -2;
      tdc_matrix[6,1]  = -2;
      tdc_matrix[7,1]  = -2;
      tdc_matrix[8,1]  = -2;
      tdc_matrix[9,1]  = -2;
      tdc_matrix[10,1] = -2;
      tdc_matrix[11,1] = -1;
      tdc_matrix[12,1] = -1;
      tdc_matrix[13,1] = -1;
      tdc_matrix[14,1] = -1;
      tdc_matrix[15,1] = -1;
      tdc_matrix[16,1] = -1;
      tdc_matrix[17,1] =  0;
      tdc_matrix[18,1] =  0;
      tdc_matrix[19,1] =  0;
      tdc_matrix[20,1] =  0;
      tdc_matrix[21,1] =  0;
      tdc_matrix[22,1] =  0;
      tdc_matrix[23,1] =  0;
      tdc_matrix[24,1] =  0;
      tdc_matrix[25,1] =  0;
      tdc_matrix[26,1] =  1;
      tdc_matrix[27,1] =  1;
      tdc_matrix[28,1] =  1;
      tdc_matrix[29,1] =  1;
      tdc_matrix[30,1] =  1;
      tdc_matrix[31,1] =  1;
      tdc_matrix[32,1] =  1;
      tdc_matrix[33,1] =  1;
      tdc_matrix[34,1] =  2;
      tdc_matrix[35,1] =  2;
      tdc_matrix[36,1] =  2;
      tdc_matrix[37,1] =  2;
      tdc_matrix[38,1] =  2;
      tdc_matrix[39,1] =  2;
      tdc_matrix[40,1] =  3;
      tdc_matrix[41,1] =  3;
      tdc_matrix[42,1] =  4;
    ,);
    if (wp == 4,
      tdc_max = 44;
      tdc_matrix = matrix(44,2);
      tdc_matrix[1,1]  = -4;
      tdc_matrix[2,1]  = -3;
      tdc_matrix[3,1]  = -3;
      tdc_matrix[4,1]  = -3;
      tdc_matrix[5,1]  = -2;
      tdc_matrix[6,1]  = -2;
      tdc_matrix[7,1]  = -2;
      tdc_matrix[8,1]  = -2;
      tdc_matrix[9,1]  = -2;
      tdc_matrix[10,1] = -2;
      tdc_matrix[11,1] = -2;
      tdc_matrix[12,1] = -1;
      tdc_matrix[13,1] = -1;
      tdc_matrix[14,1] = -1;
      tdc_matrix[15,1] = -1;
      tdc_matrix[16,1] = -1;
      tdc_matrix[17,1] = -1;
      tdc_matrix[18,1] = -1;
      tdc_matrix[19,1] = -1;
      tdc_matrix[20,1] =  0;
      tdc_matrix[21,1] =  0;
      tdc_matrix[22,1] =  0;
      tdc_matrix[23,1] =  0;
      tdc_matrix[24,1] =  0;
      tdc_matrix[25,1] =  0;
      tdc_matrix[26,1] =  0;
      tdc_matrix[27,1] =  0;
      tdc_matrix[28,1] =  0;
      tdc_matrix[29,1] =  0;
      tdc_matrix[30,1] =  1;
      tdc_matrix[31,1] =  1;
      tdc_matrix[32,1] =  1;
      tdc_matrix[33,1] =  1;
      tdc_matrix[34,1] =  1;
      tdc_matrix[35,1] =  1;
      tdc_matrix[36,1] =  1;
      tdc_matrix[37,1] =  1;
      tdc_matrix[38,1] =  2;
      tdc_matrix[39,1] =  2;
      tdc_matrix[40,1] =  2;
      tdc_matrix[41,1] =  2;
      tdc_matrix[42,1] =  3;
      tdc_matrix[43,1] =  3;
      tdc_matrix[44,1] =  4;
    ,);
    if (wp == 5,
      tdc_max = 46;
      tdc_matrix = matrix(46,2);
      tdc_matrix[1,1]  = -4;
      tdc_matrix[2,1]  = -3;
      tdc_matrix[3,1]  = -3;
      tdc_matrix[4,1]  = -2;
      tdc_matrix[5,1]  = -2;
      tdc_matrix[6,1]  = -2;
      tdc_matrix[7,1]  = -2;
      tdc_matrix[8,1]  = -2;
      tdc_matrix[9,1]  = -2;
      tdc_matrix[10,1] = -2;
      tdc_matrix[11,1] = -1;
      tdc_matrix[12,1] = -1;
      tdc_matrix[13,1] = -1;
      tdc_matrix[14,1] = -1;
      tdc_matrix[15,1] = -1;
      tdc_matrix[16,1] = -1;
      tdc_matrix[17,1] = -1;
      tdc_matrix[18,1] = -1;
      tdc_matrix[19,1] =  0;
      tdc_matrix[20,1] =  0;
      tdc_matrix[21,1] =  0;
      tdc_matrix[22,1] =  0;
      tdc_matrix[23,1] =  0;
      tdc_matrix[24,1] =  0;
      tdc_matrix[25,1] =  0;
      tdc_matrix[26,1] =  0;
      tdc_matrix[27,1] =  0;
      tdc_matrix[28,1] =  1;
      tdc_matrix[29,1] =  1;
      tdc_matrix[30,1] =  1;
      tdc_matrix[31,1] =  1;
      tdc_matrix[32,1] =  1;
      tdc_matrix[33,1] =  1;
      tdc_matrix[34,1] =  1;
      tdc_matrix[35,1] =  1;
      tdc_matrix[36,1] =  2;
      tdc_matrix[37,1] =  2;
      tdc_matrix[38,1] =  2;
      tdc_matrix[39,1] =  2;
      tdc_matrix[40,1] =  2;
      tdc_matrix[41,1] =  2;
      tdc_matrix[42,1] =  2;
      tdc_matrix[43,1] =  3;
      tdc_matrix[44,1] =  3;
      tdc_matrix[45,1] =  3;
      tdc_matrix[46,1] =  4;
    ,);
    for (i=1,tdc_max,tdc_matrix[i,2]=0;);
    i = 1;
    while (i <= n,
      found = 0;
      while (found == 0,
        temp = dx(tdc_max);
        if (tdc_matrix[temp, 2] == 0,
          tdc_matrix[temp, 2] = 1;
          value = tdc_matrix[temp, 1];
          found = 1;
        ,);
      );
      if (value > 0,
        print ("TDC ", i, " = +", value);
      ,
        print ("TDC ", i, " = ", value);
      );
      i++;
    );
}

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
  dyy () =

  local(yang, yin);

  yang=d10-1;
  yin=d10-1;
  if ((yang==0) && (yin==0),
    print ("yang=", yang, ", yin=", yin, ", Critical Failure");
    return;,);
  if (yang==yin,
    print ("yang=", yang, ", yin=", yin, ", Balance");
    return;,);
  if (yang>yin,
    print ("yang=", yang, ", yin=", yin, ", Yang Dominant, difference=", yang-yin);
    return;,);
  print ("yang=", yang, ", yin=", yin, ", Yin Dominant, difference=", yin-yang);
  return;
}

{
dxnr (x, n) =

  local (rmatrix, i, rmatrixsize, thesample, found);

  if (x < 1,
    print ("Error: random size must be >= 1");
    return;
  ,);
  if (n < 1,
    print ("Error: number of samples must be >= 1");
    return;
  ,);
  if (n > x,
    print ("Error: number of samples must be <= random size");
    return;
  ,);

  \\ Initialize rmatrix.

  rmatrix = matrix (1, n);
  for (i = 1, i <= n, rmatrix[1,i] = -1;);
  rmatrixsize = 0;

  \\ Loop until the rmatrix is filled.

  while (rmatrixsize < n,

    \\ Determine the sample.

    thesample = dx(x);

    \\ Check if we already have found the sample.

    found = 0;
    i = 1;
    while (i <= rmatrixsize,
      if (thesample == rmatrix[1,i],
        found = 1;
        break;
      ,);
      i++;
    );

    \\ If we have not found the sample, add it into the matrix.

    if (found == 0,
      rmatrixsize = rmatrixsize + 1;
      rmatrix[1,rmatrixsize] = thesample;
    ,);
  );

  \\ Return the matrix.

  return (rmatrix);
}



