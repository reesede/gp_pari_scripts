
/************************************************************************/
/* File:		cisco_markov.gp					*/
/* Created:		December 9, 2003				*/
/* Modified:		December 9, 2003				*/
/* Compatibility:	Verified on GP-Pari 2.0.18			*/
/************************************************************************/
/* Description:								*/
/* This file contains routines for solving Cisco availability Markov	*/
/* chains:								*/
/*									*/
/*  CiscoASAvail (N, mttf, mttr_sa, mttr_nsa, cov_a, cov_s, failover)	*/
/*	Calculates availability using an N+1 active-standby redundancy	*/
/*	scheme.								*/
/*									*/
/*  CiscoASProbs (N, mttf, mttr_sa, mttr_nsa, cov_a, cov_s, failover)	*/
/*	Calculate the state probabilities using an N+1 active-standby	*/
/*	redundancy Markov chain model.					*/
/*									*/
/*  CiscoLSAvail (N, mttf, mttr_sa, mttr_nsa, cov, failover)		*/
/*	Calculates availability using an N+1 load-sharing redundancy	*/
/*	scheme.								*/
/*									*/
/*  CiscoLSProbs (N, mttf, mttr_sa, mttr_nsa, cov_a, cov_s, failover)	*/
/*	Calculate the state probabilities using an N+1 load-sharing	*/
/*	redundancy Markov chain model.					*/
/*									*/
/************************************************************************/
/* History:								*/
/* 09DEC2003	D.E. Reese		Creation.			*/
/************************************************************************/


/************************************************************************/
/*			CiscoASProbs ()					*/
/*									*/
/* Description:	Calculate state probabilities using Cisco's Active-	*/
/*		Standby	Markov chain.					*/
/*									*/
/* Input:	N		- number of active units (N+1 total	*/
/*				  units).				*/
/*		mttf		- MTTF of each individual unit.		*/
/*		mttr_sa		- MTTR of service-affecting failures.	*/
/*		mttr_nsa	- MTTR of non-service-affecting		*/
/*				  failures.				*/
/*		cov_a		- Coverage of active units.		*/
/*		cov_s		- Coverage of standby units.		*/
/*		failover	- failover rate.			*/
/* Outputs:	None.							*/
/* Returns:	An 8-element vector containing the state probabilities	*/
/*		(all 0 if an error occurs).				*/
/* Effects:	None.							*/
/* Pari Calls:	*/
/* Local Calls:	None.							*/
/* Externals:	None.							*/
/************************************************************************/
/* History:								*/
/* 09DEC2003	D.E.Reese		Creation.			*/
/************************************************************************/

{
  CiscoASProbs (N, mttf, mttr_sa, mttr_nsa, cov_a, cov_s, failover)	=

    local (probs, A, B, C, D, E, tmat, tvec);

    probs = vector(8);

/* Verify the parameters.						*/

    if (N < 1, return (probs);,);
    if (mttf <= 0.0, return (probs);,);
    if (mttr_sa <= 0.0, return (probs);,);
    if (mttr_nsa <= 0.0, return (probs);,);
    if ((cov_a < 0.0) || (cov_a > 1.0), return (probs);,);
    if ((cov_s < 0.0) || (cov_s > 1.0), return (probs);,);
    if (failover < 0.0, return (probs);,);

/* Set the local variables.						*/

    A = N * 1.0 / mttf * (1 - cov_a);
    B = N * 1.0 / mttf * cov_a;
    C = N * 1.0 / mttf;
    D = 1.0 / mttf * cov_s;
    E = 1.0 / mttf * (1 - cov_s);

/* There are two cases:  1) when the failover is non-zero;  and 2) when	*/
/* failover is zero.							*/

    if (failover != 0.0,
      tmat = matrix(8,8);
      tmat[1,1] = -B;
      tmat[1,2] = 1.0 / failover;
      tmat[2,2] = -1.0 / failover;
      tmat[2,3] = C + 1.0 / mttr_nsa;
      tmat[3,1] = -D;
      tmat[3,4] = C + 1.0 / mttr_nsa;
      tmat[4,3] = -C;
      tmat[4,4] = -C;
      tmat[4,5] = 1.0 / mttr_sa;
      tmat[5,1] = -A;
      tmat[5,6] = 1.0 / mttr_sa;
      tmat[6,1] = -E;
      tmat[6,7] = C;
      tmat[7,7] = -C;
      tmat[7,8] = 1.0 / mttr_sa;
      tmat[8,1] = tmat[8,2] = tmat[8,3] = tmat[8,4] = 1;
      tmat[8,5] = tmat[8,6] = tmat[8,7] = tmat[8,8] = 1;
      tvec = matrix(8,1);
      tvec[8,1] = 1;
      tvec = tmat^-1 * tvec;
      probs[1] = tvec[1,1];
      probs[2] = tvec[2,1];
      probs[3] = tvec[3,1];
      probs[4] = tvec[4,1];
      probs[5] = tvec[5,1];
      probs[6] = tvec[6,1];
      probs[7] = tvec[7,1];
      probs[8] = tvec[8,1];
    ,
      tmat = matrix(7,7);
      tmat[1,1] = -B;
      tmat[1,2] = C + 1.0 / mttr_nsa;
      tmat[2,1] = -D;
      tmat[2,3] = C + 1.0 / mttr_nsa;
      tmat[3,2] = -C;
      tmat[3,3] = -C;
      tmat[3,4] = 1.0 / mttr_sa;
      tmat[4,1] = -A;
      tmat[4,5] = 1.0 / mttr_sa;
      tmat[5,1] = -E; 
      tmat[5,6] = C;
      tmat[6,6] = -C;
      tmat[6,7] = 1.0 / mttr_sa;
      tmat[7,1] = tmat[7,2] = tmat[7,3] = tmat[7,4] = 1;
      tmat[7,5] = tmat[7,6] = tmat[7,7] = 1;
      tvec = matrix(7,1);
      tvec[7,1] = 1;
      tvec = tmat^-1 * tvec;
      probs[1] = tvec[1,1];
      probs[2] = 0.0;
      probs[3] = tvec[2,1];
      probs[4] = tvec[3,1];
      probs[5] = tvec[4,1];
      probs[6] = tvec[5,1];
      probs[7] = tvec[6,1];
      probs[8] = tvec[7,1];
    );

    return (probs);
}

/************************************************************************/
/*			CiscoASAvail ()					*/
/*									*/
/* Description:	Calculate availability using Cisco's Active-Standby	*/
/*		Markov chain.						*/
/*									*/
/* Input:	N		- number of active units (N+1 total	*/
/*				  units).				*/
/*		mttf		- MTTF of each individual unit.		*/
/*		mttr_sa		- MTTR of service-affecting failures.	*/
/*		mttr_nsa	- MTTR of non-service-affecting		*/
/*				  failures.				*/
/*		cov_a		- Coverage of active units.		*/
/*		cov_s		- Coverage of standby units.		*/
/*		failover	- failover rate.			*/
/* Outputs:	None.							*/
/* Returns:	result or -1 if an error occurs.			*/
/* Effects:	None.							*/
/* Pari Calls:	*/
/* Local Calls:	CiscoASprob()						*/
/* Externals:	None.							*/
/************************************************************************/
/* History:								*/
/* 09DEC2003	D.E.Reese		Creation.			*/
/************************************************************************/

{
  CiscoASAvail (N, mttf, mttr_sa, mttr_nsa, cov_a, cov_s, failover)	=

    local (tsum, probs, avail);

    probs = CiscoASProbs(N, mttf, mttr_sa, mttr_nsa, cov_a, cov_s, failover);
    
    tsum = 0.0;
    for (i = 1, 8, tsum += probs[i];);
    if (tsum == 0.0, return (-1);,);
    avail = probs[1];
    avail += (N - 1) / N * probs[2];
    avail += probs[3];
    avail += probs[4];
    avail += (N - 1) / N * probs[5];
    avail += (N - 1) / N * probs[6];
    avail += probs[7];
    avail += (N - 1) / N * probs[8];
    return (avail);
}

/************************************************************************/
/*			CiscoLSProbs ()					*/
/*									*/
/* Description:	Calculate state probabilities using Cisco's Active-	*/
/*		Standby	Markov chain.					*/
/*									*/
/* Input:	N		- min number of active units (N+1 total	*/
/*				  units).				*/
/*		mttf		- MTTF of each individual unit.		*/
/*		mttr_sa		- MTTR of service-affecting failures.	*/
/*		mttr_nsa	- MTTR of non-service-affecting		*/
/*				  failures.				*/
/*		cov_a		- Coverage of active units.		*/
/*		cov_s		- Coverage of standby units.		*/
/*		failover	- failover rate.			*/
/* Outputs:	None.							*/
/* Returns:	An 8-element vector containing the state probabilities	*/
/*		(all 0 if an error occurs).				*/
/* Effects:	None.							*/
/* Pari Calls:	*/
/* Local Calls:	None.							*/
/* Externals:	None.							*/
/************************************************************************/
/* History:								*/
/* 09DEC2003	D.E.Reese		Creation.			*/
/************************************************************************/

{
  CiscoLSProbs (N, mttf, mttr_sa, mttr_nsa, c, failover)	=

    local (probs, A, B, C, tmat, tvec);

/* Initialize the return vector.					*/

    probs = vector(5);

/* Check for errors in the input parameters.				*/

    if (N < 1, return (probs);,);
    if ((mttf <= 0.0), return (probs);,);
    if ((mttr_sa <= 0.0), return (probs);,);
    if ((mttr_nsa <= 0.0), return (probs);,);
    if ((c < 0.0) || (c > 1.0), return (probs);,);
    if (failover < 0.0, return (probs);,);

/* Calculate the local variables and probabilities.		*/

    A = (N + 1) * 1.0 / mttf * (1 - c);
    B = (N + 1) * 1.0 / mttf * c;
    C = N * 1.0 / mttf * (1 - c);

/* Determine the probabilities.  There are two cases:  1) when	*/
/* the failover rate is non-zero;  and 2) when the failover rate*/
/* is zero.							*/

    if (failover != 0.0,
      tmat = matrix(5,5);
      tmat[1,1] = -B;
      tmat[1,2] = 1.0 / failover;
      tmat[2,2] = -1.0 / failover;
      tmat[2,3] = C + 1.0 / mttr_nsa;
      tmat[3,3] = C;
      tmat[3,4] = 1.0 / mttr_sa;
      tmat[4,1] = -A;
      tmat[4,5] = 1.0 / mttr_sa;
      tmat[5,1] = tmat[5,2] = tmat[5,3] = tmat[5,4] = tmat[5,5] = 1;
      tvec = matrix(5,1);
      tvec[5,1] = 1;
      tvec = tmat^-1 * tvec;
      probs[1] = tvec[1,1];
      probs[2] = tvec[2,1];
      probs[3] = tvec[3,1];
      probs[4] = tvec[4,1];
      probs[5] = tvec[5,1];
    ,
      tmat = matrix(4,4);
      tmat[1,1] = -B;
      tmat[1,2] = C + 1.0 / mttr_nsa;
      tmat[2,2] = -C;
      tmat[2,3] = 1.0 / mttr_sa;
      tmat[3,1] = -A;
      tmat[3,4] = 1.0 / mttr_sa;
      tmat[4,1] = tmat[4,2] = tmat[4,3] = tmat[4,4] = 1;
      tvec = matrix(4,1);
      tvec[4,1] = 1;
      tvec = tmat^-1 * tvec;
      probs[1] = tvec[1,1];
      probs[2] = 0;
      probs[3] = tvec[2,1];
      probs[4] = tvec[3,1];
      probs[5] = tvec[4,1];
    );

    return (probs);
}

/************************************************************************/
/*			CiscoLSAvail ()					*/
/*									*/
/* Description:	Calculate availability using Cisco's Load-Sharing	*/
/*		Markov chain.						*/
/*									*/
/* Input:	N		- min number of active units (N+1 total	*/
/*				  units).				*/
/*		mttf		- MTTF of each individual unit.		*/
/*		mttr_sa		- MTTR of service-affecting failures.	*/
/*		mttr_nsa	- MTTR of non-service-affecting		*/
/*				  failures.				*/
/*		cov_a		- Coverage of active units.		*/
/*		cov_s		- Coverage of standby units.		*/
/*		failover	- failover rate.			*/
/* Outputs:	None.							*/
/* Returns:	result or -1 if an error occurs.			*/
/* Effects:	None.							*/
/* Pari Calls:	*/
/* Local Calls:	CiscoASprob()						*/
/* Externals:	None.							*/
/************************************************************************/
/* History:								*/
/* 09DEC2003	D.E.Reese		Creation.			*/
/************************************************************************/

{
  CiscoLSAvail (N, mttf, mttr_sa, mttr_nsa, c, failover)	=

    local (tsum, probs, avail);

    probs = CiscoLSProbs(N, mttf, mttr_sa, mttr_nsa, c, failover);
    
    tsum = 0.0;
    for (i = 1, 5, tsum += probs[i];);
    if (tsum == 0.0, return (-1);,);
    avail = probs[1];
    avail += N / (N +1) * probs[2];
    avail += probs[3];
    avail += (N - 1) / N * probs[4];
    avail += N / (N + 1) * probs[5];
    return (avail);
}


