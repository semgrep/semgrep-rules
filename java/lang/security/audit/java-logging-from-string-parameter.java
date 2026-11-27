package com.test;

import org.slf4j.*;
import org.springframework.web.bind.annotation.*;

public class Cases {

    private static final Logger logger = LoggerFactory.getLogger(Cases.class);    

    @GetMapping
    public void case1(String param, long x) {
        //ruleid: java-logging-from-string-parameter
        logger.trace("Msg {}",param);
        //ruleid: java-logging-from-string-parameter
        logger.debug("Msg {}",param);
        //ruleid: java-logging-from-string-parameter
        logger.info("Msg {}",param);                
        //ruleid: java-logging-from-string-parameter
        logger.warn("Msg {}",param);        
        //ruleid: java-logging-from-string-parameter
        logger.error("Msg {}",param);        
    }

    @PostMapping
    public void case2(String param, long x) {
        String param_clean = param.replace("<","").replace(">","");
        param_clean = param_clean.replace("\n","");
        //ok: java-logging-from-string-parameter
        logger.trace("Msg {}",param_clean);
        //ok: java-logging-from-string-parameter
        logger.debug("Msg {}",param_clean);
        //ok: java-logging-from-string-parameter
        logger.info("Msg {}",param_clean);                
        //ok: java-logging-from-string-parameter
        logger.warn("Msg {}",param_clean);        
        //ok: java-logging-from-string-parameter
        logger.error("Msg {}",param_clean);        
    }

    public void case3(String param, long x) {
        //ok: java-logging-from-string-parameter
        logger.trace("Msg {}",param);
        //ok: java-logging-from-string-parameter
        logger.debug("Msg {}",param);
        //ok: java-logging-from-string-parameter
        logger.info("Msg {}",param);                
        //ok: java-logging-from-string-parameter
        logger.warn("Msg {}",param);        
        //ok: java-logging-from-string-parameter
        logger.error("Msg {}",param);        
    }    
}
