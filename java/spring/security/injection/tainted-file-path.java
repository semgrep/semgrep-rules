package org.sasanlabs.service.vulnerability.fileupload;

import static org.sasanlabs.service.vulnerability.fileupload.UnrestrictedFileUpload.CONTENT_DISPOSITION_STATIC_FILE_LOCATION;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import org.apache.commons.io.IOUtils;
import org.sasanlabs.internal.utility.FrameworkConstants;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * Preflight is the request which is executed to download the uploaded file. This controller is made
 * specifically for content disposition based response. we could have created the similar endpoint
 * in {@code UnrestrictedFileUpload} but as framework appends the "Vulnerability name" hence created
 * a new endpoint.
 *
 * @author KSASAN preetkaran20@gmail.com
 */
@RestController
public class PreflightController {
    private UnrestrictedFileUpload unrestrictedFileUpload;

    public PreflightController(UnrestrictedFileUpload unrestrictedFileUpload) {
        this.unrestrictedFileUpload = unrestrictedFileUpload;
    }

    @RequestMapping(
            CONTENT_DISPOSITION_STATIC_FILE_LOCATION + FrameworkConstants.SLASH + "{fileName}")
    public ResponseEntity<byte[]> fetchFile(@PathVariable("fileName") String fileName)
            throws IOException {
        InputStream inputStream =
                // ruleid: tainted-file-path
                new FileInputStream(
                        unrestrictedFileUpload.getContentDispositionRoot().toFile()
                                + FrameworkConstants.SLASH
                                + fileName);
        HttpHeaders httpHeaders = new HttpHeaders();
        httpHeaders.add(HttpHeaders.CONTENT_DISPOSITION, "attachment");
        return new ResponseEntity<byte[]>(
                IOUtils.toByteArray(inputStream), httpHeaders, HttpStatus.OK);
    }
}
