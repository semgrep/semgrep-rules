// cf. https://github.com/oracle/helidon/blob/ab4e308effaa2fe2170a1c312882b2315e66a9af/integrations/cdi/jpa-cdi/src/main/java/io/helidon/integrations/cdi/jpa/JpaExtension.java#L618

package example;

import javax.xml.stream.XMLInputFactory;
import static javax.xml.stream.XMLInputFactory.IS_SUPPORTING_EXTERNAL_ENTITIES;

class GoodXMLInputFactory {
    public void blah() {
        final XMLInputFactory xmlInputFactory = XMLInputFactory.newFactory();

        // See
        // https://github.com/OWASP/CheatSheetSeries/blob/master/cheatsheets/XML_External_Entity_Prevention_Cheat_Sheet.md#xmlinputfactory-a-stax-parser
        xmlInputFactory.setProperty(XMLInputFactory.SUPPORT_DTD, false);
        // ok
        xmlInputFactory.setProperty("javax.xml.stream.isSupportingExternalEntities", false);
    }
}

class GoodConstXMLInputFactory {
    public GoodConstXMLInputFactory() {
        final XMLInputFactory xmlInputFactory = XMLInputFactory.newFactory();

        // See
        // https://github.com/OWASP/CheatSheetSeries/blob/master/cheatsheets/XML_External_Entity_Prevention_Cheat_Sheet.md#xmlinputfactory-a-stax-parser
        xmlInputFactory.setProperty(XMLInputFactory.SUPPORT_DTD, false);
        // ok
        xmlInputFactory.setProperty(IS_SUPPORTING_EXTERNAL_ENTITIES, false);
    }
}

class GoodConstXMLInputFactory1 {
    public GoodConstXMLInputFactory1() {
        final XMLInputFactory xmlInputFactory = XMLInputFactory.newFactory();

        // See
        // https://github.com/OWASP/CheatSheetSeries/blob/master/cheatsheets/XML_External_Entity_Prevention_Cheat_Sheet.md#xmlinputfactory-a-stax-parser
        xmlInputFactory.setProperty(XMLInputFactory.SUPPORT_DTD, Boolean.FALSE);
        // ok
        xmlInputFactory.setProperty(IS_SUPPORTING_EXTERNAL_ENTITIES, false);
    }
}

class BadXMLInputFactory1 {
    public BadXMLInputFactory1() {
        // ruleid:xmlinputfactory-possible-xxe
        final XMLInputFactory xmlInputFactory = XMLInputFactory.newFactory();
        xmlInputFactory.setProperty("javax.xml.stream.isSupportingExternalEntities", true);
    }
}

class BadXMLInputFactory2 {
    public BadXMLInputFactory2() {
        // ruleid:xmlinputfactory-possible-xxe
        final XMLInputFactory xmlInputFactory = XMLInputFactory.newFactory();
        xmlInputFactory.setProperty(IS_SUPPORTING_EXTERNAL_ENTITIES, true);
    }
}

class MaybeBadXMLInputFactory {
    public void foobar() {
        // ruleid:xmlinputfactory-possible-xxe
        final XMLInputFactory xmlInputFactory = XMLInputFactory.newFactory();
    }
}
