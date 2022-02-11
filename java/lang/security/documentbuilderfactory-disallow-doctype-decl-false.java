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
