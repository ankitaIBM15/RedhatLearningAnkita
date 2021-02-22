package com.nscorp.eis.util;

import java.io.Writer;
import java.io.PrintWriter;
import javax.servlet.http.HttpServletResponse;
import java.io.CharArrayWriter;
import javax.servlet.http.HttpServletResponseWrapper;

public class XSLTFilter$CharResponseWrapper extends HttpServletResponseWrapper
{
    private CharArrayWriter output;
    
    public String toString() {
        return this.output.toString();
    }
    
    public XSLTFilter$CharResponseWrapper(XSLTFilter xsltFilter, final HttpServletResponse response) {
        super(response);
        this.output = new CharArrayWriter();
    }
    
    public PrintWriter getWriter() {
        return new PrintWriter(this.output);
    }
}