package org.aidan;

import java.util.Iterator;
import java.util.Map;
import java.util.Set;

/**
 * Hello world!
 */
public class App {
    public static void main(String[] args) {
        int i = 1;
        while (true) {
            new Thread(new Runnable() {
                @Override
                public void run() {
                    System.out.println("Hello World!");
                    try {
                        Thread.sleep(1000L);
                    } catch (InterruptedException e) {
                        e.printStackTrace();
                    }
                }
            }, "线程名称" + i).start();
            i++;
            try {
//                jstack();
                Thread.sleep(2000L);
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }
    }


    private static void jstack() {
        Map<Thread, StackTraceElement[]> stackTraces = Thread.getAllStackTraces();
        Set<Map.Entry<Thread, StackTraceElement[]>> entries = stackTraces.entrySet();
        Iterator<Map.Entry<Thread, StackTraceElement[]>> iterator = entries.iterator();
        while (iterator.hasNext()) {
            Map.Entry<Thread, StackTraceElement[]> entry = iterator.next();
            Thread thread = entry.getKey();
            StackTraceElement[] stack = entry.getValue();
            System.out.println("线程名:" + thread.getName());
            for (StackTraceElement element : stack) {
                System.out.println(element);
            }
        }

    }
}
