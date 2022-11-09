package example;

import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.ParserConfigurationException;


class GoodDocumentBuilderFactory {
    public void GoodDocumentBuilderFactory() throws  ParserConfigurationException {
        DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
        dbf.setFeature("http://apache.org/xml/features/disallow-doctype-decl", true);
        //ok:documentbuilderfactory-disallow-doctype-decl-missing
        dbf.newDocumentBuilder();
    }

    public void GoodDocumentBuilderFactory2() throws  ParserConfigurationException {
        DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
        dbf.setFeature("http://xml.org/sax/features/external-parameter-entities", false);
        dbf.setFeature("http://xml.org/sax/features/external-general-entities", false);
        //ok:documentbuilderfactory-disallow-doctype-decl-missing
        dbf.newDocumentBuilder();
    }

    public void GoodDocumentBuilderFactory3() throws  ParserConfigurationException {
        DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
        dbf.setFeature("http://xml.org/sax/features/external-general-entities", false);
        dbf.setFeature("http://xml.org/sax/features/external-parameter-entities", false);
        //ok:documentbuilderfactory-disallow-doctype-decl-missing
        dbf.newDocumentBuilder();
    }
}

class BadDocumentBuilderFactory{
    public void BadDocumentBuilderFactory() throws  ParserConfigurationException {
        DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
        //ruleid:documentbuilderfactory-disallow-doctype-decl-missing
        dbf.newDocumentBuilder();
    }

    public void BadDocumentBuilderFactory2() throws  ParserConfigurationException {
        DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
        dbf.setFeature("somethingElse", true);
        //ruleid:documentbuilderfactory-disallow-doctype-decl-missing
        dbf.newDocumentBuilder();
    }
}

class GoodDocumentBuilderFactoryStatic {

    private static DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();

    static {
        dbf.setFeature("http://apache.org/xml/features/disallow-doctype-decl", true);
        //ok:documentbuilderfactory-disallow-doctype-decl-missing
        dbf.newDocumentBuilder();
    }

}

class BadDocumentBuilderFactoryStatic {

    private static DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();

    static {
        dbf.setFeature("not-a-secure-feature", true);
    }

    public void doSomething(){
        //ruleid:documentbuilderfactory-disallow-doctype-decl-missing
        dbf.newDocumentBuilder();
    }

}

class OneMoreGoodDocumentBuilderFactory {

    public void GoodDocumentBuilderFactory(boolean condition) throws  ParserConfigurationException {
        DocumentBuilderFactory dbf = null;
        
        if ( condition ) {
            dbf = DocumentBuilderFactor.newInstance();
        } else {
            dbf = newFactory();
        }
        dbf.setFeature("http://apache.org/xml/features/disallow-doctype-decl", true);
        //ok:documentbuilderfactory-disallow-doctype-decl-missing
        dbf.newDocumentBuilder();
    }

    private DocumentBuilderFactory newFactory(){
        return DocumentBuilderFactory.newInstance();
    }

}

class OneMoreBadDocumentBuilderFactory {

    public void GoodDocumentBuilderFactory(boolean condition) throws  ParserConfigurationException {
        DocumentBuilderFactory dbf = null;
        
        if ( condition ) {
            dbf = DocumentBuilderFactory.newInstance();
        } else {
            dbf = newFactory();
        }
        //ruleid:documentbuilderfactory-disallow-doctype-decl-missing
        dbf.newDocumentBuilder();
    }

    private DocumentBuilderFactory newFactory(){
        return DocumentBuilderFactory.newInstance();
    }


}
