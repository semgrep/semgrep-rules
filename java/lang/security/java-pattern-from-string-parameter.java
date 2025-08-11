package com.test;

import java.util.regex.Pattern;

public class Cases {

    public void case1(int v, String regex, long x) {
        String data = "a".repeat(50) + "!";
        //ruleid: java-pattern-from-string-parameter
        Pattern.matches(regex,data);
        //ruleid: java-pattern-from-string-parameter
        Pattern.compile(regex);
        //ruleid: java-pattern-from-string-parameter
        Pattern.compile(regex,Pattern.CASE_INSENSITIVE);        
        //ok: java-pattern-from-string-parameter
        data.matches("[a-z]+");
    }

    public void case2(String regex, long x) {
        String data = "a".repeat(50) + "!";
        //ruleid: java-pattern-from-string-parameter
        Pattern.matches(regex,data);
        //ruleid: java-pattern-from-string-parameter
        Pattern.compile(regex);
        //ruleid: java-pattern-from-string-parameter
        Pattern.compile(regex,Pattern.CASE_INSENSITIVE);        
        //ok: java-pattern-from-string-parameter
        data.matches("[a-z]+");
    }

    public void case3(int v, String regex) {
        String data = "a".repeat(50) + "!";
        //ruleid: java-pattern-from-string-parameter
        Pattern.matches(regex,data);
        //ruleid: java-pattern-from-string-parameter
        Pattern.compile(regex);
        //ruleid: java-pattern-from-string-parameter
        Pattern.compile(regex,Pattern.CASE_INSENSITIVE);        
        //ok: java-pattern-from-string-parameter
        data.matches("[a-z]+");
    } 

    public void case4(String regex) {
        String data = "a".repeat(50) + "!";
        //ruleid: java-pattern-from-string-parameter
        Pattern.matches(regex,data);
        //ruleid: java-pattern-from-string-parameter
        Pattern.compile(regex);
        //ruleid: java-pattern-from-string-parameter
        Pattern.compile(regex,Pattern.CASE_INSENSITIVE);        
        //ok: java-pattern-from-string-parameter
        data.matches("[a-z]+");
    }            
}
