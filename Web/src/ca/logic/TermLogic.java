package ca.logic;

import java.sql.Date;
import java.util.ArrayList;

import ca.objects.Term;
import ca.persistence.TermModel;

public class TermLogic {

	// Gets term that is active during the "currDate" given
	public static Term getTerm(Date currDate)
	{
		boolean currTermFound = false;
		Term currTerm = null;
		ArrayList<Term> allTerms = TermModel.getAllTermsSorted();
		
		// Traverse all terms to see which one falls under the current date
		for(int i = 0; i < allTerms.size() && !currTermFound; i++)
		{
			if( currDate.after(allTerms.get(i).getStartDate()) ) {
				if( i+1 >= allTerms.size() || currDate.before(allTerms.get(i+1).getStartDate()) ) {	
					currTermFound = true;
					currTerm = allTerms.get(i);
				}
			}
		}
		
		return currTerm;
	}

}
