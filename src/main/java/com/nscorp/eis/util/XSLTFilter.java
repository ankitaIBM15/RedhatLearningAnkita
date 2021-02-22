package com.nscorp.eis.util;

import java.io.IOException;
import javax.xml.transform.Transformer;
import javax.xml.transform.Result;
import javax.xml.transform.Source;
import java.io.PrintWriter;
import javax.xml.transform.TransformerException;
import javax.xml.transform.TransformerConfigurationException;
import javax.xml.transform.TransformerFactory;
import java.io.Writer;
import javax.xml.transform.stream.StreamResult;
import java.io.Reader;
import javax.xml.transform.stream.StreamSource;
import java.io.StringReader;
import java.io.File;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.FilterChain;
import javax.servlet.ServletResponse;
import javax.servlet.ServletRequest;
import javax.servlet.ServletException;
import javax.servlet.FilterConfig;
import javax.servlet.Filter;

public class XSLTFilter implements Filter
{
    private FilterConfig filterConfig;
    
    public XSLTFilter() {
        this.filterConfig = null;
    }
    
    public void init(final FilterConfig config) throws ServletException {
        System.out.println("XSLT filter is initialized .....");
        this.filterConfig = config;
    }
    
    public void destroy() {
        this.filterConfig = null;
    }
    
    public void doFilter(final ServletRequest request, final ServletResponse response, final FilterChain chain) throws IOException, ServletException {
        final XSLTFilter$CharResponseWrapper wrapper = new XSLTFilter$CharResponseWrapper(this, (HttpServletResponse)response);
        final PrintWriter out = response.getWriter();
        chain.doFilter(request, (ServletResponse)wrapper);
        final float IEver = this.IEVersion((HttpServletRequest)request);
        String responseType = new String();
        try {
            responseType = request.getParameter("responseType");
        }
        catch (Exception ex) {}
        String CONTENT_TYPE = "text/html";
        boolean exportFlag = false;
        if (responseType != null && responseType.equalsIgnoreCase("Export")) {
            CONTENT_TYPE = "application/vnd.ms-excel";
            exportFlag = true;
        }
        if (IEver < 6.0 || exportFlag) {
            System.out.println("In the filter process: IE 5 , Netscape or application type Excel");
            boolean xformed = false;
            int end = wrapper.toString().indexOf(".xsl");
            if (end != -1) {
                end += 4;
                final String justPath = wrapper.toString().substring(0, end);
                final int start = justPath.lastIndexOf(File.separatorChar);
                final String fname = justPath.substring(start, justPath.length());
                final String stylepath = this.filterConfig.getServletContext().getRealPath(fname);
                System.out.println("Filter: filename for xsl: " + stylepath);
                try {
                    final File xsltFile = new File(stylepath);
                    final String resp = wrapper.toString().substring(wrapper.toString().lastIndexOf("?>") + 3, wrapper.toString().length());
                    final Source xmlSource = new StreamSource(new StringReader(resp));
                    final Source xsltSource = new StreamSource(xsltFile);
                    final Result result = new StreamResult(response.getWriter());
                    final TransformerFactory transFact = TransformerFactory.newInstance();
                    final Transformer trans = transFact.newTransformer(xsltSource);
                    response.setContentType(CONTENT_TYPE);
                    trans.transform(xmlSource, result);
                    out.flush();
                    xformed = true;
                    System.out.println("Filter: Transormation complete");
                }
                catch (TransformerConfigurationException tce) {
                    System.out.println("TransformerConfigurationException :" + tce);
                }
                catch (TransformerException te) {
                    System.out.println("TransformerException :" + te);
                }
                catch (Exception e) {
                    System.out.println("Error in xslt translation: " + e);
                }
                if (!xformed) {
                    System.out.println("Filter: transformation failed");
                    out.println(wrapper.toString());
                }
            }
            else {
                System.out.println("In the filter process: no .xsl or xslt failed\n " + wrapper.toString());
                out.println(wrapper.toString());
            }
        }
        else {
            System.out.println("In the filter process: IE 6 or better");
            out.println(wrapper.toString());
        }
    }
    
    private float IEVersion(final HttpServletRequest request) {
        final String uAgent = request.getHeader("User-Agent");
        float IEver = 0.0f;
        if (uAgent != null) {
            final int ppos = uAgent.indexOf("MSIE");
            if (ppos > 0) {
                final String vPos = uAgent.substring(ppos + 5, uAgent.indexOf(59, ppos));
                IEver = Float.parseFloat(vPos);
            }
        }
        return IEver;
    }
}