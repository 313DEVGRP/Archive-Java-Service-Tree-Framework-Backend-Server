package egovframework.com.jstree.springHibernate.core.validation.custom.validator;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

import org.apache.commons.lang.StringUtils;

import egovframework.com.ext.jstree.springHibernate.core.validation.custom.constraints.Contained;


public class ContainedValidator implements ConstraintValidator<Contained, String>{
	
	/*
	 * @Contained를 통해 지정한 스트링 값들
	 */
	private String[] values;
	@Override
	public void initialize(Contained constraintAnnotation) {
		this.values = constraintAnnotation.values();
	}

	@Override
	public boolean isValid(String value, ConstraintValidatorContext context) {
		if(values.length == 0) {
			return true;
		}
		
		for(String s: values){

            if (StringUtils.isEmpty(value) || s.equals(value)) {
                return true;
            }

		}
		return false;
	}
}
