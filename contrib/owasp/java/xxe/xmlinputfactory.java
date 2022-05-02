package org.joychou.controller;

import org.dom4j.DocumentHelper;
import org.dom4j.io.SAXReader;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;

import org.w3c.dom.Document;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.helpers.XMLReaderFactory;
import org.xml.sax.XMLReader;

import java.io.*;

import org.xml.sax.InputSource;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.SAXParserFactory;
import javax.xml.parsers.SAXParser;

import org.xml.sax.helpers.DefaultHandler;
import org.apache.commons.digester3.Digester;
import org.jdom2.input.SAXBuilder;
import org.joychou.util.WebUtils;

/**
 * Java xxe vuln and security code.
 *
 * @author JoyChou @2017-12-22
 */

@RestController
@RequestMapping("/xxe")
public class XXE {

    private static Logger logger = LoggerFactory.getLogger(XXE.class);
    private static String EXCEPT = "xxe except";

    @PostMapping("/XMLInputFactory/vuln")
    public String XMLInputFactoryVuln(HttpServletRequest request) {
        try {
            String body = WebUtils.getRequestBody(request);
            logger.info(body);
            // ruleid:owasp.java.xxe.javax.xml.stream.XMLInputFactory
            XMLInputFactory xmlInputFactory = XMLInputFactory.newInstance();
            XMLStreamReader reader = xmlInputFactory.createXMLStreamReader(new StringReader(body));
            reader.nextTag();

        } catch (Exception e) {
            logger.error(e.toString());
            return EXCEPT;
        }

        return "XMLInputFactory xxe vuln code";
    }

    @PostMapping("/XMLInputFactory/fix1")
    public String XMLInputFactoryFix1(HttpServletRequest request) {
        try {
            String body = WebUtils.getRequestBody(request);
            logger.info(body);
            // ok:owasp.java.xxe.javax.xml.stream.XMLInputFactory
            XMLInputFactory xmlInputFactory = XMLInputFactory.newInstance();
            xmlInputFactory.setProperty("javax.xml.stream.supportDTD", false);
            XMLStreamReader reader = xmlInputFactory.createXMLStreamReader(new StringReader(body));
            reader.nextTag();

        } catch (Exception e) {
            logger.error(e.toString());
            return EXCEPT;
        }

        return "XMLInputFactory xxe vuln code";
    }

    @PostMapping("/XMLInputFactory/fix2")
    public String XMLInputFactoryFix2(HttpServletRequest request) {
        try {
            String body = WebUtils.getRequestBody(request);
            logger.info(body);
            // ok:owasp.java.xxe.javax.xml.stream.XMLInputFactory
            XMLInputFactory xmlInputFactory = XMLInputFactory.newInstance();
            xmlInputFactory.setProperty(XMLInputFactory.SUPPORT_DTD, false);
            XMLStreamReader reader = xmlInputFactory.createXMLStreamReader(new StringReader(body));
            reader.nextTag();

        } catch (Exception e) {
            logger.error(e.toString());
            return EXCEPT;
        }

        return "XMLInputFactory xxe vuln code";
    }

    @PostMapping("/XMLInputFactory/fix3")
    public String XMLInputFactoryFix3(HttpServletRequest request) {
        try {
            String body = WebUtils.getRequestBody(request);
            logger.info(body);
            // ok:owasp.java.xxe.javax.xml.stream.XMLInputFactory
            XMLInputFactory xmlInputFactory = XMLInputFactory.newInstance();
            xmlInputFactory.setProperty("javax.xml.stream.isSupportingExternalEntities", false);
            XMLStreamReader reader = xmlInputFactory.createXMLStreamReader(new StringReader(body));
            reader.nextTag();

        } catch (Exception e) {
            logger.error(e.toString());
            return EXCEPT;
        }

        return "XMLInputFactory xxe vuln code";
    }

    public static SortingMachine<Map.Pair<String, Integer>> shorten(
            SortingMachine<Map.Pair<String, Integer>> sortMachine, int num) {
        assert sortMachine != null : "Violation of: sortMachine is not null";
        assert num <= sortMachine
                .size() : "Violation of: N <= size of sortMachine";
        // ok: owasp.java.xxe.javax.xml.stream.XMLInputFactory
        SortingMachine<Map.Pair<String, Integer>> shortenedSM = sortMachine
                .newInstance();
        int i = 0;

        //creates a new sortingMachine that only contains the N elements desired
        //by the user
        for (Map.Pair<String, Integer> pair : sortMachine) {
            if (i < num) {
                shortenedSM.add(pair);
            }
            i++;
        }
        return shortenedSM;
    }


    public static void main(String[] args)  {
    }

}
