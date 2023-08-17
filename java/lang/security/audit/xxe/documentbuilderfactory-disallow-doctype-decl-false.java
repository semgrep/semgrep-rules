package example;

import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.ParserConfigurationException;


class GoodDocumentBuilderFactory {
    public void GoodXMLInputFactory() throws  ParserConfigurationException {
        DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
        //ok:documentbuilderfactory-disallow-doctype-decl-false
        dbf.setFeature("http://apache.org/xml/features/disallow-doctype-decl", true);
    }

    public void GoodXMLInputFactory2() throws  ParserConfigurationException {
        DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
        //ok:documentbuilderfactory-disallow-doctype-decl-false
        dbf.setFeature("http://apache.org/xml/features/disallow-doctype-decl", true);
        dbf.setFeature("http://xml.org/sax/features/external-general-entities", false);
        dbf.setFeature("http://xml.org/sax/features/external-parameter-entities", false);
    }

    public void GoodXMLInputFactory3() throws  ParserConfigurationException {
        DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
        //ok:documentbuilderfactory-disallow-doctype-decl-false
        dbf.setFeature("http://apache.org/xml/features/disallow-doctype-decl", true);
        dbf.setFeature("http://xml.org/sax/features/external-parameter-entities", false);
        dbf.setFeature("http://xml.org/sax/features/external-general-entities", false);
    }

    public void GoodXMLInputFactory4() throws  ParserConfigurationException {
        DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
        //ok:documentbuilderfactory-disallow-doctype-decl-false
        dbf.setFeature("http://apache.org/xml/features/disallow-doctype-decl", true);
        dbf.setAttribute(XMLConstants.ACCESS_EXTERNAL_SCHEMA, "");
        dbf.setAttribute(XMLConstants.ACCESS_EXTERNAL_DTD, "");
    }

    public void GoodXMLInputFactory4() throws  ParserConfigurationException {
        DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
        //ok:documentbuilderfactory-disallow-doctype-decl-false
        dbf.setFeature("http://apache.org/xml/features/disallow-doctype-decl", true);
        dbf.setAttribute(XMLConstants.ACCESS_EXTERNAL_DTD, "");
        dbf.setAttribute(XMLConstants.ACCESS_EXTERNAL_SCHEMA, "");
    }

    public void GoodSAXParserFactory() throws  ParserConfigurationException {
        SAXParserFactory spf = SAXParserFactory.newInstance();
        //ok:documentbuilderfactory-disallow-doctype-decl-false
        spf.setFeature("http://apache.org/xml/features/disallow-doctype-decl", true);
    }

}

class BadDocumentBuilderFactory{
    public void BadXMLInputFactory() throws  ParserConfigurationException {
        DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
        //ruleid:documentbuilderfactory-disallow-doctype-decl-false
        dbf.setFeature("http://apache.org/xml/features/disallow-doctype-decl", false);
        //fix:documentbuilderfactory-disallow-doctype-decl-false
        //dbf.setFeature("http://apache.org/xml/features/disallow-doctype-decl", true);
    }
}

class BadSAXParserFactory{
    public void BadSAXParserFactory() throws  ParserConfigurationException {
        SAXParserFactory spf = SAXParserFactory.newInstance();
        //ruleid:documentbuilderfactory-disallow-doctype-decl-false
        spf.setFeature("http://apache.org/xml/features/disallow-doctype-decl", false);
        //fix:documentbuilderfactory-disallow-doctype-decl-false
        //spf.setFeature("http://apache.org/xml/features/disallow-doctype-decl", true);
    }
}
