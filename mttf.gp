
/* Calculate the MTTF from a given test time period and */
/* a given number of failures found.			*/
/*							*/
/* Arguments:						*/
/*	time		time period under test.		*/
/*	failures	number of failures found during	*/
/*			the time period.		*/
/*	confidence	confidence level at which to	*/
/*			accept the MTTF.		*/

{
time2mttf (time, failures, confidence) = 

  if (time <= 0.0, return (-1.0);,);
  if (failures < 0, return (-1.0);,);
  if ((confidence <= 0.0) || (confidence > 1.0), return (-1.0);,);
  if (confidence == 1.0, return (1e8000);,);
  return (2.0*time / chisquareQ(1.0-confidence, 2*failures + 2));
}



/* Calculate the test time required to verify the MTTF	*/
/* to a given confidence level and given number of	*/
/* failures.						*/
/*							*/
/* Arguments:						*/
/*	mttf		desired MTTF.			*/
/*	failures	number of failures found during	*/
/*			the time period.		*/
/*	confidence	confidence level at which to	*/
/*			accept the MTTF.		*/


{
mttf2time (mttf, failures, confidence) = 

  if (mttf <= 0.0, return (-1.0);,);
  if (failures < 0, return (-1.0);,);
  if ((confidence <= 0.0) || (confidence > 1.0), return (-1.0);,);
  if (confidence == 1.0, return (1e8000);,);
  return (mttf * chisquareQ(1.0-confidence, 2*failures + 2) / 2.0);
}

/* Calculate the number of tests to execute for a given	*/
/* reliability and confidence level.			*/
/*							*/
/* Arguments:						*/
/*	rel		desired reliability		*/
/*	failures	number of failures allowed.	*/
/*	confidence	confidence level at which to 	*/
/*			accept the reliability figure.	*/

{
rel2numtests (rel, failures, confidence) =

  if ((rel < 0.0) || (rel > 1.0), return (-1.0);,);
  if (failures < 0, return (-1.0);,);
  if ((confidence <= 0.0) || (confidence > 1.0), return (-1.0);,);
  return (-chisquareQ(1.0-confidence, 2*failures+2) / (2 * log (rel)));
}

/* Calculate the reliability to a given confidence	*/
/* level, given the number of tests and the number of	*/
/* failures.						*/
/*							*/
/* Arguments:						*/
/*	rel		desired reliability		*/
/*	failures	number of failures allowed.	*/
/*	confidence	confidence level at which to 	*/
/*			accept the reliability figure.	*/

{
numtests2rel (numtests, failures, confidence) =

  if (failures < 0, return (-1.0);,);
  if (numtests < 0, return (-1.0);,);
  if ((confidence <= 0.0) || (confidence >= 1.0), return (-1.0);,);
  return (exp (-chisquareQ(1.0-confidence, 2*failures + 2) / (2*numtests)));
}

/* Calculate the confidence level gained by running	*/
/* a given number of test cases with a given 		*/
/* reliability value.					*/
/*							*/
/* Arguments:						*/
/*	numtests	number of test cases run.	*/
/*	failures	number of failures detected.	*/
/*	rel		desired reliability		*/

{
numtests2conf (numtests, failures, rel) =

  local (low_conf, high_conf, error_limit, cur_conf, cur_rel);

  low_conf = 0.0;
  high_conf = 1.0;
  error_limit = 0.0000001;
 
  while ((high_conf - low_conf) > error_limit,
    cur_conf = (high_conf + low_conf) / 2.0;
    cur_rel = numtests2rel (numtests, failures, cur_conf);
/*    print ("cur_rel=", cur_rel, ",  cur_conf=", cur_conf);*/
    if (cur_rel > rel, low_conf = cur_conf;,);
    if (cur_rel < rel, high_conf = cur_conf;,);
    if (cur_rel == rel, return (cur_conf);,);
  );
  return (cur_conf);
}

/* Given a confidence interval, a test time, and the	*/
/* number of failures, calculate the lower bound and	*/
/* upper bound of the MTTF.				*/
/*							*/
/* Arguments:						*/
/*	time		time period under test.		*/
/*	failures	number of failures found during	*/
/*			the time period.		*/
/*	conf_int	confidence interval.  Note that	*/
/*			the upper limit and lower limit	*/
/*			of the MTTF will each be	*/
/*			calculated to 1/2 of the risk	*/
/*			(i.e., if 80% is given, the	*/
/*			lower bound will be to 90% and	*/
/*			the upper bound will be to 90%.	*/

{
time2mttfbounds (time, failures, conf_int) = 

  local	(bounds, conf, low_mttf, high_mttf);
  bounds = [-1,-1];
  if (time <= 0.0, return (bounds);,);
  if (failures < 0, return (bounds);,);
  if ((conf_int <= 0.0) || (conf_int > 1.0), return (bounds);,);
  if (conf_int == 1.0, return (bounds);,);
  low_mttf = 2 * time / chisquareQ((1.0 - conf_int)/2, 2 * failures + 2);
  if (failures > 0,
    high_mttf = 2 * time / chisquareQ((1.0 + conf_int)/2, 2 * failures);
  ,
    high_mttf = -1;
  );
  bounds = [low_mttf, high_mttf];
  return (bounds);
}

{

/* Given a number of tests the number of failures, and	*/
/* a confidence interval, calculate the lower bound and	*/
/* upper bound of the MTTF.				*/
/*							*/
/* Arguments:						*/
/*	numtests	Number of tests run.		*/
/*	failures	number of failures found during	*/
/*			the time period.		*/
/*	conf_int	confidence interval.  Note that	*/
/*			the upper limit and lower limit	*/
/*			of the MTTF will each be	*/
/*			calculated to 1/2 of the risk	*/
/*			(i.e., if 80% is given, the	*/
/*			lower bound will be to 90% and	*/
/*			the upper bound will be to 90%.	*/

numtests2relbounds (numtests, failures, conf_int) =

  local (bounds, conf, low_rel, high_rel);
  bounds = [0.0,1.0];
  if (numtests <= 0, return (bounds);,);
  if (failures < 0, return (bounds);,);
  if ((conf_int <= 0.0) || (conf_int > 1.0), return (bounds);,);
  if (conf_int == 1.0, return (bounds);,);
  low_rel = exp (-chisquareQ ((1.0-conf_int)/2, 2*failures+2)/(2*numtests));
  if (failures > 0,
    high_rel = exp (-chisquareQ ((1.0+conf_int)/2, 2*failures)/(2*numtests));
  ,
    high_rel = 1.0;
  );
  bounds = [low_rel, high_rel];
  return (bounds);
}

/* Given a time under test with a given number of	*/
/* observed failures, calculates the confidence level	*/
/* (based on the lower-bounds MTTF).			*/
/*							*/
/* Arguments:						*/
/*	time		time under test.		*/
/*	mttf		desired MTTF.			*/
/*	failures	number of failures found during	*/
/*			the time period.		*/

{
time2conf (time, mttf, failures) =

  local (low_conf, high_conf, error_limit, cur_conf, cur_mttf);

  low_conf = 0.0;
  high_conf = 1.0;
  error_limit = 0.0000001;
 
  while ((high_conf - low_conf) > error_limit,
    cur_conf = (high_conf + low_conf) / 2.0;
    cur_mttf = time2mttf (time, failures, cur_conf);
    if (cur_mttf > mttf, low_conf = cur_conf;,);
    if (cur_mttf < mttf, high_conf = cur_conf;,);
    if (cur_mttf == mttf, return (cur_conf);,);
  );
  return (cur_conf);
}
