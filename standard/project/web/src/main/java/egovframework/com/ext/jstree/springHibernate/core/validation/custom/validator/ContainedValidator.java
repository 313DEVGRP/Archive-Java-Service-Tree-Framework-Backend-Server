package egovframework.com.ext.jstree.springHibernate.core.validation.custom.validator;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

import org.apache.commons.lang.StringUtils;

import egovframework.com.ext.jstree.springHibernate.core.validation.custom.constraints.Contained;

/**
 * Modification Information
 * 
 * @author 전경훈
 * @since 2015. 3. 5.
 * @version 1.0
 * @see <pre>
 * 	Class Name 	: ContainedValidator.java
 * 	Description : Contained Constraint Annotation 검증 구현 클래스
 * 	Infomation	: Contained의 String 배열을 받고, 매핑된 필드값이 그 안에 속해 있는지 검증 
 * 				  
 *  
 *  << 개정이력(Modification Information) >>
 *  
 *  수정일         수정자             수정내용
 *  -------      ------------   -----------------------
 *  2015. 3.  5.  전경훈           최초 생성
 *  2015. 5. 25.  손호성           isValid null check 제거
 * 
 *  Copyright (C) 2015 by 313 DeveloperGroup  All right reserved.
 * </pre>
 */

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
		if(values.length == 0) return true;
		
		for(String s: values){

            if (StringUtils.isEmpty(value) || s.equals(value)) {
                return true;
            }

		}
		return false;
	}
}
