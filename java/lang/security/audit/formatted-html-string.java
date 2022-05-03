package org.sasanlabs.service.vulnerability.xss.reflected;

import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import org.sasanlabs.internal.utility.LevelConstants;
import org.sasanlabs.internal.utility.annotations.AttackVector;
import org.sasanlabs.internal.utility.annotations.VulnerableAppRequestMapping;
import org.sasanlabs.internal.utility.annotations.VulnerableAppRestController;
import org.sasanlabs.vulnerability.types.VulnerabilityType;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestParam;

/**
 * This is a XSS vulnerability present in Html Tag injection.
 *
 * @author KSASAN preetkaran20@gmail.com
 */
@VulnerableAppRestController(
        descriptionLabel = "XSS_VULNERABILITY",
        value = "XSSWithHtmlTagInjection")
public class UrlParamBasedHtmlTagInjection {

    // Just adding User defined input(Untrusted Data) into div tag.
    // Can be broken by various ways
    @AttackVector(
            vulnerabilityExposed = VulnerabilityType.REFLECTED_XSS,
            description = "XSS_DIRECT_INPUT_DIV_TAG")
    @VulnerableAppRequestMapping(value = LevelConstants.LEVEL_1, htmlTemplate = "LEVEL_1/XSS")
    public ResponseEntity<String> getVulnerablePayloadLevel1(
            @RequestParam Map<String, String> queryParams) {
        String vulnerablePayloadWithPlaceHolder = "<div>%s<div>";
        StringBuilder payload = new StringBuilder();
        for (Map.Entry<String, String> map : queryParams.entrySet()) {
            payload.append(String.format(vulnerablePayloadWithPlaceHolder, map.getValue()));
        }
        return new ResponseEntity<String>(payload.toString(), HttpStatus.OK);
    }

    // Just adding User defined input(Untrusted Data) into div tag if doesn't contains
    // anchor/script/image tag.
    // Can be broken by various ways
    // eg: <object data="something" onerror=alert(1) />
    @AttackVector(
            vulnerabilityExposed = VulnerabilityType.REFLECTED_XSS,
            description =
                    "XSS_DIRECT_INPUT_DIV_TAG_AFTER_REMOVING_VALUES_CONTAINING_ANCHOR_SCRIPT_AND_IMG_TAG")
    @VulnerableAppRequestMapping(value = LevelConstants.LEVEL_2, htmlTemplate = "LEVEL_1/XSS")
    public ResponseEntity<String> getVulnerablePayloadLevel2(
            @RequestParam Map<String, String> queryParams) {
        String vulnerablePayloadWithPlaceHolder = "<div>%s<div>";
        StringBuilder payload = new StringBuilder();
        Pattern pattern = Pattern.compile("[<]+[(script)(img)(a)]+.*[>]+");
        for (Map.Entry<String, String> map : queryParams.entrySet()) {
            Matcher matcher = pattern.matcher(map.getValue());
            if (!matcher.find()) {
                payload.append(String.format(vulnerablePayloadWithPlaceHolder, map.getValue()));
            }
        }
        return new ResponseEntity<String>(payload.toString(), HttpStatus.OK);
    }

    // Just adding User defined input(Untrusted Data) into div tag if doesn't contains
    // anchor/script/image tag and also alert/javascript keyword.
    // Can be broken by various ways
    // eg: <object data=data:text/html;base64,PHNjcmlwdD5hbGVydCgiSGVsbG8iKTs8L3NjcmlwdD4= />
    @AttackVector(
            vulnerabilityExposed = VulnerabilityType.REFLECTED_XSS,
            description =
                    "XSS_DIRECT_INPUT_DIV_TAG_AFTER_REMOVING_VALUES_CONTAINING_ANCHOR_SCRIPT_IMG_TAG_AND_ALERT_KEYWORD")
    @VulnerableAppRequestMapping(value = LevelConstants.LEVEL_3, htmlTemplate = "LEVEL_1/XSS")
    public ResponseEntity<String> getVulnerablePayloadLevel3(
            @RequestParam Map<String, String> queryParams) {
        String vulnerablePayloadWithPlaceHolder = "<div>%s<div>";
        StringBuilder payload = new StringBuilder();
        Pattern pattern = Pattern.compile("[<]+[(script)(img)(a)]+.*[>]+");
        for (Map.Entry<String, String> map : queryParams.entrySet()) {
            Matcher matcher = pattern.matcher(map.getValue());
            if (!matcher.find()
                    && !map.getValue().contains("alert")
                    && !map.getValue().contains("javascript")) {
                payload.append(String.format(vulnerablePayloadWithPlaceHolder, map.getValue()));
            }
        }
        return new ResponseEntity<String>(payload.toString(), HttpStatus.OK);
    }
}

class XMLParse {

	/**
	 * 提取出xml数据包中的加密消息
	 * @param xmltext 待提取的xml字符串
	 * @return 提取出的加密消息字符串
	 * @throws AesException
	 */
	public static Object[] extract(String xmltext) throws AesException     {
		Object[] result = new Object[3];
		try {
			DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
			DocumentBuilder db = dbf.newDocumentBuilder();
			StringReader sr = new StringReader(xmltext);
			InputSource is = new InputSource(sr);
			Document document = db.parse(is);

			Element root = document.getDocumentElement();
			NodeList nodelist1 = root.getElementsByTagName("Encrypt");

			result[0] = 0;
			result[1] = nodelist1.item(0).getTextContent();

			if(root.getElementsByTagName("ToUserName")!=null) {
				NodeList nodelist2 = root.getElementsByTagName("ToUserName");
				result[2] = nodelist2.item(0).getTextContent();
			}
			return result;
		} catch (Exception e) {
			e.printStackTrace();
			throw new AesException(AesException.ParseXmlError);
		}
	}

	/**
	 * 生成xml消息
	 * @param encrypt 加密后的消息密文
	 * @param signature 安全签名
	 * @param timestamp 时间戳
	 * @param nonce 随机字符串
	 * @return 生成的xml字符串
	 */
	public static String generate(String encrypt, String signature, String timestamp, String nonce) {

		String format = "<xml>\n" + "<Encrypt><![CDATA[%1$s]]></Encrypt>\n"
				+ "<MsgSignature><![CDATA[%2$s]]></MsgSignature>\n"
				+ "<TimeStamp>%3$s</TimeStamp>\n" + "<Nonce><![CDATA[%4$s]]></Nonce>\n" + "</xml>";
		return String.format(format, encrypt, signature, timestamp, nonce);

	}
}