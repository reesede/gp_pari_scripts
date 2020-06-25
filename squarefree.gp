
/************************************************************************/
/* File:		squarefree.gp					*/
/* Created:		April 7, 2003					*/
/* Modified:		April 7, 2003					*/
/* Compatibility:	Verified on GP-Pari 2.1.1			*/
/************************************************************************/
/* Description:								*/
/*	This file contains GP PARI functions related to squarefree	*/
/* numbers.								*/
/*									*/
/* This file contains the following functions:				*/
/*									*/
/*	squarefree (n)							*/
/*		Given an integer, returns the squarefree part.		*/
/*									*/
/************************************************************************/
/* History:								*/
/* 07APR2003	D.E. Reese		Creation.			*/
/************************************************************************/


/************************************************************************/
/*			squarefree ()					*/
/*									*/
/* Description:	Given an integer n, returns the square-free portion of	*/
/*		that integer.						*/
/*									*/
/* Input:	n	- number to be tested for congruency.		*/
/* Outputs:	None.							*/
/* Returns:	square-free portion of n.				*/
/* Effects:	None.							*/
/* Pari Calls:	factor (), issquarefree (), matsize ()			*/
/* Local Calls:	None.							*/
/* Externals:	None.							*/
/************************************************************************/
/* History:								*/
/* 07APR2003	D.E.Reese		Creation.			*/
/************************************************************************/


{
squarefree (n) = 
  local (fmat, fmatdim, i, temp);

  if (issquarefree (n), return (n);,);

  fmat = factor (n);

  fmatdim = matsize (fmat);

  temp = 1;
  for (i = 1, fmatdim[1],
    if ((fmat[i,2] % 2) == 1,
      temp *= fmat[i,1];
    ,);
  );

  return (temp);
}
