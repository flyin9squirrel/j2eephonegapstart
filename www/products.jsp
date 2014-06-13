<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="ISO-8859-1"%>
<%@page import="ca.on.conestogac.*"%>
<%@page import="java.sql.*"%>
<%

try{
	//response.addHeader("Access-Control-Allow-Origin", "*");
	// Get client's origin
	String clientOrigin = request.getHeader("origin");

	//if the client origin is found in our list then give access
	//if you don't want to check for origin and want to allow access
	//to all incoming request then change the line to this
	//response.setHeader("Access-Control-Allow-Origin", "*");
	    response.setHeader("Access-Control-Allow-Origin", clientOrigin);
	    response.setHeader("Access-Control-Allow-Methods", "GET, POST, PUT, DELETE, OPTIONS");
	    response.setHeader("Access-Control-Allow-Headers", "Content-Type");
	    response.setHeader("Access-Control-Max-Age", "86400");

	
	
	Connection oConnection = OpenShiftDataSource.getConnection(getServletContext().getInitParameter("the.db"));
	Statement oStmt = oConnection.createStatement();
	String sSQL = "SELECT * FROM supplier_list";
	ResultSet oRs = oStmt.executeQuery(sSQL);
	out.println(ResultSetValue.toJsonString(oRs));
	
	
}
catch(Exception e)
{
	out.println(e.toString());
}


%>