package egovframework.com.ext.jstree.support.util;

import org.junit.Test;

import java.util.Arrays;
import java.util.List;
import java.util.stream.IntStream;
import java.util.stream.Stream;

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

    @Test
    public void functionalJavaOutLine() {
        List<String> myList =
                Arrays.asList("a1", "a2", "b1", "c2", "c1");

        myList
                .stream()
                .filter(s -> s.startsWith("c"))
                .map(String::toUpperCase)
                .sorted()
                .forEach(System.out::println);
    }

    @Test
    public void functionalJavaStreamTest(){
        Arrays.asList("a1", "a2", "a3")
                .stream()
                .findFirst()
                .ifPresent(System.out::println);
    }

    @Test
    public void fuctionalJavaStreamNoneCollectionTest(){
        Stream.of("a1", "a2", "a3")
                .findFirst()
                .ifPresent(System.out::println);
    }

    @Test
    public void functionJavaIntStreamTest(){
        IntStream.range(1, 4)
                .forEach(System.out::println);
    }

    @Test
    public void functionJavaPridicateTest(){
        Arrays.stream(new int[] {1, 2, 3})
                .map(n -> 2 * n + 1)
                .average()
                .ifPresent(System.out::println);
    }

}
