package egovframework.com.ext.jstree.springmyBatis.core.validation.custom.constraints;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

import javax.validation.Constraint;
import javax.validation.Payload;

import egovframework.com.ext.jstree.springmyBatis.core.validation.custom.validator.ContainedValidator;

/**
 * Modification Information
 * 
 * @author 전경훈
 * @since 2015. 3. 5.
 * @version 1.0
 * @see <pre>
 * 	Class Name 	: Contained.java
 * 	Description : Contained Constraint Annotation
 * 	Infomation	: 어노테이션에 해당하는 필드의 매핑 값이 
 * 				  명시된 String 배열 안에 속하는지 체크함
 *  Usage 	    : 사용할 String타입의 필드 위에 지정함
 *  			  @Contained(values={"example1", "example2"}, groups={Example.class})
 *  			  values : 속해야 할 String 배열, groups : 검증 그룹
 *  			  
 *  << 개정이력(Modification Information) >>
 *  
 *  수정일         수정자             수정내용
 *  -------      ------------   -----------------------
 *  2015. 3. 5.  전경훈           최초 생성
 * 
 *  Copyright (C) 2015 by 313 DeveloperGroup  All right reserved.
 * </pre>
 */

@Target({ElementType.FIELD})
@Retention(RetentionPolicy.RUNTIME)
@Constraint(validatedBy = ContainedValidator.class)
public @interface Contained {
	
	String message() default "The target field's mapping value is not contained in the given string array.";
	
	String[] values() default {};
	
	Class<?>[] groups() default {};
	
	Class<? extends Payload>[] payload() default {};
}
