package example;

import javax.xml.transform.TransformerFactory;

class TransformerFactory {
    public void GoodTransformerFactory() {
        TransformerFactory factory = TransformerFactory.newInstance();
        //ok:transformerfactory-dtds-not-disabled
        factory.setAttribute(XMLConstants.ACCESS_EXTERNAL_DTD, "");
        factory.setAttribute(XMLConstants.ACCESS_EXTERNAL_STYLESHEET, "");
        factory.newTransformer(new StreamSource(xyz));
    }

    public void GoodTransformerFactory2() {
        TransformerFactory factory = TransformerFactory.newInstance();
        //ok:transformerfactory-dtds-not-disabled
        factory.setAttribute(XMLConstants.ACCESS_EXTERNAL_STYLESHEET, "");
        factory.setAttribute(XMLConstants.ACCESS_EXTERNAL_DTD, "");
        factory.newTransformer(new StreamSource(xyz));
    }

    public void GoodTransformerFactory3() {
        TransformerFactory factory = TransformerFactory.newInstance();
        //ok:transformerfactory-dtds-not-disabled
        factory.setAttribute("http://javax.xml.XMLConstants/property/accessExternalStylesheet", "");
        factory.setAttribute("http://javax.xml.XMLConstants/property/accessExternalDTD", "");
        factory.newTransformer(new StreamSource(xyz));
    }

    public void GoodTransformerFactory4() {
        TransformerFactory factory = TransformerFactory.newInstance();
        //ok:transformerfactory-dtds-not-disabled
        factory.setAttribute("http://javax.xml.XMLConstants/property/accessExternalDTD", "");
        factory.setAttribute("http://javax.xml.XMLConstants/property/accessExternalStylesheet", "");
        factory.newTransformer(new StreamSource(xyz));
    }

    public void BadTransformerFactory() {
        TransformerFactory factory = TransformerFactory.newInstance();
        factory.setAttribute(XMLConstants.ACCESS_EXTERNAL_DTD, "");
        //ruleid:transformerfactory-dtds-not-disabled
        factory.newTransformer(new StreamSource(xyz));
    }

    public void BadTransformerFactory2() {
        TransformerFactory factory = TransformerFactory.newInstance();
        factory.setAttribute("http://javax.xml.XMLConstants/property/accessExternalDTD", "");
        //ruleid:transformerfactory-dtds-not-disabled
        factory.newTransformer(new StreamSource(xyz));
    }

}
