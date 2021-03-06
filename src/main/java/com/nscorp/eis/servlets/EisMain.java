/*
 * Created on Jun 16, 2005
 *
 * TODO To change the template for this generated file go to
 * Window - Preferences - Java - Code Style - Code Templates
 */
package com.nscorp.eis.servlets;

import java.io.PrintWriter;
import java.io.IOException;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.ServletException;
import javax.servlet.ServletConfig;
import com.nscorp.eis.util.Props;
import javax.servlet.http.HttpServlet;

public class EisMain extends HttpServlet
{
    private Props props;
    
    public void init(final ServletConfig config) throws ServletException {
        try {
            this.props = new Props(config.getServletContext().getRealPath("WEB-INF/global.props"), "EisMain.java", "EisMain");
        }
        catch (Exception e) {
            System.out.println("EXCEPTION AT EisMain::init() \n" + e);
        }
    }
    
    public void doPost(final HttpServletRequest request, final HttpServletResponse response) throws IOException, ServletException {
        this.doGet(request, response);
    }
    
    public void doGet(final HttpServletRequest request, final HttpServletResponse response) throws IOException, ServletException {

        response.setContentType("text/xml");
        final PrintWriter out = response.getWriter();
        final String http = request.getRequestURL().substring(0, request.getRequestURL().length() - request.getContextPath().length() - request.getServletPath().length());
        final String dir = request.getContextPath();
        String env = System.getProperty("system.type"); // To fetch the correct environment type
        if (env != null) {
            env = env.toLowerCase();
        }
        System.out.println("Env :" + env + "|");
        String URL;
        String IEORURL;
        String TONURL;
        String FUELURL;
        String POWERURL;
        String WLURL;
        String TMSURL;
        if ("test".equalsIgnoreCase(env)) {

            URL = this.props.getProperty("TESTURL");
            IEORURL = this.props.getProperty("TESTIEORURL");
            TONURL = this.props.getProperty("TESTTONURL");
            FUELURL = this.props.getProperty("FUELURL");
            POWERURL = this.props.getProperty("POWERURL");
            WLURL = this.props.getProperty("TESTWLURL");
            TMSURL = this.props.getProperty("TESTTMSURL");
        }
        else if ("qa".equalsIgnoreCase(env)) {
            URL = this.props.getProperty("QAURL");
            IEORURL = this.props.getProperty("TESTIEORURL");
            TONURL = this.props.getProperty("TESTTONURL");
            FUELURL = this.props.getProperty("FUELURL");
            POWERURL = this.props.getProperty("POWERURL");
            WLURL = this.props.getProperty("QAWLURL");
            TMSURL = this.props.getProperty("QATMSURL");
        }
        else {
            URL = this.props.getProperty("PRODURL");
            IEORURL = this.props.getProperty("PRODIEORURL");
            TONURL = this.props.getProperty("PRODTONURL");
            FUELURL = this.props.getProperty("FUELURL");
            POWERURL = this.props.getProperty("POWERURL");
            WLURL = this.props.getProperty("PRODWLURL");
            TMSURL = this.props.getProperty("PRODTMSURL");
        }
        System.out.println("URL : " + URL);
        System.out.println("IEORURL : " + IEORURL);
        System.out.println("TONURL : " + TONURL);
        System.out.println("FUELURL : " + FUELURL);
        System.out.println("POWERURL : " + POWERURL);
        System.out.println("WLURL : " + WLURL);
        System.out.println("TMSURL : " + TMSURL);
        out.println("<?xml version='1.0'?>\n<?xml-stylesheet type='text/xsl' href='" + http + dir + "/EisMain.xsl'?>\n" + "<Report>\n");
        out.println("<env>" + env + "</env>\n");
        out.println("<url>" + URL + "</url>\n");
        out.println("<ieorurl>" + IEORURL + "</ieorurl>\n");
        out.println("<tonurl>" + TONURL + "</tonurl>\n");
        out.println("<fuelurl><![CDATA[" + FUELURL + "]]></fuelurl>\n");
        out.println("<powerurl><![CDATA[" + POWERURL + "]]></powerurl>\n");
        out.println("<wlurl>" + WLURL + "</wlurl>\n");
        out.println("<tmsurl>" + TMSURL + "</tmsurl>\n");
        out.println("</Report>\n");
    }
}