
/************************************************************************/
/* File:		squaresum.gp					*/
/* Created:		January 22, 2004				*/
/* Modified:		January 22, 2004				*/
/* Compatibility:	Verified on GP-Pari 2.1.1			*/
/************************************************************************/
/* Description:								*/
/*	Contains functions related to an integer as the sum of squares.	*/
/*									*/
/* This file contains the following functions:				*/
/*									*/
/*	is2squaresum (n)						*/
/*		Given an integer, returns the list of constituent square*/
/*		pairs.							*/
/*	square2sumlist (n)						*/
/*		Returns a list of the pairs of numbers such that n is	*/
/*		the sum of the squares of the two numbers.  Returns [0]	*/
/*		if such a list does not exist.				*/
/*									*/
/************************************************************************/
/* History:								*/
/* 22JAN2004	D.E. Reese		Creation.			*/
/************************************************************************/


/************************************************************************/
/*			is2squaresum ()					*/
/*									*/
/* Description:	Given an integer n, returns the square-free portion of	*/
/*		that integer.						*/
/*									*/
/* Input:	n	- number to be tested.				*/
/* Outputs:	None.							*/
/* Returns:	0 if the number is not the sum of two squares.		*/
/*		1 if the number is the sum of two squares.		*/
/* Effects:	None.							*/
/* Pari Calls:	factor (), matsize ()					*/
/* Local Calls:	None.							*/
/* Externals:	None.							*/
/************************************************************************/
/* History:								*/
/* 22JAN2004	D.E.Reese		Creation.			*/
/************************************************************************/


{
is2squaresum (n) = 
  local (fmat, fmatdim, i, temp);

  fmat = factor (n);

  fmatdim = matsize (fmat);

  for (i = 1, fmatdim[1],
    if (((fmat[i,1] + 1) % 4) == 0,
      if ((fmat[i,2] % 2) != 0, return (0);,);
    ,);
  );

  return (1);
}

/************************************************************************/
/*			square2sumlist ()				*/
/*									*/
/* Description:	Returns a list of the pairs of numbers such that n is	*/
/*		the sum of the squares of the two numbers.  Returns [0]	*/
/*		if such a list does not exist.				*/
/*		that integer.						*/
/*									*/
/* Input:	n	- number to be tested.				*/
/* Outputs:	None.							*/
/* Returns:	[] if the number is not the sum of two squares.		*/
/*		A list containing elements of the form [x, y], such that*/
/*		n = x^2 + y^2.						*/
/* Effects:	None.							*/
/* Pari Calls:	factor ()*/
/* Local Calls:	is2squaresum ()						*/
/* Externals:	None.							*/
/************************************************************************/
/* History:								*/
/* 22JAN2004	D.E.Reese		Creation.			*/
/************************************************************************/

{
square2sumlist (n) =

  local (i, temp);

  temp = [];

  if (is2squaresum(n) == 0, return (temp);,);

  i = 0;
  while (i <= n,
/* print("testing ", i, "   ", n-i^2); */
    if (issquare (n - i^2) == 1,
      if (i <= round(sqrt(n-i^2)),
        temp = concat (temp, [[i, round (sqrt(n-i^2))]]);
      ,
        break;
      );
    );
    i++;
  );

  return (temp);
}
