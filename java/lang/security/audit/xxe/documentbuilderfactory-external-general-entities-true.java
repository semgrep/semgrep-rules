package example;

import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.ParserConfigurationException;


class GoodDocumentBuilderFactory {
    public void GoodXMLInputFactory() throws  ParserConfigurationException {
        DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
        //ok:documentbuilderfactory-external-general-entities-true
        dbf.setFeature("http://xml.org/sax/features/external-general-entities" , false);
    }
}

class BadDocumentBuilderFactory{
    public void BadXMLInputFactory() throws  ParserConfigurationException {
        DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
        //ruleid:documentbuilderfactory-external-general-entities-true
        dbf.setFeature("http://xml.org/sax/features/external-general-entities" , true);
    }
}

class GoodSAXParserFactory {
    public void GoodSAXParserFactory() throws  ParserConfigurationException {
        SAXParserFactory spf = SAXParserFactory.newInstance();
        //ok:documentbuilderfactory-external-general-entities-true
        spf.setFeature("http://xml.org/sax/features/external-general-entities" , false);
    }
}

class BadSAXParserFactory{
    public void BadSAXParserFactory() throws  ParserConfigurationException {
        SAXParserFactory spf = SAXParserFactory.newInstance();
        //ruleid:documentbuilderfactory-external-general-entities-true
        spf.setFeature("http://xml.org/sax/features/external-general-entities" , true);
    }
}
