package ca.objects;

import java.sql.Date;
import java.util.Map;

public class Term {

	private String termID;
	private Date startDate;
	
	public Term(String termID, Date startDate) {
		this.termID = termID;
		this.startDate = startDate;
	}
	
	public Term(Map<String, Object> attrMap) {
		termID = (String) attrMap.get("termID");
		startDate = (Date) attrMap.get("startDate");
	}

	public String getTermID() {
		return termID;
	}

	public Date getStartDate() {
		return startDate;
	}
}
