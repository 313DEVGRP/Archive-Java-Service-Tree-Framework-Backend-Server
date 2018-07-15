package egovframework.com.ext.jstree.support.util;

import org.junit.Test;

/**
 * Created by Administrator on 2018-07-12.
 */
public class Java8LambdaTest {

    @Test
    public void functionalJavaTest1() {
        System.out.println("=== RunnableTest ===");
        // Anonymous Runnable
        Runnable r1 = new Runnable() {
            @Override
            public void run() {
                System.out.println("Hello world one!");
            }
        };

        // Lambda Runnable
        Runnable r2 = () -> System.out.println("Hello world two!");

        // Run em!
        r1.run();
        r2.run();
    }

}
