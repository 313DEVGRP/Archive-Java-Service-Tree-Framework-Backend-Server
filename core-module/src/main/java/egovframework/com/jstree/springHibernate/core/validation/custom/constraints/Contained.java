package egovframework.com.jstree.springHibernate.core.validation.custom.constraints;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

import javax.validation.Constraint;
import javax.validation.Payload;

import egovframework.com.ext.jstree.springHibernate.core.validation.custom.validator.ContainedValidator;


@Target({ElementType.FIELD})
@Retention(RetentionPolicy.RUNTIME)
@Constraint(validatedBy = ContainedValidator.class)
public @interface Contained {
	
	String message() default "The target field's mapping value is not contained in the given string array.";
	
	String[] values() default {};
	
	Class<?>[] groups() default {};
	
	Class<? extends Payload>[] payload() default {};
}
