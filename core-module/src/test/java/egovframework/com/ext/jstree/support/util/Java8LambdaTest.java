package egovframework.com.ext.jstree.support.util;

import org.junit.BeforeClass;
import org.junit.Test;

import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.IntStream;
import java.util.stream.Stream;

public class Java8LambdaTest {

    static List<Java8Lambda> persons;

    @BeforeClass
    public static void setUpBeforeClass() throws Exception {
        persons =
                Arrays.asList(
                        new Java8Lambda("Max", 18),
                        new Java8Lambda("Peter", 23),
                        new Java8Lambda("Pamela", 23),
                        new Java8Lambda("David", 12));
    }


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
    public void functionalJavaIntStreamTest(){
        IntStream.range(1, 4)
                .forEach(System.out::println);
    }

    @Test
    public void functionalJavaPridicateTest(){
        Arrays.stream(new int[] {1, 2, 3})
                .map(n -> 2 * n + 1)
                .average()
                .ifPresent(System.out::println);
    }

    @Test
    public void functionalJavaConvertStreamTest(){
        Stream.of("a1", "a2", "a3")
                .map(s -> s.substring(1))
                .mapToInt(Integer::parseInt)
                .max()
                .ifPresent(System.out::println);
    }

    @Test
    public void functionalJavaConvertObjTest(){
        IntStream.range(1, 4)
                .mapToObj(i -> "a" + i)
                .forEach(System.out::println);
    }

    @Test
    public void functionalJavaConvertInteractiveTest(){
        Stream.of(1.0, 2.0, 3.0)
                .mapToInt(Double::intValue)
                .mapToObj(i -> "a" + i)
                .forEach(System.out::println);
    }

    @Test
    public void functionalJavaFilterTest(){
        Stream.of("d2", "a2", "b1", "b3", "c")
                .filter(s -> { System.out.println("filter: " + s); return true; })
                .forEach(s -> System.out.println("forEach: " + s));
    }

    @Test
    public void functionalJavaMapTest(){
        Stream.of("d2", "a2", "b1", "b3", "c")
                .map(s -> { System.out.println("map: " + s); return s.toUpperCase(); })
                .anyMatch(s -> { System.out.println("anyMatch: " + s); return s.startsWith("A"); });
    }

    @Test
    public void functionalJavaMapFilterMixTest(){
        Stream.of("d2", "a2", "b1", "b3", "c")
                .map(s -> { System.out.println("map: " + s); return s.toUpperCase(); })
                .filter(s -> { System.out.println("filter: " + s); return s.startsWith("A"); })
                .forEach(s -> System.out.println("forEach: " + s));
    }

    @Test
    public void functionalJavaMapFilterOrderTest(){
        Stream.of("d2", "a2", "b1", "b3", "c")
                .filter(s -> { System.out.println("filter: " + s); return s.startsWith("a"); })
                .map(s -> { System.out.println("map: " + s); return s.toUpperCase(); })
                .forEach(s -> System.out.println("forEach: " + s));
    }

    @Test
    public void functionalJavaMapFilterSortMixTest(){
        Stream.of("d2", "a2", "b1", "b3", "c")
                .sorted((s1, s2) -> { System.out.printf("sort: %s; %s\n", s1, s2); return s1.compareTo(s2); })
                .filter(s -> { System.out.println("filter: " + s); return s.startsWith("a"); })
                .map(s -> { System.out.println("map: " + s); return s.toUpperCase(); })
                .forEach(s -> System.out.println("forEach: " + s));
    }

    @Test
    public void functionalJavaMapFilterSortPerformanceTest(){
        Stream.of("d2", "a2", "b1", "b3", "c")
                .filter(s -> {
                    System.out.println("filter: " + s);
                    return s.startsWith("a");
                })
                .sorted((s1, s2) -> {
                    System.out.printf("sort: %s; %s\n", s1, s2);
                    return s1.compareTo(s2);
                })
                .map(s -> {
                    System.out.println("map: " + s);
                    return s.toUpperCase();
                })
                .forEach(s -> System.out.println("forEach: " + s));
    }

    @Test
    public void functionalJavaCollectTest(){
        List<Java8Lambda> filtered =
                persons
                        .stream()
                        .filter(p -> p.name.startsWith("P"))
                        .collect(Collectors.toList());

        System.out.println(filtered);
    }
}
