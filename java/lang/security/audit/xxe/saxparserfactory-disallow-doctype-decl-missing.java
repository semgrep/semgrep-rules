package example;

import javax.xml.parsers.SAXParserFactory;
import javax.xml.parsers.SAXParser;
import javax.xml.parsers.ParserConfigurationException;


class GoodSAXParserFactory {
    public void GoodSAXParserFactory() throws  ParserConfigurationException {
        SAXParserFactory spf = SAXParserFactory.newInstance();
        spf.setFeature("http://apache.org/xml/features/disallow-doctype-decl", true);
        //ok:saxparserfactory-disallow-doctype-decl-missing
        spf.newSAXParser();
    }

    public void GoodSAXParserFactory2() throws  ParserConfigurationException {
        SAXParserFactory spf = SAXParserFactory.newInstance();
        spf.setFeature("http://xml.org/sax/features/external-parameter-entities", false);
        spf.setFeature("http://xml.org/sax/features/external-general-entities", false);
        //ok:saxparserfactory-disallow-doctype-decl-missing
        spf.newSAXParser();
    }

    public void GoodSAXParserFactory3() throws  ParserConfigurationException {
        SAXParserFactory spf = SAXParserFactory.newInstance();
        spf.setFeature("http://xml.org/sax/features/external-general-entities", false);
        spf.setFeature("http://xml.org/sax/features/external-parameter-entities", false);
        //ok:saxparserfactory-disallow-doctype-decl-missing
        spf.newSAXParser();
    }

    public void GoodSAXParserFactory4() throws  ParserConfigurationException {
        SAXParserFactory factory = XmlUtils.getSecureSAXParserFactory();
        //Deep semgrep could find issues like this
        //ok:saxparserfactory-disallow-doctype-decl-missing
        saxparser = factory.newSAXParser();
    }
}

class BadSAXParserFactory{
    public void BadSAXParserFactory() throws  ParserConfigurationException {
        SAXParserFactory spf = SAXParserFactory.newInstance();
        //ruleid:saxparserfactory-disallow-doctype-decl-missing
        spf.newSAXParser();
    }

    public void BadSAXParserFactory2() throws  ParserConfigurationException {
        SAXParserFactory spf = SAXParserFactory.newInstance();
        spf.setFeature("somethingElse", true);
        //ruleid:saxparserfactory-disallow-doctype-decl-missing
        spf.newSAXParser();
    }
}

class GoodSAXParserFactoryStatic {

    private static SAXParserFactory spf = SAXParserFactory.newInstance();

    static {
        spf.setFeature("http://apache.org/xml/features/disallow-doctype-decl", true);
        //ok:saxparserfactory-disallow-doctype-decl-missing
        spf.newSAXParser();
    }

}

class BadSAXParserFactoryStatic {

    private static SAXParserFactory spf = SAXParserFactory.newInstance();

    static {
        spf.setFeature("not-a-secure-feature", true);
    }

    public void doSomething(){
        //ruleid:saxparserfactory-disallow-doctype-decl-missing
        spf.newSAXParser();
    }

}

class OneMoreGoodSAXParserFactory {

    public void GoodSAXParserFactory(boolean condition) throws  ParserConfigurationException {
        SAXParserFactory spf = null;
        
        if ( condition ) {
            spf = SAXParserFactor.newInstance();
        } else {
            spf = newFactory();
        }
        spf.setFeature("http://apache.org/xml/features/disallow-doctype-decl", true);
        //ok:saxparserfactory-disallow-doctype-decl-missing
        spf.newSAXParser();
    }

    private SAXParserFactory newFactory(){
        return SAXParserFactory.newInstance();
    }

}

class OneMoreBadSAXParserFactory {

    public void GoodSAXParserFactory(boolean condition) throws  ParserConfigurationException {
        SAXParserFactory spf = null;
        
        if ( condition ) {
            spf = SAXParserFactory.newInstance();
        } else {
            spf = newFactory();
        }
        //ruleid:saxparserfactory-disallow-doctype-decl-missing
        spf.newSAXParser();
    }

    private SAXParserFactory newFactory(){
        return SAXParserFactory.newInstance();
    }


}


class GoodSAXParserFactoryCtr {

    private final SAXParserFactory spf;

    public GoodSAXParserFactoryCtr() throws Exception {
        spf = SAXParserFactory.newInstance();
        spf.setFeature("http://apache.org/xml/features/disallow-doctype-decl", true);
        //ok:saxparserfactory-disallow-doctype-decl-missing
        spf.newSAXParser();
    }
}


class GoodSAXParserFactoryCtr2 {
    public void somemethod() throws Exception {
        SAXParserFactory spf = SAXParserFactory.newInstance();
        setFeatures(spf);
        //ok:saxparserfactory-disallow-doctype-decl-missing
        spf.newSAXParser();
    }

    private void setFeatures(SAXParserFactory spf) throws Exception {
        spf.setFeature("http://apache.org/xml/features/disallow-doctype-decl", true);
    }

}

class GoodSAXParserFactoryCtr3 {
    public void somemethod() throws Exception {
        SAXParserFactory spf = SAXParserFactory.newInstance();
        setFeatures(spf);
        //ok:saxparserfactory-disallow-doctype-decl-missing
        spf.newSAXParser();
    }

    private void setFeatures(SAXParserFactory spf) throws Exception {
        spf.setFeature("http://xml.org/sax/features/external-general-entities", false);
        spf.setFeature("http://xml.org/sax/features/external-parameter-entities", false);
    }

}
