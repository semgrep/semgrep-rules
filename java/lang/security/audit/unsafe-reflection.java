package org.learn;

import java.util.ArrayList;

public class DemoForClassName {

    private static void demoCreateThread(String userInput) throws ClassNotFoundException,
            IllegalAccessException, InstantiationException, InterruptedException {
        // ruleid: unsafe-reflection
        Class<?> loadClass = Class.forName(userInput + "MyThread");

        Thread thread = (Thread) loadClass.newInstance();
        thread.start();
        thread.join();
    }

    private static void demoOk() throws ClassNotFoundException,
            IllegalAccessException, InstantiationException, InterruptedException {
        // ok: unsafe-reflection
        Class<?> loadClass = Class.forName("org.learn.MyThread");

        Thread thread = (Thread) loadClass.newInstance();
        thread.start();
        thread.join();
    }

}
