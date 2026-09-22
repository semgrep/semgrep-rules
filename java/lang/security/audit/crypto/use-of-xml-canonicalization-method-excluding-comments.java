package com.test;

import javax.xml.crypto.dsig.XMLSignatureFactory;
import javax.xml.crypto.dsig.CanonicalizationMethod;

public class Cases {

    public void case1(XMLSignatureFactory signatureFactory) {
        //ruleid: use-of-xml-canonicalization-method-excluding-comments
        CanonicalizationMethod c14nMethod = signatureFactory.newCanonicalizationMethod(CanonicalizationMethod.EXCLUSIVE,null);
        //ruleid: use-of-xml-canonicalization-method-excluding-comments
        c14nMethod = signatureFactory.newCanonicalizationMethod("http://www.w3.org/2001/10/xml-exc-c14n#",null);        
    }

    public void case2(XMLSignatureFactory signatureFactory) {
        //ok: use-of-xml-canonicalization-method-excluding-comments
        CanonicalizationMethod c14nMethod = signatureFactory.newCanonicalizationMethod(CanonicalizationMethod.EXCLUSIVE_WITH_COMMENTS,null);
        //ok: use-of-xml-canonicalization-method-excluding-comments
        CanonicalizationMethod c14nMethod = signatureFactory.newCanonicalizationMethod("http://www.w3.org/2001/10/xml-exc-c14n#WithComments",null);
    }
}