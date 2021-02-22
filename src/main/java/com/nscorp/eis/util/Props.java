package com.nscorp.eis.util;

import java.util.StringTokenizer;
import java.util.Enumeration;
import java.io.InputStream;
import java.io.FileInputStream;
import java.io.File;
import java.io.IOException;
import java.io.FileNotFoundException;
import java.util.Properties;

public class Props extends Properties
{
    String app;
    private String root;
    private String new_root;
    private String Caller;
    private Properties settings;
    private Properties sysProp;
    
    public Props(final String caller) throws FileNotFoundException, IOException {
        this.app = null;
        this.new_root = null;
        try {
            System.out.println("Props initialized by: " + caller + " with no app");
            this.Caller = caller;
            this.init_Props();
        }
        catch (FileNotFoundException fnf) {
            System.out.println(fnf);
            throw fnf;
        }
        catch (IOException e) {
            System.out.println(e);
            throw e;
        }
    }
    
    public Props(final String app, final String caller) throws FileNotFoundException, IOException {
        this.app = app;
        this.Caller = caller;
        this.new_root = null;
        try {
            System.out.println("Props initialized by: " + caller + ", app=" + this.app);
            this.init_Props();
        }
        catch (FileNotFoundException fnf) {
            System.out.println(fnf);
            throw fnf;
        }
        catch (IOException e) {
            System.out.println(e);
            throw e;
        }
    }
    
    public Props(final String props_file, final String app, final String caller) throws FileNotFoundException, IOException {
        this.app = app;
        this.Caller = caller;
        this.new_root = props_file;
        try {
            System.out.println("Props initialized by: " + caller + ", app=" + app + " using " + props_file);
            this.init_Props();
        }
        catch (FileNotFoundException fnf) {
            System.out.println(fnf);
            throw fnf;
        }
        catch (IOException e) {
            System.out.println(e);
            throw e;
        }
    }
    
    public Props() throws FileNotFoundException, IOException {
        this.app = null;
        this.Caller = null;
        this.new_root = null;
        System.out.println("Props initialized (without caller or app)");
        this.init_Props();
    }
    
    public void init_Props() throws FileNotFoundException, IOException {
        final String save_Caller = this.Caller;
        final String save_app = this.app;
        this.sysProp = new Properties();
        this.settings = new Properties();
        this.root = this.sysProp.getProperty("CONFIG_PATH");
        if (this.root != null) {
            this.root += File.separatorChar;
            System.out.println("Properties file: " + this.root + "global.props");
            try {
                this.fill_settings(this.root + "global.props");
            }
            catch (FileNotFoundException fnf) {
                if (this.new_root == null) {
                    throw fnf;
                }
                System.out.println("no properties file at " + this.root + "global.props");
            }
        }
        if (this.new_root != null) {
            System.out.println("Properties file: " + this.new_root);
            try {
                this.fill_settings(this.new_root);
            }
            catch (FileNotFoundException fnf) {
                if (this.root == null) {
                    throw fnf;
                }
                System.out.println("no properties file at " + this.new_root);
            }
        }
        if (save_app != null) {
            this.app = save_app;
        }
        if (save_Caller != null) {
            this.Caller = save_Caller;
        }
    }
    
    private void fill_settings(final String filename) throws FileNotFoundException, IOException {
        System.out.println("    Walking through " + filename);
        try {
            FileInputStream sf = new FileInputStream(filename);
            this.settings.load(sf);
            sf.close();
            sf = null;
        }
        catch (FileNotFoundException fnf) {
            System.out.println("FileNotFound: '" + filename + "'");
            throw fnf;
        }
        if (this.app != null) {
            final Enumeration<?> enumer = this.settings.propertyNames();
            while (enumer.hasMoreElements()) {
                final String key = (String)enumer.nextElement();
                if (this.app.equals(key)) {
                    final String fname = this.settings.getProperty(key);
                    this.app = null;
                    this.fill_settings(fname);
                    break;
                }
            }
        }
        if (this.Caller != null) {
            final Enumeration<?> enumer = this.settings.propertyNames();
            while (enumer.hasMoreElements()) {
                final String key = (String)enumer.nextElement();
                if (this.Caller.equals(key)) {
                    final String fname = this.settings.getProperty(key);
                    this.Caller = null;
                    this.fill_settings(fname);
                    break;
                }
            }
        }
    }
    
    @Override
    public String getProperty(final String attr) {
        String rval;
        if ((rval = this.settings.getProperty(attr)) == null && (rval = this.sysProp.getProperty(attr)) == null) {
            return null;
        }
        String org = rval;
        String curr = rval;
        String result = "";
        int idx;
        while ((idx = org.indexOf("$")) != -1) {
            result += org.substring(0, idx);
            String tmp = org.substring(idx + 1);
            StringTokenizer st = new StringTokenizer(tmp, "/\\$ \t", true);
            final String nrval = st.nextToken();
            if ((tmp = this.settings.getProperty(nrval)) == null) {
                if ((tmp = this.sysProp.getProperty(attr)) == null) {
                    return null;
                }
            }
            else {
                if (tmp.indexOf("$") != -1 && (tmp = this.sysProp.getProperty(attr)) == null) {
                    return null;
                }
                result += tmp;
                if ((idx = org.indexOf(nrval)) != -1) {
                    if (idx + nrval.length() < org.length()) {
                        curr = org;
                        org = curr.substring(idx + nrval.length());
                        curr = null;
                    }
                    else {
                        org = "";
                    }
                }
            }
            st = null;
        }
        if (result.length() > 0) {
            rval = result;
        }
        return rval;
    }
}
