package ca.persistence;

import java.sql.Date;
import java.sql.Time;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import ca.objects.Section;
import ca.objects.Term;

public class TermModel {

	
	public static ArrayList<Term> getAllTermsSorted()
	{
		String query = "SELECT * FROM Terms ORDER BY startDate;";
		return createTerms(query);
	}
	
	private static ArrayList<Term> createTerms(String query)
	{
		ArrayList<Term> terms = new ArrayList<Term>();
		List<Map<String, Object>> resultList = DB.getData(query);
		Iterator<Map<String, Object>> iter = resultList.iterator();
		
		while(iter.hasNext()) {
			Map<String, Object> row = iter.next();
			
			Term term = new Term(row);

			terms.add(term);
		}
		
		return terms;
	}

}
