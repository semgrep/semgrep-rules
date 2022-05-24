package example;

import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.ParserConfigurationException;


class GoodDocumentBuilderFactory {
    public void GoodDocumentBuilderFactory() throws  ParserConfigurationException {
        //ok:documentbuilderfactory-disallow-doctype-decl-missing
        DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
        dbf.setFeature("http://apache.org/xml/features/disallow-doctype-decl", true);
    }

    public void GoodDocumentBuilderFactory2() throws  ParserConfigurationException {
        //ok:documentbuilderfactory-disallow-doctype-decl-missing
        DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
        dbf.setFeature("http://xml.org/sax/features/external-parameter-entities", false);
        dbf.setFeature("http://xml.org/sax/features/external-general-entities", false);
    }

    public void GoodDocumentBuilderFactory3() throws  ParserConfigurationException {
        //ok:documentbuilderfactory-disallow-doctype-decl-missing
        DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
        dbf.setFeature("http://xml.org/sax/features/external-general-entities", false);
        dbf.setFeature("http://xml.org/sax/features/external-parameter-entities", false);
    }
}

class BadDocumentBuilderFactory{
    public void BadDocumentBuilderFactory() throws  ParserConfigurationException {
        //ruleid:documentbuilderfactory-disallow-doctype-decl-missing
        DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
dbf.setFeature("http://apache.org/xml/features/disallow-doctype-decl", true);;
    }

    public void BadDocumentBuilderFactory2() throws  ParserConfigurationException {
        //ruleid:documentbuilderfactory-disallow-doctype-decl-missing
        DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
dbf.setFeature("http://apache.org/xml/features/disallow-doctype-decl", true);;
        dbf.setFeature("somethingElse", true);
    }
}
