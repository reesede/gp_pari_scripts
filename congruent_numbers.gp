
/************************************************************************/
/* File:		congruent_numbers.gp				*/
/* Created:		March 30, 2000					*/
/* Modified:		January 22, 2014				*/
/* Compatibility:	Verified on GP-Pari 2.0.20			*/
/************************************************************************/
/* Description:								*/
/*	This file contains GP PARI functions related to congruent	*/
/*	number (i.e., an integer which is the area of a right		*/
/*	triangle).							*/
/*									*/
/* This file contains the following functions:				*/
/*									*/
/*	iscongruent (n)							*/
/*		Determine if the integer n is a congrurent number.	*/
/*		Returns 1 if the number is congruent.  Returns 0 if	*/
/*		the number is not congruent or an error occurs.		*/
/*		For information on the mathematics behind the		*/
/*		algorithm, see Neil Koblitz:  "An Introduction to	*/
/*		Elliptic Curves and Modular Forms".  Springer GTM 97.	*/
/*	congruentfindsides (n)						*/
/*		Attempt to find the sides of a triangle for which n	*/
/*		is the area.  DANGER - this could take a long time for	*/
/*		some congruent numbers!!!				*/
/*									*/
/************************************************************************/
/* History:								*/
/* 29MAR2000	D.E. Reese		Creation.			*/
/* 31MAR2000	D.E. Reese		Completion of iscongruent ().	*/
/* 02APR2000	D.E. Reese		Optimized determination of the	*/
/*					square-free part of n.		*/
/* 04APR2000	D.E. Reese		Optimized iscongruent () by	*/
/*					performing both solution counts	*/
/*					in a single loop.		*/
/* 06APR2000	D.E. Reese		Optimized iscongruent () so	*/
/*					that there are only two nested	*/
/*					loops instead of three.		*/
/* 30AUG2000	D.E. Reese		Optimized by counting the number*/
/*					of solutions with even z and 	*/
/*					the number of solutions with 	*/
/*					odd z.				*/
/* 31JAN2003	D.E. Reese		Added congruentfindsides().	*/
/* 05FEB2003	D.E. Reese		Fixed bug in congruentfindsides	*/
/* 10MAR2003	D.E. Reese		Added pythtriangle ().		*/
/* 11MAR2003	D.E. Reese		Added minpythtriangle ().	*/
/*					Added allpythtriangle ().	*/
/*					Added allminpythtriangle ().	*/
/*					Added minpythtrianglesearch ().	*/
/* 14MAR2003	D.E. Reese		Added triangletoecpt ().	*/
/* 17MAR2003	D.E. Reese		Added ecpttotriangle ().	*/
/* 20MAR2003	D.E. Reese		Corrected bugs in 		*/
/*					ecpttotriangle ().		*/
/* 03APR2003	D.E. Reese		Optimized congruentfindsides().	*/
/* 26JUN2003	D.E. Reese		Added fibtotri ().		*/
/* 22JAN2014	D.E. Reese		Added minpythtrianglesearch3 ().*/
/************************************************************************/


/************************************************************************/
/*			iscongruent ()					*/
/*									*/
/* Description:	Determine if the input parameter, n, is a congruent	*/
/*		integer.  This function uses an algorithm developed	*/
/*		from Tunnell's Theorem.  Reference for this theorem	*/
/*		can be found in Neil Koblitz, "Introduction to		*/
/*		Elliptic Curves and Modular Forms", published by	*/
/*		Springer.						*/
/*									*/
/* Input:	n	- number to be tested for congruency.		*/
/* Outputs:	None.							*/
/* Returns:	0 - n is not congruent, or an error has occurred.	*/
/*		1 - n is congruent.					*/
/* Effects:	None.							*/
/* Pari Calls:	type (), issquarefree (), factor (), matsize (),	*/
/*		floor (), sqrt ()					*/
/* Local Calls:	None.							*/
/* Externals:	None.							*/
/************************************************************************/
/* History:								*/
/* 29MAR2000	D.E.Reese		Creation.			*/
/* 02APR2000	D.E. Reese		Optimized determination of the	*/
/*					square-free part of n.		*/
/* 04APR2000	D.E. Reese		Optimized iscongruent () by	*/
/*					performing both solution counts	*/
/*					in a single loop.		*/
/* 06APR2000	D.E. Reese		Optimized iscongruent () so	*/
/*					that there are only two nested	*/
/*					loops instead of three.		*/
/* 30AUG2000	D.E. Reese		Optimized by counting the number*/
/*					of solutions with even z and 	*/
/*					the number of solutions with 	*/
/*					odd z.				*/
/************************************************************************/

{
iscongruent (n) = 
  local (x, y, z, x_coef, y_coef, z_coef, i, tcount, temp_n, 
         odd_count, even_count, fmat, fmatdim);

/* Initialize the two counts.						*/

  odd_count = 0;
  even_count = 0;

/* Determine if n is an integer.  If it is not, return a 0.		*/

  if (type(n) != "t_INT", return (0),);

/* If n is congruent to 5 or 7 mod 8, then it always is congruent.	*/

  temp_n = n % 8;
  if ((temp_n == 5) || (temp_n == 7), return (1);,);

/* Find the square-free part of n.					*/

  if (issquarefree (n),
    temp_n = n;
  ,
    fmat = factor (n);
    fmatdim = matsize (fmat);
    temp_n = 1;
    for (i = 1, fmatdim[1],
      if ((fmat[i,2] % 2) != 0,
        temp_n *= fmat[i,1];
      ,);
    );
  );

/* The coefficients of the monomial terms are different if the 		*/
/* square-free part of the integer is even or odd.			*/

  if ((temp_n % 2) == 0,
    x_coef = 8;
    y_coef = 2;
    z_coef = 16;
  ,
    x_coef = 2;
    y_coef = 1;
    z_coef = 8;
  );

/* Initialize x, y, z for determining the solutions to the first	*/
/* equation.								*/

  x = 0;
  y = 0;
  z = 0;

/* Loop through all values of x, y, and z which produce possible	*/
/* solutions to the first equation.					*/

  while (((x_coef*x*x + y_coef*y*y + z_coef*z*z) <= temp_n),
    while (((x_coef*x*x + y_coef*y*y + z_coef*z*z) <= temp_n),

/* Determine values of z based on the values of x and y.		*/

      z = floor(sqrt((temp_n - (x_coef*x*x + y_coef*y*y))/z_coef));

/* Determine the number of solutions to the equation.  For each non-zero*/
/* x, y, z, the number of solutions must be multiplied by 2 to account 	*/
/* for the positive and negative integer values.			*/

      if ((x_coef*x*x + y_coef*y*y + z_coef*z*z) == temp_n,
         tcount = 1;
         if (x > 0, tcount *= 2;,);
         if (y > 0, tcount *= 2;,);
         if (z > 0, tcount *= 2;,);

/* If z is even, increment the even count.  If z is odd, increment the	*/
/* odd count.								*/

         if (z % 2 == 0,
           even_count += tcount;
         ,
           odd_count += tcount;
         );
      ,);

      z = 0;
      y++;
    );
    z = 0;
    y = 0;
    x++;
  );

/* Return 1 or 0 if the number is or is not congruent.			*/

  if (odd_count == even_count,
    return (1);
  ,
    return (0);
  );
}

/************************************************************************/
/*			congruentfindsides ()				*/
/*									*/
/* Description:	Determine the sides of a rational triangle for which	*/
/*		the input parameter n is the area.			*/
/*									*/
/* Input:	n	- area of the triangle.				*/
/*		start_i	- value of i at which to start.  i is a value	*/
/*			  by which each side of a triangle is multiplied*/
/*			  so that we can work in integers.  At the end	*/
/*			  of execution of the function when a triangle	*/
/*			  has been found, the area of the triangle with	*/
/*			  integer sides will be n*i^2.  When the 	*/
/*			  function returns a result, it divides the	*/
/*			  sides of the triangle by i.  By default, if	*/
/*			  start_i is not given, start_i = 1 is assumed.	*/
/*		stop_i -  Value of i at which to stop searching.  If a	*/
/*			  value of 0 is given for stop_i (which is	*/
/*			  assumed if no stop_i is given, then the	*/
/*			  function will loop until it finds a triangle	*/
/*			  with n as an area.  Note that the call to	*/
/*			  iscongruent will insure that this is not an	*/
/*			  infinite loop, but it could be very long.	*/
/*		flag -	  If flag == 0, no print out of iterations of	*/
/*			  i will be made.  if flag > 0, then print out	*/
/*			  every "flag" value of i (i.e., if flag == 10,	*/
/*			  print out when i == 10, i == 20, etc.).	*/
/* Outputs:	None.							*/
/* Returns:	row vector containing the three sides of the triangle.	*/
/*		If n is not congruent, returns [0,0,0].  If a stop_i	*/
/*		is given and that value is reached without finding a	*/
/*		triangle, return [-1, -1, -1].				*/
/* Effects:	None.							*/
/* Pari Calls:	*/
/* Local Calls:	iscongruent ()						*/
/* Externals:	None.							*/
/************************************************************************/
/* History:								*/
/* 31JAN2003	D.E. Reese		Creation.			*/
/* 05FEB2003	D.E. Reese		When the function drops out of	*/
/*					the main loop, due to reaching	*/
/*					i > stop_i, return a row vector	*/
/*					containing [-1,-1,-1] to 	*/
/*					indicate that no triangle has	*/
/*					yet been found.			*/
/* 03APR2003	D.E. Reese		Optimized.			*/
/************************************************************************/

{
  congruentfindsides (n, start_i = 1, stop_i = 0, flag = 0) =

    local (x, y, z, z_square, i);

/* Verify that n is a congruent number.  If not, return a vector 	*/
/* containing [0, 0, 0].						*/

    if (iscongruent (n) != 1,
      return ([0, 0, 0]);
    ,);

/* We start by multiplying all of our sides by 1, and will increment	*/
/* this multiplier until we find integers which fit the appropriate	*/
/* area.  NOTE:  this loop will keep going until triangle sides are	*/
/* found.  It is possible that this could be a VERY long time for	*/
/* some congruent numbers.						*/

    i = start_i;	/* Multiplier for triangle sides. */
    while ((stop_i <= 0) || (i <= stop_i),
      if (flag > 0,
        if ((i % flag) == 0,
           print ("i = ", i);
        ,);
      ,);
      x = 1;
      y = 2*n*i^2 / x;
      while (x <= y,
        if (((2*n*i^2) % x) == 0,
          z_square = x^2 + y^2;
          if (issquare (z_square) == 1,
            z = round (sqrt(z_square)) / i;
            y = y / i;
            x = x / i;
            return ([x, y, z]);
          ,
          );
        ,
        );
        x++;
        y = 2*n*i^2 / x;
      );
      i++;
    );
    return ([-1,-1,-1]);
}

/************************************************************************/
/*			pythtriangle ()					*/
/*									*/
/* Description:	Determines a Pythagorean triangle, given a value of	*/
/*		a and b.						*/
/*									*/
/*		Pythagorean triangles can be found with the following	*/
/*		sides, given two positive integers, a and b, with a>b	*/
/*		and a and b coprime:					*/
/*									*/
/*			x = a^2 - b^2					*/
/*			y = 2*a*b					*/
/*			z = a^2 + b^2					*/
/*									*/
/* Input:	a	- 1st value.					*/
/*		b	- 2nd value (must be < a, although not		*/
/*			  necessarily coprime).				*/
/* Outputs:	None.							*/
/* Returns:	A row vector containing [x, y, z, area], where x, y,	*/
/*		and z are the sides of the triangle, area is the area.	*/
/* Effects:	None.							*/
/* Pari Calls:	None.							*/
/* Local Calls:	None.							*/
/* Externals:	None.							*/
/************************************************************************/
/* History:								*/
/* 10MAR2003	D.E. Reese		Creation.			*/
/************************************************************************/


{
  pythtriangle (a, b) =

    local (x, y, z, area, amin, i);

/* Verify that a is a positive integer greater than 1.			*/

    if (a <= 1, return ([0, 0, 0, 0]);,);

/* Verify that a is greater than b 					*/

    if (a <= b, return ([0, 0, 0, 0]);,);

/* Determine x, y, and z.						*/

    x = a^2 - b^2;
    y = 2*a*b;
    z = a^2 + b^2;

/* Determine the area.							*/

    area = 1/2 * x * y;

/* Determine the minimum area.						*/

    if (x < y,
      return ([x, y, z, area]);
    ,
      return ([y, x, z, area]);
    );
}

/************************************************************************/
/*			minpythtriangle ()				*/
/*									*/
/* Description:	Determines a Pythagorean triangle, given a value of	*/
/*		a and b.						*/
/*									*/
/*		Pythagorean triangles can be found with the following	*/
/*		sides, given two positive integers, a and b, with a>b	*/
/*		and a and b coprime:					*/
/*									*/
/*			x = a^2 - b^2					*/
/*			y = 2*a*b					*/
/*			z = a^2 + b^2					*/
/*									*/
/*		In this case, the triangle returned is "minimum", in	*/
/*		the sense that the area is square-free.			*/
/*									*/
/* Input:	a	- 1st value.					*/
/*		b	- 2nd value (must be < a, although not		*/
/*			  necessarily coprime).				*/
/* Outputs:	None.							*/
/* Returns:	A row vector containing [x, y, z, area], where x, y,	*/
/*		and z are the sides of the triangle, area is the area.	*/
/* Effects:	None.							*/
/* Pari Calls:	factor (), matsize ().					*/
/* Local Calls:	pythtriangle ()						*/
/* Externals:	None.							*/
/************************************************************************/
/* History:								*/
/* 11MAR2003	D.E. Reese		Creation.			*/
/************************************************************************/


{
  minpythtriangle (a, b) =

    local (the_triangle, flist, i, j, thesize);

/* Verify that a is a positive integer greater than 1.			*/

    if (a <= 1, return ([0, 0, 0, 0]);,);

/* Verify that a is greater than b 					*/

    if (a <= b, return ([0, 0, 0, 0]);,);

    the_triangle = [0,0,0,0];

/* Determine the triangle based on a and b.				*/

    the_triangle = pythtriangle(a,b);

/* Factor the area of the triangle.					*/

    flist = factor(the_triangle[4]);
    thesize = matsize(flist)[1];

/* Divide out all of the squared factors from the triangle's sides.	*/

    for (i = 1, thesize,
      j = 2;
      while (j <= flist[i,2],
        the_triangle[1] = the_triangle[1] / flist[i,1];	
        the_triangle[2] = the_triangle[2] / flist[i,1];
        the_triangle[3] = the_triangle[3] / flist[i,1];
        the_triangle[4] = the_triangle[4] / (flist[i,1]^2);
        j += 2;
      );
    );

/* Return the minimized triangle.					*/

    return (the_triangle);
}

/************************************************************************/
/*			allpythtriangle ()				*/
/*									*/
/* Description:	Determines all Pythagorean triangle, given a value of	*/
/*		a.  The values of b are determined such that 1<=b<a.	*/
/*									*/
/* Input:	a	- 1st value.					*/
/* Outputs:	None.							*/
/* Returns:	None.							*/
/* Effects:	Prints out all the triangles that it finds.		*/
/* Pari Calls:	None.							*/
/* Local Calls:	pythtriangle ()						*/
/* Externals:	None.							*/
/************************************************************************/
/* History:								*/
/* 11MAR2003	D.E. Reese		Creation.			*/
/************************************************************************/

{
  allpythtriangle (a) = 

    local (b);

    if (a < 2, return;,);
    b = 1;
    while (b < a, 
      print (pythtriangle(a,b));
      b++;
    );
}

/************************************************************************/
/*			allminpythtriangle ()				*/
/*									*/
/* Description:	Determines all Pythagorean triangle, given a value of	*/
/*		a.  The values of b are determined such that 1<=b<a.	*/
/*		In this case, the triangles are minimized to a 		*/
/*		squarefree area.					*/
/*									*/
/* Input:	a	- 1st value.					*/
/* Outputs:	None.							*/
/* Returns:	None.							*/
/* Effects:	Prints out all the triangles that it finds.		*/
/* Pari Calls:	print ()						*/
/* Local Calls:	minpythtriangle ()					*/
/* Externals:	None.							*/
/************************************************************************/
/* History:								*/
/* 11MAR2003	D.E. Reese		Creation.			*/
/************************************************************************/

{
  allminpythtriangle (a) = 

    local (b);

    if (a < 2, return;,);
    b = 1;
    while (b < a, 
      print (minpythtriangle(a,b));
      b++;
    );
}

/************************************************************************/
/*			minpythtrianglesearch ()			*/
/*									*/
/* Description:	Determines all Pythagorean triangles with a in the	*/
/*		range start_a <= a <= stop_a.  These are printed to	*/
/*		a file named, "min_pyth_triangle.txt".			*/
/*									*/
/* Input:	start_a - value of a to start searching.		*/
/*		stop_a  - value of a to stop searching.			*/
/* Outputs:	None.							*/
/* Returns:	None.							*/
/* Effects:	Prints out all the triangles that it finds, both to the	*/
/*		console and to the file "min_pyth_triangle.txt".	*/
/* Pari Calls:	print (), write ()					*/
/* Local Calls:	minpythtriangle ()					*/
/* Externals:	None.							*/
/************************************************************************/
/* History:								*/
/* 11MAR2003	D.E. Reese		Creation.			*/
/************************************************************************/

{
  minpythtrianglesearch (start_a, stop_a) =

    local (i, a, b, the_triangle);

    the_triangle = [0, 0, 0, 0];

    for (a = start_a, stop_a,
      print ("a = ", a);
      write ("min_pyth_triangle.txt", "a = ", a);
      b = (a % 2) + 1;
      while (b < a,
        the_triangle = minpythtriangle (a,b);
        print ( the_triangle[4], "\t\t[",
		the_triangle[1], ", ",
		the_triangle[2], ", ",
		the_triangle[3], "]\t(a = ", a, ")");
        write ("min_pyth_triangle.txt", the_triangle[4], "\t\t[",
		the_triangle[1], ", ",
		the_triangle[2], ", ",
		the_triangle[3], "]\t(a = ", a, ")");
        b += 2;
      );
      print ("");
      write ("min_pyth_triangle.txt", "");
    );
}

/************************************************************************/
/*			minpythtrianglesearch1 ()			*/
/*									*/
/* Description:	Determines all Pythagorean triangles with a in the	*/
/*		range start_a <= a <= stop_a.  These are printed to	*/
/*		a file named, "min_pyth_triangle.txt".			*/
/*									*/
/*		This search tracks the area of the triangle and only	*/
/*		prints out a given area once.				*/
/*									*/
/* Input:	start_a - value of a to start searching.		*/
/*		stop_a  - value of a to stop searching.			*/
/* Outputs:	None.							*/
/* Returns:	None.							*/
/* Effects:	Prints out all the triangles that it finds, both to the	*/
/*		console and to the file "min_pyth_triangle.txt".	*/
/* Pari Calls:	print (), write ()					*/
/* Local Calls:	minpythtriangle ()					*/
/* Externals:	None.							*/
/************************************************************************/
/* History:								*/
/* 29AUG2003	D.E. Reese		Creation.			*/
/************************************************************************/

{
  minpythtrianglesearch1 (start_a, stop_a) =

    local (i, a, b, the_triangle, the_list);

    the_triangle = [0, 0, 0, 0];
    the_list = Set();

    for (a = start_a, stop_a,
/*      print ("a = ", a);*/
/*      write ("min_pyth_triangle.txt", "a = ", a); */
      b = (a % 2) + 1;
      while (b < a,
        the_triangle = minpythtriangle (a,b);
        if (setsearch(the_list, the_triangle[4]) == 0,
          the_list = setunion(the_list, [the_triangle[4]]);
          print ( the_triangle[4], "\t[",
		the_triangle[1], ", ",
		the_triangle[2], ", ",
		the_triangle[3], "]\t("a, ",", b, ")");
          write ("min_pyth_triangle.txt", the_triangle[4], "\t[",
		the_triangle[1], ", ",
		the_triangle[2], ", ",
		the_triangle[3], "]\t("a, ",", b, ")");
        ,;);
        b += 2;
      );
/*      print ("");*/
/*      write ("min_pyth_triangle.txt", "");*/
    );
}

/************************************************************************/
/*			minpythtrianglesearch2 ()			*/
/*									*/
/* Description:	Determines all Pythagorean triangles with a in the	*/
/*		range start_a <= a <= stop_a.  These are printed to	*/
/*		a file named, "min_pyth_triangle.txt".			*/
/*									*/
/*		This search will print out a given triangle only once.	*/
/*		Note that [3,4,5] is considered tobe the same triangle	*/
/*		as [4,3,5] for this purpose.  Also note that triangles	*/
/*		with different sides but the same area are considered	*/
/*		as different triangles (after being reduced to the	*/
/*		primitive right triangle).				*/
/*									*/
/* Input:	start_a - value of a to start searching.		*/
/*		stop_a  - value of a to stop searching.			*/
/*		test_assert - if set to 1, test the following assertion:*/
/*			a new primitive pythagorean triangle will be	*/
/*			found if and only if the following two premises	*/
/*			are true:					*/
/*									*/
/*			(a + b) mod 2 = 1 AND				*/
/*			b does not divide a				*/
/*									*/
/*			if the parameter is missing or any other value	*/
/*			except 1, then do not test the assertions.	*/
/*									*/
/* Outputs:	None.							*/
/* Returns:	None.							*/
/* Effects:	Prints out all the triangles that it finds, both to the	*/
/*		console and to the file "min_pyth_triangle.txt".	*/
/* Pari Calls:	print (), write ()					*/
/* Local Calls:	minpythtriangle ()					*/
/* Externals:	None.							*/
/************************************************************************/
/* History:								*/
/* 29AUG2003	D.E. Reese		Creation.			*/
/************************************************************************/

{
  minpythtrianglesearch2 (start_a, stop_a, test_assert = 0) =

    local (i, a, b, t1, the_triangle, the_list);

    the_triangle = [0, 0, 0, 0];
    the_list = Set();

    for (a = start_a, stop_a,
/*      print ("a = ", a);*/
/*      write ("min_pyth_triangle.txt", "a = ", a); */
      b = (a % 2) + 1;
      while (b < a,
        the_triangle = minpythtriangle (a,b);
        if (the_triangle[2] < the_triangle[1],
          t1 = the_triangle[2];
          the_triangle[2] = the_triangle[1];
          the_triangle[1] = t1;
        ,;);
        if (setsearch(the_list, the_triangle) == 0,
          the_list = setunion(the_list, [the_triangle]);
          print ( the_triangle[4], "\t[",
		the_triangle[1], ", ",
		the_triangle[2], ", ",
		the_triangle[3], "]\t("a, ",", b, ")");
          write ("min_pyth_triangle.txt", the_triangle[4], "\t[",
		the_triangle[1], ", ",
		the_triangle[2], ", ",
		the_triangle[3], "]\t("a, ",", b, ")");
          if (test_assert == 1,
            if ((((a+b) % 2) == 1) && (gcd(a, b) == 1),
            ;
            ,
              print ("Assertion was incorrect for (", a, ", ", b, ")");
              write ("min_pyth_triangle.txt",
			"Assertion was incorrect for (", a, ", ", b, ")");
            );
          ,;);
        ,
          if (test_assert == 1,
            if ((((a+b) % 2) == 1) && (gcd(a, b) == 1),
              print ("Assertion was incorrect for (", a, ", ", b, ")");
              write ("min_pyth_triangle.txt",
			"Assertion was incorrect for (", a, ", ", b, ")");
            ,;);
          ,;);
        );
        b += 2;
      );
/*      print ("");*/
/*      write ("min_pyth_triangle.txt", "");*/
    );
}

/************************************************************************/
/*			minpythtrianglesearch3 ()			*/
/*									*/
/* Description:	Determines all Pythagorean triangles with a in the	*/
/*		range start_a <= a <= stop_a.  These are printed to	*/
/*		a file named, "min_pyth_triangle.txt".			*/
/*									*/
/*		This search will print out a given triangle only once.	*/
/*		Note that [3,4,5] is considered to be the same triangle	*/
/*		as [4,3,5] for this purpose.  Also note that triangles	*/
/*		with different sides but the same area are considered	*/
/*		as different triangles (after being reduced to the	*/
/*		primitive right triangle).				*/
/*									*/
/* Input:	cn      - congruent number for which triangles are	*/
/*			  being searched.				*/
/*		start_a - value of a to start searching.		*/
/*		stop_a  - value of a to stop searching.			*/
/*									*/
/* Outputs:	Prints out (a, b) = [x, y, z, area] for each triangle.	*/
/* Returns:	None.							*/
/* Effects:	Prints out all the triangles that it finds.		*/
/* Pari Calls:	print (), issquarefree (), listcreate (), listput ()	*/
/* Local Calls:	minpythtriangle ()					*/
/* Externals:	None.							*/
/************************************************************************/
/* History:								*/
/* 22JAN2014	D.E. Reese		Creation.			*/
/************************************************************************/

{
  minpythtrianglesearch3 (cn, start_a, stop_a) =

  local (the_tri, the_list, count, a, b, i, found);

  if (issquarefree(cn) == 0,
    print ("Error: cn is not square-free");
    return;
  ,);

  if (start_a > stop_a,
    print ("Error: start_a > stop_a");
    return;
  ,);

  the_list = listcreate(100000);
  count = 0;
  a = start_a;
  while (a <= stop_a,
    if ((a % 1000) == 0, print ("          Processing a = ", a);,);
    for (b = 1, a-1,
      the_tri=minpythtriangle(a,b);
      found=0;
      if (the_tri[4] == cn,
        for(i=1,count,
          if (the_list[i] == the_tri,
            found=1;
            break;
          ,);
        );
        if (found==0,
          print ("(", a, ",", b, ") = ", the_tri);
          listput(the_list,the_tri);
          count++;
          if (count > 100000,
            print ("List of 100000 triangles is full...aborting.");
            return;
          ,);
        ,);
      ,);
    );
    a++;
  );
  
}

/************************************************************************/
/*			triangletoecpt ()				*/
/*									*/
/* Description:	Determine the elliptic curve (y^2 = x^3 - n^2*x) and	*/
/*		the point on that curve for a given triangle X, Y, Z.	*/
/*									*/
/* Input:	X	- leg of the triangle.				*/
/*		Y	- other leg of the triangle.			*/
/*		Z	- hypotenuse of the triangle.			*/
/* Outputs:	None.							*/
/* Returns:	Returns a vector [[0, 0, 0, -(n^2), 0], [x, y]], where	*/
/*		the first component is itself a vector containing the	*/
/*		coefficients of the elliptic curve associated with the	*/
/*		area of the triangle.  The second component, itself a	*/
/*		two element vector, contains the x and y coordinates	*/
/*		of the point on the elliptic curve which correspond	*/
/*		to the triangle.					*/
/* Effects:	None.							*/
/* Pari Calls:	issquare (), denominator ()				*/
/* Local Calls:	iscongruent ()						*/
/* Externals:	None.							*/
/************************************************************************/
/* History:								*/
/* 14MAR2003	D.E. Reese		Creation.			*/
/************************************************************************/

{
  triangletoecpt (X, Y, Z) = 

    local (Z_sq, n, result);

/* Insure that the triangle is rational and pythagorean.	*/

    Z_sq = X^2 + Y^2;
    if (!issquare (Z_sq), return ([[0,0,0,0,0],[0,0]]);,);
    if (Z^2 != Z_sq, return ([[0,0,0,0,0],[0,0]]);,);

/* Determine the area of the triangle, insuring that it is a	*/
/* congruent number.  Note that we look for the smallest	*/
/* congruent integer value of a rational n.			*/

    n = 1/2*X*Y;
    n = n * denominator(n);
    if (!iscongruent(n), return ([[0,0,0,0,0],[0,0]]);,);

/* Calculate the coefficients of the elliptic curve and the	*/
/* point on the curve corresponding to the triangle.		*/

    result = [[0,0,0,-(n^2),0],[-n*Y/(X+Z), 2*n^2/(X+Z)]];
    return (result);
}

/************************************************************************/
/*			ecpttotriangle ()				*/
/*									*/
/* Description:	Determine the triangle corresponding to a point on an	*/
/*		elliptic curve.						*/
/*									*/
/* Input:	the_ec	- results of ellinit ().  Note that the 	*/
/*			  coefficients of the elliptic curve must have	*/
/*			  a matrix [0, 0, 0, -(n^2), 0] where n is a	*/
/*			  congruent number.				*/
/*		the_pt	- point on the curve, in the form [x, y].	*/
/* Outputs:	None.							*/
/* Returns:	Returns a vector [X, Y, Z] where X, Y, and Z are the	*/
/*		sides of the triangle.  Returns [0, 0, 0] if:  1) the	*/
/*		elliptic curve is not of the correct form;  2) n is not	*/
/*		a congruent number;  3)  the_pt is not on the_ec;  	*/
/*		4) the point does not correspond to a rational		*/
/*		pythagorean triangle.					*/
/* Effects:	None.							*/
/* Pari Calls:	*/
/* Local Calls:	iscongruent ()						*/
/* Externals:	None.							*/
/************************************************************************/
/* History:								*/
/* 17MAR2003	D.E. Reese		Creation.			*/
/* 20MAR2003	D.E. Reese		Corrected bugs.			*/
/************************************************************************/

{
  ecpttotriangle (the_ec, the_pt) = 

    local (n, x, the_result, dom_x, num_x);

    the_result = [0, 0, 0];

/* Verify that the_ec is a vector of at least 13 elements, and that the	*/
/* first 5 elements have the form [0,0,0,-(n^2), 0].			*/

    if (type(the_ec) != "t_VEC", return (the_result);,);
    if (length(the_ec) < 13, return (the_result);,);
    if (the_ec[1] != 0, return (the_result);,);
    if (the_ec[2] != 0, return (the_result);,);
    if (the_ec[3] != 0, return (the_result);,);
    n = the_ec[4] * -1;
    if (issquare(n) == 0, return (the_result);,);
    n = sqrtint(numerator(n)) / sqrtint(denominator(n));

/* Verify that x and y are non-zero.					*/

    if (the_pt[1] == 0, return (the_result);,);
    if (the_pt[2] == 0, return (the_result);,);

/* Verify that the_pt is a point and is on the elliptic curve.		*/

    if (type(the_pt) != "t_VEC", return (the_result);,);
    if (length(the_pt) != 2, return (the_result);,);
    if (ellisoncurve (the_ec, the_pt) == 0, return (the_result);,);

/* All cross-checks have completed if this point is reached.  Determine	*/
/* the values of X, Y, and Z.						*/

    the_result[1] = - the_pt[2] / the_pt[1];
    the_result[2] = -2*n*the_pt[1] / the_pt[2];
    the_result[3] = the_result[1]^2 + the_result[2]^2;
    if (issquare(the_result[3]) == 0, 
      the_result[1] = 0;
      the_result[2] = 0;
      the_result[3] = 0;
      return (the_result);
   ,);
    the_result[3] = sqrtint(numerator(the_result[3])) /
			sqrtint(denominator(the_result[3]));

/* If any of the sides are less than 0, make them positive.		*/

    if (the_result[1] < 0, the_result[1] *= -1;,); 
    if (the_result[2] < 0, the_result[2] *= -1;,); 
    if (the_result[3] < 0, the_result[3] *= -1;,); 

/* Return the result.							*/

    return (the_result);

}

/************************************************************************/
/*				fibtotri ()				*/
/*									*/
/* Description:	Given a positive integer n, find the pythagorean	*/
/*		triangle associated with the Fibonacci numbers, F_n,	*/
/*		F_n+1, F_n+2, and F_n+3.  The triangle is found by:	*/
/*									*/
/*		w = F_n, x = F_n+1, y = F_n+2, z = F_n+3		*/
/*									*/
/*		[w*z, 2*x*y, y*z - w*x]					*/
/*									*/
/* Input:	n - number of first Fibonacci number.			*/
/* Outputs:	None.							*/
/* Returns:	Returns a vector [X, Y, Z] where X, Y, and Z are the	*/
/*		sides of the triangle.  Returns [0, 0, 0] if n is not	*/
/*		valid.							*/
/* Effects:	None.							*/
/* Pari Calls:	fibonacci ()						*/
/* Local Calls:	None.							*/
/* Externals:	None.							*/
/************************************************************************/
/* History:								*/
/* 26JUN2003	D.E. Reese		Creation.			*/
/************************************************************************/

{
  fibtotri(n) =

    local (w, x, y, z, temp_array);

    temp_array = [0, 0, 0];
    if (type(n) != "t_INT", return (temp_array);,);
    if (n < 1, return (temp_array);,);
    w = fibonacci(n);
    x = fibonacci(n+1);
    y = fibonacci(n+2);
    z = fibonacci(n+3);
    temp_array = [w*z, 2*x*y, y*z-w*x];
    return (temp_array);
}

{
  findtri(n,pt)=return(ecpttotriangle(ellinit([0,0,0,-(n^2),0]),pt));
}

{
  findxyztri(n,x,y,z)=return(ecpttotriangle(ellinit([0,0,0,-(n^2),0]),[x/z, y/z]));
}

{
  congruent_info(n)=return([iscongruent(n), squarefree(n), isprime (n)]);
}

