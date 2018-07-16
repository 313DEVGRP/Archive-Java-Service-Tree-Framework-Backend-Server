package egovframework.com.ext.jstree.support.util;

/**
 * Created by Administrator on 2018-07-12.
 */
public class Java8Lambda {

   String name;
   int age;

   Java8Lambda(String name, int age) {
      this.name = name;
      this.age = age;
   }

   @Override
   public String toString() {
      return name;
   }
}
