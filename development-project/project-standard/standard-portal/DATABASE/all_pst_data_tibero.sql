--아래순서로 테이블생성 및 기초데이터 입력 

-- ID Generation
insert into IDS(TABLE_NAME,NEXT_ID) values ('BANNER_ID',1);
insert into IDS(TABLE_NAME,NEXT_ID) values ('BBS_ID',1);
insert into IDS(TABLE_NAME,NEXT_ID) values ('FAQ_ID',1);
insert into IDS(TABLE_NAME,NEXT_ID) values ('FILE_ID',1);
insert into IDS(TABLE_NAME,NEXT_ID) values ('GROUP_ID',1);
insert into IDS(TABLE_NAME,NEXT_ID) values ('INDVDL_INFO_ID',1);
insert into IDS(TABLE_NAME,NEXT_ID) values ('LOGINLOG_ID',1);
insert into IDS(TABLE_NAME,NEXT_ID) values ('QA_ID',1);
insert into IDS(TABLE_NAME,NEXT_ID) values ('QESRSPNS_ID',1);
insert into IDS(TABLE_NAME,NEXT_ID) values ('QESTNR_QESITM_ID',1);
insert into IDS(TABLE_NAME,NEXT_ID) values ('QESTNR_RPD_ID',1);
insert into IDS(TABLE_NAME,NEXT_ID) values ('QUSTNRQESTN_ID',1);
insert into IDS(TABLE_NAME,NEXT_ID) values ('QUSTNRTMPLA_ID',1);
insert into IDS(TABLE_NAME,NEXT_ID) values ('ROLE_ID',1);
insert into IDS(TABLE_NAME,NEXT_ID) values ('SAMPLE',1);
insert into IDS(TABLE_NAME,NEXT_ID) values ('TMPLAT_ID',1);
insert into IDS(TABLE_NAME,NEXT_ID) values ('USE_STPLAT_ID',1);
insert into IDS(TABLE_NAME,NEXT_ID) values ('USRCNFRM_ID',2);

-- 분류코드
insert into LETTCCMMNCLCODE(CL_CODE,CL_CODE_NM,CL_CODE_DC,USE_AT,FRST_REGIST_PNTTM,FRST_REGISTER_ID,LAST_UPDT_PNTTM,LAST_UPDUSR_ID) values ('LET','전자정부 프레임워크 경량환경 템플릿','전자정부 프레임워크 경량환경 템플릿1','Y',SYSDATE,'SYSTEM',SYSDATE,'SYSTEM');


-- 공통코드
insert into LETTCCMMNCODE(CODE_ID,CODE_ID_NM,CODE_ID_DC,USE_AT,CL_CODE,FRST_REGIST_PNTTM,FRST_REGISTER_ID,LAST_UPDT_PNTTM,LAST_UPDUSR_ID) values ('COM001','등록구분','게시판, 커뮤니티, 동호회 등록구분코드','Y','LET',SYSDATE,'SYSTEM',SYSDATE,'SYSTEM');
insert into LETTCCMMNCODE(CODE_ID,CODE_ID_NM,CODE_ID_DC,USE_AT,CL_CODE,FRST_REGIST_PNTTM,FRST_REGISTER_ID,LAST_UPDT_PNTTM,LAST_UPDUSR_ID) values ('COM003','업무구분','업무구분코드','Y','LET',SYSDATE,'SYSTEM',SYSDATE,'SYSTEM');
insert into LETTCCMMNCODE(CODE_ID,CODE_ID_NM,CODE_ID_DC,USE_AT,CL_CODE,FRST_REGIST_PNTTM,FRST_REGISTER_ID,LAST_UPDT_PNTTM,LAST_UPDUSR_ID) values ('COM004','게시판유형','게시판유형구분코드','Y','LET',SYSDATE,'SYSTEM',SYSDATE,'SYSTEM');
insert into LETTCCMMNCODE(CODE_ID,CODE_ID_NM,CODE_ID_DC,USE_AT,CL_CODE,FRST_REGIST_PNTTM,FRST_REGISTER_ID,LAST_UPDT_PNTTM,LAST_UPDUSR_ID) values ('COM005','템플릿유형','템플릿유형구분코드','Y','LET',SYSDATE,'SYSTEM',SYSDATE,'SYSTEM');
insert into LETTCCMMNCODE(CODE_ID,CODE_ID_NM,CODE_ID_DC,USE_AT,CL_CODE,FRST_REGIST_PNTTM,FRST_REGISTER_ID,LAST_UPDT_PNTTM,LAST_UPDUSR_ID) values ('COM009','게시판속성','게시판 속성','Y','LET',SYSDATE,'SYSTEM',SYSDATE,'SYSTEM');
insert into LETTCCMMNCODE(CODE_ID,CODE_ID_NM,CODE_ID_DC,USE_AT,CL_CODE,FRST_REGIST_PNTTM,FRST_REGISTER_ID,LAST_UPDT_PNTTM,LAST_UPDUSR_ID) values ('COM013','회원상태','회원 가입 신청/승인/삭제를 위한 상태 구분','Y','LET',SYSDATE,'SYSTEM',SYSDATE,'SYSTEM');
insert into LETTCCMMNCODE(CODE_ID,CODE_ID_NM,CODE_ID_DC,USE_AT,CL_CODE,FRST_REGIST_PNTTM,FRST_REGISTER_ID,LAST_UPDT_PNTTM,LAST_UPDUSR_ID) values ('COM014','성별구분','남녀 성별 구분','Y','LET',SYSDATE,'SYSTEM',SYSDATE,'SYSTEM');
insert into LETTCCMMNCODE(CODE_ID,CODE_ID_NM,CODE_ID_DC,USE_AT,CL_CODE,FRST_REGIST_PNTTM,FRST_REGISTER_ID,LAST_UPDT_PNTTM,LAST_UPDUSR_ID) values ('COM018','질문유형','질문유형 객관식/주관식 상태구분','Y','LET',SYSDATE,'SYSTEM',SYSDATE,'SYSTEM');
insert into LETTCCMMNCODE(CODE_ID,CODE_ID_NM,CODE_ID_DC,USE_AT,CL_CODE,FRST_REGIST_PNTTM,FRST_REGISTER_ID,LAST_UPDT_PNTTM,LAST_UPDUSR_ID) values ('COM022','비밀번호 힌트','비밀번호 힌트 구분코드','Y','LET',SYSDATE,'SYSTEM',SYSDATE,'SYSTEM');
insert into LETTCCMMNCODE(CODE_ID,CODE_ID_NM,CODE_ID_DC,USE_AT,CL_CODE,FRST_REGIST_PNTTM,FRST_REGISTER_ID,LAST_UPDT_PNTTM,LAST_UPDUSR_ID) values ('COM028','질의응답처리상태','Q/A 처리상태코드','Y','LET',SYSDATE,'SYSTEM',SYSDATE,'SYSTEM');
insert into LETTCCMMNCODE(CODE_ID,CODE_ID_NM,CODE_ID_DC,USE_AT,CL_CODE,FRST_REGIST_PNTTM,FRST_REGISTER_ID,LAST_UPDT_PNTTM,LAST_UPDUSR_ID) values ('COM029','롤유형코드','롤유형코드','Y','LET',SYSDATE,'SYSTEM',SYSDATE,'SYSTEM');
insert into LETTCCMMNCODE(CODE_ID,CODE_ID_NM,CODE_ID_DC,USE_AT,CL_CODE,FRST_REGIST_PNTTM,FRST_REGISTER_ID,LAST_UPDT_PNTTM,LAST_UPDUSR_ID) values ('COM034','직업유형','직업유형코드','Y','LET',SYSDATE,'SYSTEM',SYSDATE,'SYSTEM');


-- 공통상세코드
insert into LETTCCMMNDETAILCODE(CODE_ID,CODE,CODE_NM,CODE_DC,USE_AT,FRST_REGIST_PNTTM,FRST_REGISTER_ID,LAST_UPDT_PNTTM,LAST_UPDUSR_ID) values ('COM001','REGC01','단일 게시판 이용등록','단일 게시판 이용등록','Y',SYSDATE,'SYSTEM',SYSDATE,'SYSTEM');
insert into LETTCCMMNDETAILCODE(CODE_ID,CODE,CODE_NM,CODE_DC,USE_AT,FRST_REGIST_PNTTM,FRST_REGISTER_ID,LAST_UPDT_PNTTM,LAST_UPDUSR_ID) values ('COM001','REGC07','게시판사용자등록','게시판사용자등록','Y',SYSDATE,'SYSTEM',SYSDATE,'SYSTEM');
insert into LETTCCMMNDETAILCODE(CODE_ID,CODE,CODE_NM,CODE_DC,USE_AT,FRST_REGIST_PNTTM,FRST_REGISTER_ID,LAST_UPDT_PNTTM,LAST_UPDUSR_ID) values ('COM003','BBS','게시판','게시판','Y',SYSDATE,'SYSTEM',SYSDATE,'SYSTEM');
insert into LETTCCMMNDETAILCODE(CODE_ID,CODE,CODE_NM,CODE_DC,USE_AT,FRST_REGIST_PNTTM,FRST_REGISTER_ID,LAST_UPDT_PNTTM,LAST_UPDUSR_ID) values ('COM004','BBST01','일반게시판','일반게시판','Y',SYSDATE,'SYSTEM',SYSDATE,'SYSTEM');
insert into LETTCCMMNDETAILCODE(CODE_ID,CODE,CODE_NM,CODE_DC,USE_AT,FRST_REGIST_PNTTM,FRST_REGISTER_ID,LAST_UPDT_PNTTM,LAST_UPDUSR_ID) values ('COM004','BBST02','익명게시판','익명게시판','N',SYSDATE,'SYSTEM',SYSDATE,'SYSTEM');
insert into LETTCCMMNDETAILCODE(CODE_ID,CODE,CODE_NM,CODE_DC,USE_AT,FRST_REGIST_PNTTM,FRST_REGISTER_ID,LAST_UPDT_PNTTM,LAST_UPDUSR_ID) values ('COM004','BBST03','공지게시판','공지게시판','Y',SYSDATE,'SYSTEM',SYSDATE,'SYSTEM');
insert into LETTCCMMNDETAILCODE(CODE_ID,CODE,CODE_NM,CODE_DC,USE_AT,FRST_REGIST_PNTTM,FRST_REGISTER_ID,LAST_UPDT_PNTTM,LAST_UPDUSR_ID) values ('COM005','TMPT01','게시판템플릿','게시판템플릿','Y',SYSDATE,'SYSTEM',SYSDATE,'SYSTEM');
insert into LETTCCMMNDETAILCODE(CODE_ID,CODE,CODE_NM,CODE_DC,USE_AT,FRST_REGIST_PNTTM,FRST_REGISTER_ID,LAST_UPDT_PNTTM,LAST_UPDUSR_ID) values ('COM009','BBSA01','유효게시판','유효게시판','N',SYSDATE,'SYSTEM',SYSDATE,'SYSTEM');
insert into LETTCCMMNDETAILCODE(CODE_ID,CODE,CODE_NM,CODE_DC,USE_AT,FRST_REGIST_PNTTM,FRST_REGISTER_ID,LAST_UPDT_PNTTM,LAST_UPDUSR_ID) values ('COM009','BBSA02','갤러리','갤러리','Y',SYSDATE,'SYSTEM',SYSDATE,'SYSTEM');
insert into LETTCCMMNDETAILCODE(CODE_ID,CODE,CODE_NM,CODE_DC,USE_AT,FRST_REGIST_PNTTM,FRST_REGISTER_ID,LAST_UPDT_PNTTM,LAST_UPDUSR_ID) values ('COM009','BBSA03','일반게시판','일반게시판','Y',SYSDATE,'SYSTEM',SYSDATE,'SYSTEM');
insert into LETTCCMMNDETAILCODE(CODE_ID,CODE,CODE_NM,CODE_DC,USE_AT,FRST_REGIST_PNTTM,FRST_REGISTER_ID,LAST_UPDT_PNTTM,LAST_UPDUSR_ID) values ('COM013','A','회원 가입 신청 상태','회원 가입 신청 상태','Y',SYSDATE,'SYSTEM',SYSDATE,'SYSTEM');
insert into LETTCCMMNDETAILCODE(CODE_ID,CODE,CODE_NM,CODE_DC,USE_AT,FRST_REGIST_PNTTM,FRST_REGISTER_ID,LAST_UPDT_PNTTM,LAST_UPDUSR_ID) values ('COM013','D','회원 가입 삭제 상태','회원 가입 삭제 상태','Y',SYSDATE,'SYSTEM',SYSDATE,'SYSTEM');
insert into LETTCCMMNDETAILCODE(CODE_ID,CODE,CODE_NM,CODE_DC,USE_AT,FRST_REGIST_PNTTM,FRST_REGISTER_ID,LAST_UPDT_PNTTM,LAST_UPDUSR_ID) values ('COM013','P','회원 가입 승인 상태','회원 가입 승인 상태','Y',SYSDATE,'SYSTEM',SYSDATE,'SYSTEM');
insert into LETTCCMMNDETAILCODE(CODE_ID,CODE,CODE_NM,CODE_DC,USE_AT,FRST_REGIST_PNTTM,FRST_REGISTER_ID,LAST_UPDT_PNTTM,LAST_UPDUSR_ID) values ('COM014','F','여자','여자','Y',SYSDATE,'SYSTEM',SYSDATE,'SYSTEM');
insert into LETTCCMMNDETAILCODE(CODE_ID,CODE,CODE_NM,CODE_DC,USE_AT,FRST_REGIST_PNTTM,FRST_REGISTER_ID,LAST_UPDT_PNTTM,LAST_UPDUSR_ID) values ('COM014','M','남자','남자','Y',SYSDATE,'SYSTEM',SYSDATE,'SYSTEM');
insert into LETTCCMMNDETAILCODE(CODE_ID,CODE,CODE_NM,CODE_DC,USE_AT,FRST_REGIST_PNTTM,FRST_REGISTER_ID,LAST_UPDT_PNTTM,LAST_UPDUSR_ID) values ('COM018','1','객관식','객관식','Y',SYSDATE,'SYSTEM',SYSDATE,'SYSTEM');
insert into LETTCCMMNDETAILCODE(CODE_ID,CODE,CODE_NM,CODE_DC,USE_AT,FRST_REGIST_PNTTM,FRST_REGISTER_ID,LAST_UPDT_PNTTM,LAST_UPDUSR_ID) values ('COM018','2','주관식','주관식','Y',SYSDATE,'SYSTEM',SYSDATE,'SYSTEM');
insert into LETTCCMMNDETAILCODE(CODE_ID,CODE,CODE_NM,CODE_DC,USE_AT,FRST_REGIST_PNTTM,FRST_REGISTER_ID,LAST_UPDT_PNTTM,LAST_UPDUSR_ID) values ('COM022',' P01','가장 기억에 남는 장소는?','가장 기억에 남는 장소는?','Y',SYSDATE,'SYSTEM',SYSDATE,'SYSTEM');
insert into LETTCCMMNDETAILCODE(CODE_ID,CODE,CODE_NM,CODE_DC,USE_AT,FRST_REGIST_PNTTM,FRST_REGISTER_ID,LAST_UPDT_PNTTM,LAST_UPDUSR_ID) values ('COM022',' P02','나의 좌우명은?','나의 좌우명은?','Y',SYSDATE,'SYSTEM',SYSDATE,'SYSTEM');
insert into LETTCCMMNDETAILCODE(CODE_ID,CODE,CODE_NM,CODE_DC,USE_AT,FRST_REGIST_PNTTM,FRST_REGISTER_ID,LAST_UPDT_PNTTM,LAST_UPDUSR_ID) values ('COM022',' P03','나의 보물 제1호는?','나의 보물 제1호는?','Y',SYSDATE,'SYSTEM',SYSDATE,'SYSTEM');
insert into LETTCCMMNDETAILCODE(CODE_ID,CODE,CODE_NM,CODE_DC,USE_AT,FRST_REGIST_PNTTM,FRST_REGISTER_ID,LAST_UPDT_PNTTM,LAST_UPDUSR_ID) values ('COM022',' P04','가장 기억에 남는 선생님 성함은?','가장 기억에 남는 선생님 성함은?','Y',SYSDATE,'SYSTEM',SYSDATE,'SYSTEM');
insert into LETTCCMMNDETAILCODE(CODE_ID,CODE,CODE_NM,CODE_DC,USE_AT,FRST_REGIST_PNTTM,FRST_REGISTER_ID,LAST_UPDT_PNTTM,LAST_UPDUSR_ID) values ('COM022',' P05','다른 사람은 모르는 나만의 신체비밀은?','다른 사람은 모르는 나만의 신체비밀은?','Y',SYSDATE,'SYSTEM',SYSDATE,'SYSTEM');
insert into LETTCCMMNDETAILCODE(CODE_ID,CODE,CODE_NM,CODE_DC,USE_AT,FRST_REGIST_PNTTM,FRST_REGISTER_ID,LAST_UPDT_PNTTM,LAST_UPDUSR_ID) values ('COM028','1','접수대기','접수대기','Y',SYSDATE,'SYSTEM',SYSDATE,'SYSTEM');
insert into LETTCCMMNDETAILCODE(CODE_ID,CODE,CODE_NM,CODE_DC,USE_AT,FRST_REGIST_PNTTM,FRST_REGISTER_ID,LAST_UPDT_PNTTM,LAST_UPDUSR_ID) values ('COM028','2','접수','접수','Y',SYSDATE,'SYSTEM',SYSDATE,'SYSTEM');
insert into LETTCCMMNDETAILCODE(CODE_ID,CODE,CODE_NM,CODE_DC,USE_AT,FRST_REGIST_PNTTM,FRST_REGISTER_ID,LAST_UPDT_PNTTM,LAST_UPDUSR_ID) values ('COM028','3','완료','완료','Y',SYSDATE,'SYSTEM',SYSDATE,'SYSTEM');
insert into LETTCCMMNDETAILCODE(CODE_ID,CODE,CODE_NM,CODE_DC,USE_AT,FRST_REGIST_PNTTM,FRST_REGISTER_ID,LAST_UPDT_PNTTM,LAST_UPDUSR_ID) values ('COM029','url','URL','URL','Y',SYSDATE,'SYSTEM',SYSDATE,'SYSTEM');
insert into LETTCCMMNDETAILCODE(CODE_ID,CODE,CODE_NM,CODE_DC,USE_AT,FRST_REGIST_PNTTM,FRST_REGISTER_ID,LAST_UPDT_PNTTM,LAST_UPDUSR_ID) values ('COM034','1','학생','학생','Y',SYSDATE,'SYSTEM',SYSDATE,'SYSTEM');
insert into LETTCCMMNDETAILCODE(CODE_ID,CODE,CODE_NM,CODE_DC,USE_AT,FRST_REGIST_PNTTM,FRST_REGISTER_ID,LAST_UPDT_PNTTM,LAST_UPDUSR_ID) values ('COM034','2','대학생','대학생','Y',SYSDATE,'SYSTEM',SYSDATE,'SYSTEM');
insert into LETTCCMMNDETAILCODE(CODE_ID,CODE,CODE_NM,CODE_DC,USE_AT,FRST_REGIST_PNTTM,FRST_REGISTER_ID,LAST_UPDT_PNTTM,LAST_UPDUSR_ID) values ('COM034','3','군인','군인','Y',SYSDATE,'SYSTEM',SYSDATE,'SYSTEM');
insert into LETTCCMMNDETAILCODE(CODE_ID,CODE,CODE_NM,CODE_DC,USE_AT,FRST_REGIST_PNTTM,FRST_REGISTER_ID,LAST_UPDT_PNTTM,LAST_UPDUSR_ID) values ('COM034','4','교사','교사','Y',SYSDATE,'SYSTEM',SYSDATE,'SYSTEM');
insert into LETTCCMMNDETAILCODE(CODE_ID,CODE,CODE_NM,CODE_DC,USE_AT,FRST_REGIST_PNTTM,FRST_REGISTER_ID,LAST_UPDT_PNTTM,LAST_UPDUSR_ID) values ('COM034','5','기타','기타','Y',SYSDATE,'SYSTEM',SYSDATE,'SYSTEM');


-- 조직정보
insert into LETTNORGNZTINFO(ORGNZT_ID,ORGNZT_NM,ORGNZT_DC) values ('ORGNZT_0000000000000','기본조직','기본조직');


-- 그룹정보
insert into LETTNAUTHORGROUPINFO(GROUP_ID,GROUP_NM,GROUP_CREAT_DE,GROUP_DC) values ('GROUP_00000000000000','기본 그룹입니다',SYSDATE,'기본 그룹');


-- 권한정보
insert into LETTNAUTHORINFO(AUTHOR_CODE,AUTHOR_NM,AUTHOR_DC,AUTHOR_CREAT_DE) values ('ROLE_ADMIN','관리자','관리자',SYSDATE);
insert into LETTNAUTHORINFO(AUTHOR_CODE,AUTHOR_NM,AUTHOR_DC,AUTHOR_CREAT_DE) values ('ROLE_ANONYMOUS','오픈기능','오픈기능',SYSDATE);
insert into LETTNAUTHORINFO(AUTHOR_CODE,AUTHOR_NM,AUTHOR_DC,AUTHOR_CREAT_DE) values ('ROLE_USER_MEMBER','담당자','회원',SYSDATE);


-- 권한(롤)계층정보
insert into LETTNROLES_HIERARCHY(PARNTS_ROLE,CHLDRN_ROLE) values ('ROLE_USER_MEMBER','ROLE_ADMIN');
insert into LETTNROLES_HIERARCHY(PARNTS_ROLE,CHLDRN_ROLE) values ('ROLE_ANONYMOUS','ROLE_USER_MEMBER');


-- 롤정보
insert into LETTNROLEINFO(ROLE_CODE,ROLE_NM,ROLE_PTTRN,ROLE_DC,ROLE_TY,ROLE_SORT,ROLE_CREAT_DE) values ('cmm-uss-umt','cmm-uss-umt','/cmm/uss/umt/.*.do.*','아이디중복확인','url','1',SYSDATE);
insert into LETTNROLEINFO(ROLE_CODE,ROLE_NM,ROLE_PTTRN,ROLE_DC,ROLE_TY,ROLE_SORT,ROLE_CREAT_DE) values ('cop-bbs','cop-bbs','/cop/bbs/.*.do.*','게시판','url','2',SYSDATE);
insert into LETTNROLEINFO(ROLE_CODE,ROLE_NM,ROLE_PTTRN,ROLE_DC,ROLE_TY,ROLE_SORT,ROLE_CREAT_DE) values ('cop-com','cop-com','/cop/com/.*.do.*','게시판사용','url','3',SYSDATE);
insert into LETTNROLEINFO(ROLE_CODE,ROLE_NM,ROLE_PTTRN,ROLE_DC,ROLE_TY,ROLE_SORT,ROLE_CREAT_DE) values ('sec-gmt','sec-gmt','/sec/gmt/.*.do.*','그룹관리','url','4',SYSDATE);
insert into LETTNROLEINFO(ROLE_CODE,ROLE_NM,ROLE_PTTRN,ROLE_DC,ROLE_TY,ROLE_SORT,ROLE_CREAT_DE) values ('sec-ram','sec-ram','/sec/ram/.*.do.*','권한관리','url','5',SYSDATE);
insert into LETTNROLEINFO(ROLE_CODE,ROLE_NM,ROLE_PTTRN,ROLE_DC,ROLE_TY,ROLE_SORT,ROLE_CREAT_DE) values ('sec-rgm','sec-rgm','/sec/rgm/.*.do.*','권한그룹관리','url','6',SYSDATE);
insert into LETTNROLEINFO(ROLE_CODE,ROLE_NM,ROLE_PTTRN,ROLE_DC,ROLE_TY,ROLE_SORT,ROLE_CREAT_DE) values ('sec-rmt','sec-rmt','/sec/rmt/.*.do.*','롤관리','url','7',SYSDATE);
insert into LETTNROLEINFO(ROLE_CODE,ROLE_NM,ROLE_PTTRN,ROLE_DC,ROLE_TY,ROLE_SORT,ROLE_CREAT_DE) values ('uss-ion-bnr','uss-ion-bnr','/uss/ion/bnr/.*.do.*','배너관리','url','8',SYSDATE);
insert into LETTNROLEINFO(ROLE_CODE,ROLE_NM,ROLE_PTTRN,ROLE_DC,ROLE_TY,ROLE_SORT,ROLE_CREAT_DE) values ('uss-olh-faq','uss-olh-faq','/uss/olh/faq/.*.do.*','FAQ','url','9',SYSDATE);
insert into LETTNROLEINFO(ROLE_CODE,ROLE_NM,ROLE_PTTRN,ROLE_DC,ROLE_TY,ROLE_SORT,ROLE_CREAT_DE) values ('uss-olh-qna','uss-olh-qna','/uss/olh/qna/.*.do.*','QnA','url','10',SYSDATE);
insert into LETTNROLEINFO(ROLE_CODE,ROLE_NM,ROLE_PTTRN,ROLE_DC,ROLE_TY,ROLE_SORT,ROLE_CREAT_DE) values ('uss-olh-qnm','uss-olh-qnm','/uss/olh/qnm/.*.do.*','QnA답변','url','11',SYSDATE);
insert into LETTNROLEINFO(ROLE_CODE,ROLE_NM,ROLE_PTTRN,ROLE_DC,ROLE_TY,ROLE_SORT,ROLE_CREAT_DE) values ('uss-olp-qim','uss-olp-qim','/uss/olp/qim/.*.do.*','항목관리','url','12',SYSDATE);
insert into LETTNROLEINFO(ROLE_CODE,ROLE_NM,ROLE_PTTRN,ROLE_DC,ROLE_TY,ROLE_SORT,ROLE_CREAT_DE) values ('uss-olp-qmc','uss-olp-qmc','/uss/olp/qmc/.*.do.*','설문관리','url','13',SYSDATE);
insert into LETTNROLEINFO(ROLE_CODE,ROLE_NM,ROLE_PTTRN,ROLE_DC,ROLE_TY,ROLE_SORT,ROLE_CREAT_DE) values ('uss-olp-qnn','uss-olp-qnn','/uss/olp/qnn/.*.do.*','설문참여','url','14',SYSDATE);
insert into LETTNROLEINFO(ROLE_CODE,ROLE_NM,ROLE_PTTRN,ROLE_DC,ROLE_TY,ROLE_SORT,ROLE_CREAT_DE) values ('uss-olp-qqm','uss-olp-qqm','/uss/olp/qqm/.*.do.*','문항관리','url','15',SYSDATE);
insert into LETTNROLEINFO(ROLE_CODE,ROLE_NM,ROLE_PTTRN,ROLE_DC,ROLE_TY,ROLE_SORT,ROLE_CREAT_DE) values ('uss-olp-qri','uss-olp-qri','/uss/olp/qri/.*.do.*','설문조사','url','16',SYSDATE);
insert into LETTNROLEINFO(ROLE_CODE,ROLE_NM,ROLE_PTTRN,ROLE_DC,ROLE_TY,ROLE_SORT,ROLE_CREAT_DE) values ('uss-olp-qrm','uss-olp-qrm','/uss/olp/qrm/.*.do.*','응답자관리','url','17',SYSDATE);
insert into LETTNROLEINFO(ROLE_CODE,ROLE_NM,ROLE_PTTRN,ROLE_DC,ROLE_TY,ROLE_SORT,ROLE_CREAT_DE) values ('uss-olp-qtm','uss-olp-qtm','/uss/olp/qtm/.*.do.*','설문템플릿','url','18',SYSDATE);
insert into LETTNROLEINFO(ROLE_CODE,ROLE_NM,ROLE_PTTRN,ROLE_DC,ROLE_TY,ROLE_SORT,ROLE_CREAT_DE) values ('uss-sam-ipm','uss-sam-ipm','/uss/sam/ipm/.*.do.*','개인정보보호정책','url','19',SYSDATE);
insert into LETTNROLEINFO(ROLE_CODE,ROLE_NM,ROLE_PTTRN,ROLE_DC,ROLE_TY,ROLE_SORT,ROLE_CREAT_DE) values ('uss-sam-stp','uss-sam-stp','/uss/sam/stp/.*.do.*','약관','url','20',SYSDATE);
insert into LETTNROLEINFO(ROLE_CODE,ROLE_NM,ROLE_PTTRN,ROLE_DC,ROLE_TY,ROLE_SORT,ROLE_CREAT_DE) values ('uss-umt-cmm','uss-umt-cmm','/uss/umt/cmm/.*.do.*','일반회원가입신청','url','21',SYSDATE);
insert into LETTNROLEINFO(ROLE_CODE,ROLE_NM,ROLE_PTTRN,ROLE_DC,ROLE_TY,ROLE_SORT,ROLE_CREAT_DE) values ('uss-umt-mber','uss-umt-mber','/uss/umt/mber/.*.do.*','일반회원관리','url','22',SYSDATE);


-- 권한별 롤
insert into LETTNAUTHORROLERELATE(AUTHOR_CODE,ROLE_CODE,CREAT_DT) values ('ROLE_ADMIN','cmm-uss-umt',SYSDATE);
insert into LETTNAUTHORROLERELATE(AUTHOR_CODE,ROLE_CODE,CREAT_DT) values ('ROLE_ADMIN','sec-gmt',SYSDATE);
insert into LETTNAUTHORROLERELATE(AUTHOR_CODE,ROLE_CODE,CREAT_DT) values ('ROLE_ADMIN','sec-ram',SYSDATE);
insert into LETTNAUTHORROLERELATE(AUTHOR_CODE,ROLE_CODE,CREAT_DT) values ('ROLE_ADMIN','sec-rgm',SYSDATE);
insert into LETTNAUTHORROLERELATE(AUTHOR_CODE,ROLE_CODE,CREAT_DT) values ('ROLE_ADMIN','sec-rmt',SYSDATE);
insert into LETTNAUTHORROLERELATE(AUTHOR_CODE,ROLE_CODE,CREAT_DT) values ('ROLE_ADMIN','uss-umt-mber',SYSDATE);
insert into LETTNAUTHORROLERELATE(AUTHOR_CODE,ROLE_CODE,CREAT_DT) values ('ROLE_ANONYMOUS','cop-bbs',SYSDATE);
insert into LETTNAUTHORROLERELATE(AUTHOR_CODE,ROLE_CODE,CREAT_DT) values ('ROLE_ANONYMOUS','uss-olh-faq',SYSDATE);
insert into LETTNAUTHORROLERELATE(AUTHOR_CODE,ROLE_CODE,CREAT_DT) values ('ROLE_ANONYMOUS','uss-olh-qna',SYSDATE);
insert into LETTNAUTHORROLERELATE(AUTHOR_CODE,ROLE_CODE,CREAT_DT) values ('ROLE_ANONYMOUS','uss-olp-qnn',SYSDATE);
insert into LETTNAUTHORROLERELATE(AUTHOR_CODE,ROLE_CODE,CREAT_DT) values ('ROLE_ANONYMOUS','uss-umt-cmm',SYSDATE);
insert into LETTNAUTHORROLERELATE(AUTHOR_CODE,ROLE_CODE,CREAT_DT) values ('ROLE_USER_MEMBER','cop-com',SYSDATE);
insert into LETTNAUTHORROLERELATE(AUTHOR_CODE,ROLE_CODE,CREAT_DT) values ('ROLE_USER_MEMBER','uss-ion-bnr',SYSDATE);
insert into LETTNAUTHORROLERELATE(AUTHOR_CODE,ROLE_CODE,CREAT_DT) values ('ROLE_USER_MEMBER','uss-olh-qnm',SYSDATE);
insert into LETTNAUTHORROLERELATE(AUTHOR_CODE,ROLE_CODE,CREAT_DT) values ('ROLE_USER_MEMBER','uss-olp-qim',SYSDATE);
insert into LETTNAUTHORROLERELATE(AUTHOR_CODE,ROLE_CODE,CREAT_DT) values ('ROLE_USER_MEMBER','uss-olp-qmc',SYSDATE);
insert into LETTNAUTHORROLERELATE(AUTHOR_CODE,ROLE_CODE,CREAT_DT) values ('ROLE_USER_MEMBER','uss-olp-qqm',SYSDATE);
insert into LETTNAUTHORROLERELATE(AUTHOR_CODE,ROLE_CODE,CREAT_DT) values ('ROLE_USER_MEMBER','uss-olp-qri',SYSDATE);
insert into LETTNAUTHORROLERELATE(AUTHOR_CODE,ROLE_CODE,CREAT_DT) values ('ROLE_USER_MEMBER','uss-olp-qrm',SYSDATE);
insert into LETTNAUTHORROLERELATE(AUTHOR_CODE,ROLE_CODE,CREAT_DT) values ('ROLE_USER_MEMBER','uss-olp-qtm',SYSDATE);
insert into LETTNAUTHORROLERELATE(AUTHOR_CODE,ROLE_CODE,CREAT_DT) values ('ROLE_USER_MEMBER','uss-sam-ipm',SYSDATE);
insert into LETTNAUTHORROLERELATE(AUTHOR_CODE,ROLE_CODE,CREAT_DT) values ('ROLE_USER_MEMBER','uss-sam-stp',SYSDATE);


-- 사용자(회원)정보
insert into LETTNGNRLMBER(MBER_ID,PASSWORD,PASSWORD_HINT,PASSWORD_CNSR,IHIDNUM,MBER_NM,ZIP,ADRES,AREA_NO,MBER_STTUS,DETAIL_ADRES,END_TELNO,MBTLNUM,GROUP_ID,MBER_FXNUM,MBER_EMAIL_ADRES,MIDDLE_TELNO,SBSCRB_DE,SEXDSTN_CODE,ESNTL_ID) values ('admin','a4ayc/80/OGda4BO/1o/V0etpOqiLx1JwB5S3beHW0s=','P01','123','','관리자','','','','P','','','','GROUP_00000000000000','','','',SYSDATE,'','USRCNFRM_00000000000');
insert into LETTNGNRLMBER(MBER_ID,PASSWORD,PASSWORD_HINT,PASSWORD_CNSR,IHIDNUM,MBER_NM,ZIP,ADRES,AREA_NO,MBER_STTUS,DETAIL_ADRES,END_TELNO,MBTLNUM,GROUP_ID,MBER_FXNUM,MBER_EMAIL_ADRES,MIDDLE_TELNO,SBSCRB_DE,SEXDSTN_CODE,ESNTL_ID) values ('user1','a4ayc/80/OGda4BO/1o/V0etpOqiLx1JwB5S3beHW0s=','P01','123','','회원1','','','','P','','','','GROUP_00000000000000','','','',SYSDATE,'','USRCNFRM_00000000001');


-- 사용자별권한설정
insert into LETTNEMPLYRSCRTYESTBS(SCRTY_DTRMN_TRGET_ID,MBER_TY_CODE,AUTHOR_CODE) values ('USRCNFRM_00000000000','GNR','ROLE_ADMIN');
insert into LETTNEMPLYRSCRTYESTBS(SCRTY_DTRMN_TRGET_ID,MBER_TY_CODE,AUTHOR_CODE) values ('USRCNFRM_00000000001','GNR','ROLE_USER_MEMBER');


-- 게시판템플릿
insert into LETTNTMPLATINFO(TMPLAT_ID,TMPLAT_NM,TMPLAT_COURS,USE_AT,TMPLAT_SE_CODE,FRST_REGISTER_ID,FRST_REGIST_PNTTM,LAST_UPDUSR_ID,LAST_UPDT_PNTTM) values ('TMPLAT_BOARD_DEFAULT','게시판 기본템플릿','/css/egovframework/cop/bbs/egovbbsTemplate.css','Y','TMPT01','USRCNFRM_00000000000',SYSDATE,'USRCNFRM_00000000000',SYSDATE);


-- 게시판마스터
insert into LETTNBBSMASTER(BBS_ID,BBS_NM,BBS_INTRCN,BBS_TY_CODE,BBS_ATTRB_CODE,REPLY_POSBL_AT,FILE_ATCH_POSBL_AT,ATCH_POSBL_FILE_NUMBER,ATCH_POSBL_FILE_SIZE,USE_AT,TMPLAT_ID,FRST_REGISTER_ID,FRST_REGIST_PNTTM,LAST_UPDUSR_ID,LAST_UPDT_PNTTM) values ('BBSMSTR_AAAAAAAAAAAA','공지사항','공지사항게시판','BBST03','BBSA03','Y','Y',2,5242880,'Y','TMPLAT_BOARD_DEFAULT','USRCNFRM_00000000000',SYSDATE,'USRCNFRM_00000000000',SYSDATE);
insert into LETTNBBSMASTER(BBS_ID,BBS_NM,BBS_INTRCN,BBS_TY_CODE,BBS_ATTRB_CODE,REPLY_POSBL_AT,FILE_ATCH_POSBL_AT,ATCH_POSBL_FILE_NUMBER,ATCH_POSBL_FILE_SIZE,USE_AT,TMPLAT_ID,FRST_REGISTER_ID,FRST_REGIST_PNTTM,LAST_UPDUSR_ID,LAST_UPDT_PNTTM) values ('BBSMSTR_BBBBBBBBBBBB','자유게시판','자유게시판(갤러리 게시판)','BBST01','BBSA02','Y','Y',2,5242880,'Y','TMPLAT_BOARD_DEFAULT','USRCNFRM_00000000000',SYSDATE,'USRCNFRM_00000000000',SYSDATE);
insert into LETTNBBSMASTER(BBS_ID,BBS_NM,BBS_INTRCN,BBS_TY_CODE,BBS_ATTRB_CODE,REPLY_POSBL_AT,FILE_ATCH_POSBL_AT,ATCH_POSBL_FILE_NUMBER,ATCH_POSBL_FILE_SIZE,USE_AT,TMPLAT_ID,FRST_REGISTER_ID,FRST_REGIST_PNTTM,LAST_UPDUSR_ID,LAST_UPDT_PNTTM) values ('BBSMSTR_CCCCCCCCCCCC','자료실','자료실게시판','BBST01','BBSA03','Y','Y',2,5242880,'Y','TMPLAT_BOARD_DEFAULT','USRCNFRM_00000000000',SYSDATE,'USRCNFRM_00000000000',SYSDATE);


-- 게시판사용
insert into LETTNBBSUSE(BBS_ID,TRGET_ID,USE_AT,REGIST_SE_CODE,FRST_REGIST_PNTTM,FRST_REGISTER_ID,LAST_UPDT_PNTTM,LAST_UPDUSR_ID) values ('BBSMSTR_AAAAAAAAAAAA','SYSTEM_DEFAULT_BOARD','Y','REGC01',SYSDATE,'USRCNFRM_00000000000',SYSDATE,'USRCNFRM_00000000000');
insert into LETTNBBSUSE(BBS_ID,TRGET_ID,USE_AT,REGIST_SE_CODE,FRST_REGIST_PNTTM,FRST_REGISTER_ID,LAST_UPDT_PNTTM,LAST_UPDUSR_ID) values ('BBSMSTR_BBBBBBBBBBBB','SYSTEM_DEFAULT_BOARD','Y','REGC01',SYSDATE,'USRCNFRM_00000000000',SYSDATE,'USRCNFRM_00000000000');
insert into LETTNBBSUSE(BBS_ID,TRGET_ID,USE_AT,REGIST_SE_CODE,FRST_REGIST_PNTTM,FRST_REGISTER_ID,LAST_UPDT_PNTTM,LAST_UPDUSR_ID) values ('BBSMSTR_CCCCCCCCCCCC','SYSTEM_DEFAULT_BOARD','Y','REGC01',SYSDATE,'USRCNFRM_00000000000',SYSDATE,'USRCNFRM_00000000000');


-- 프로그램목록
insert into LETTNPROGRMLIST(PROGRM_FILE_NM,PROGRM_STRE_PATH,PROGRM_KOREAN_NM,PROGRM_DC,URL) values ('dir','/','디렉토리','디렉토리','/');
insert into LETTNPROGRMLIST(PROGRM_FILE_NM,PROGRM_STRE_PATH,PROGRM_KOREAN_NM,PROGRM_DC,URL) values ('EgovAuthorGroupManage','/sec/rgm/','권한그룹관리','권한그룹관리','/sec/rgm/EgovAuthorGroupInsert.do');
insert into LETTNPROGRMLIST(PROGRM_FILE_NM,PROGRM_STRE_PATH,PROGRM_KOREAN_NM,PROGRM_DC,URL) values ('EgovAuthorInsert','/sec/ram/','권한등록','권한등록','/sec/ram/EgovAuthorInsertView.do');
insert into LETTNPROGRMLIST(PROGRM_FILE_NM,PROGRM_STRE_PATH,PROGRM_KOREAN_NM,PROGRM_DC,URL) values ('EgovAuthorManage','/sec/ram/','권한관리','권한관리','/sec/ram/EgovAuthorList.do');
insert into LETTNPROGRMLIST(PROGRM_FILE_NM,PROGRM_STRE_PATH,PROGRM_KOREAN_NM,PROGRM_DC,URL) values ('EgovAuthorRoleManage','/sec/ram/','권한 롤 관리','권한 롤 관리','/sec/rgm/EgovAuthorGroupListView.do');
insert into LETTNPROGRMLIST(PROGRM_FILE_NM,PROGRM_STRE_PATH,PROGRM_KOREAN_NM,PROGRM_DC,URL) values ('EgovAuthorUpdt','/sec/ram/','권한수정','권한수정','/sec/ram/EgovAuthor.do');
insert into LETTNPROGRMLIST(PROGRM_FILE_NM,PROGRM_STRE_PATH,PROGRM_KOREAN_NM,PROGRM_DC,URL) values ('EgovBannerList','/uss/ion/bnr/','배너관리','배너관리','/uss/ion/bnr/selectBannerList.do');
insert into LETTNPROGRMLIST(PROGRM_FILE_NM,PROGRM_STRE_PATH,PROGRM_KOREAN_NM,PROGRM_DC,URL) values ('EgovBannerRegist','/uss/ion/bnr/','배너등록','배너등록','/uss/ion/bnr/addViewBanner.do');
insert into LETTNPROGRMLIST(PROGRM_FILE_NM,PROGRM_STRE_PATH,PROGRM_KOREAN_NM,PROGRM_DC,URL) values ('EgovBannerUpdt','/uss/ion/bnr/','배너수정','배너수정','/uss/ion/bnr/updtBanner.do');
insert into LETTNPROGRMLIST(PROGRM_FILE_NM,PROGRM_STRE_PATH,PROGRM_KOREAN_NM,PROGRM_DC,URL) values ('EgovBoardMstrList','/cop/bbs/','게시판 목록조회','게시판 목록조회','/cop/bbs/SelectBBSMasterInfs.do');
insert into LETTNPROGRMLIST(PROGRM_FILE_NM,PROGRM_STRE_PATH,PROGRM_KOREAN_NM,PROGRM_DC,URL) values ('EgovBoardMstrRegist','/cop/bbs/','게시판 생성','게시판 생성','/cop/bbs/addBBSMaster.do');
insert into LETTNPROGRMLIST(PROGRM_FILE_NM,PROGRM_STRE_PATH,PROGRM_KOREAN_NM,PROGRM_DC,URL) values ('EgovBoardMstrUpdt','/cop/bbs/','게시판 수정','게시판 수정','/cop/bbs/SelectBBSMasterInf.do');
insert into LETTNPROGRMLIST(PROGRM_FILE_NM,PROGRM_STRE_PATH,PROGRM_KOREAN_NM,PROGRM_DC,URL) values ('EgovBoardUseInfInqire','/cop/com/','게시판사용여부 상세조회','게시판사용여부 상세조회','/cop/com/selectBBSUseInf.do');
insert into LETTNPROGRMLIST(PROGRM_FILE_NM,PROGRM_STRE_PATH,PROGRM_KOREAN_NM,PROGRM_DC,URL) values ('EgovBoardUseInfList','/cop/com/','게시판사용여부 목록 조회','게시판사용여부 목록 조회','/cop/com/selectBBSUseInfs.do');
insert into LETTNPROGRMLIST(PROGRM_FILE_NM,PROGRM_STRE_PATH,PROGRM_KOREAN_NM,PROGRM_DC,URL) values ('EgovBoardUseInfRegist','/cop/com/','게시판사용여부 등록','게시판사용여부 등록','/cop/com/addBBSUseInf.do');
insert into LETTNPROGRMLIST(PROGRM_FILE_NM,PROGRM_STRE_PATH,PROGRM_KOREAN_NM,PROGRM_DC,URL) values ('EgovEgovMinwonRequest','/','민원신청','민원신청','/EgovPageLink.do?link=main/sample_menu/EgovServiceManage');
insert into LETTNPROGRMLIST(PROGRM_FILE_NM,PROGRM_STRE_PATH,PROGRM_KOREAN_NM,PROGRM_DC,URL) values ('EgovEgovMinwonResult','/','민원결과확인','민원결과확인','/EgovPageLink.do?link=main/sample_menu/EgovServiceResult');
insert into LETTNPROGRMLIST(PROGRM_FILE_NM,PROGRM_STRE_PATH,PROGRM_KOREAN_NM,PROGRM_DC,URL) values ('EgovFaqCnRegist','/uss/olh/faq/','FAQ내용등록','FAQ내용등록','/uss/olh/faq/FaqCnRegistView.do');
insert into LETTNPROGRMLIST(PROGRM_FILE_NM,PROGRM_STRE_PATH,PROGRM_KOREAN_NM,PROGRM_DC,URL) values ('EgovFaqCnUpdt','/uss/olh/faq/','FAQ내용수정','FAQ내용수정','/uss/olh/faq/FaqCnUpdtView.do');
insert into LETTNPROGRMLIST(PROGRM_FILE_NM,PROGRM_STRE_PATH,PROGRM_KOREAN_NM,PROGRM_DC,URL) values ('EgovFaqDetailInqire','/uss/olh/faq/','FAQ상세조회','FAQ상세조회','/uss/olh/faq/FaqInqireCoUpdt.do');
insert into LETTNPROGRMLIST(PROGRM_FILE_NM,PROGRM_STRE_PATH,PROGRM_KOREAN_NM,PROGRM_DC,URL) values ('EgovFaqListInqire','/uss/olh/faq/','FAQ목록조회','FAQ목록조회','/uss/olh/faq/FaqListInqire.do');
insert into LETTNPROGRMLIST(PROGRM_FILE_NM,PROGRM_STRE_PATH,PROGRM_KOREAN_NM,PROGRM_DC,URL) values ('EgovGroupInsert','/sec/gmt/','그룹등록','그룹등록','/sec/gmt/EgovGroupInsertView.do');
insert into LETTNPROGRMLIST(PROGRM_FILE_NM,PROGRM_STRE_PATH,PROGRM_KOREAN_NM,PROGRM_DC,URL) values ('EgovGroupManage','/sec/gmt/','그룹관리','그룹관리','/sec/gmt/EgovGroupList.do');
insert into LETTNPROGRMLIST(PROGRM_FILE_NM,PROGRM_STRE_PATH,PROGRM_KOREAN_NM,PROGRM_DC,URL) values ('EgovGroupUpdt','/sec/gmt/','그룹수정','그룹수정','/sec/gmt/EgovGroup.do');
insert into LETTNPROGRMLIST(PROGRM_FILE_NM,PROGRM_STRE_PATH,PROGRM_KOREAN_NM,PROGRM_DC,URL) values ('EgovIdDplctCnfirm','/cmm/uss/umt/','아이디중복확인','아이디중복확인','/cmm/uss/umt/EgovIdDplctCnfirm.do');
insert into LETTNPROGRMLIST(PROGRM_FILE_NM,PROGRM_STRE_PATH,PROGRM_KOREAN_NM,PROGRM_DC,URL) values ('EgovIndvdlInfoPolicyDetail','/uss/sam/ipm/','개인정보보호정책 상세조회','개인정보보호정책 상세조회','/uss/sam/ipm/detailIndvdlInfoPolicy.do');
insert into LETTNPROGRMLIST(PROGRM_FILE_NM,PROGRM_STRE_PATH,PROGRM_KOREAN_NM,PROGRM_DC,URL) values ('EgovIndvdlInfoPolicyList','/uss/sam/ipm/','개인정보보호정책 목록조회','개인정보보호정책 목록조회','/uss/sam/ipm/listIndvdlInfoPolicy.do');
insert into LETTNPROGRMLIST(PROGRM_FILE_NM,PROGRM_STRE_PATH,PROGRM_KOREAN_NM,PROGRM_DC,URL) values ('EgovIndvdlInfoPolicyRegist','/uss/sam/ipm/','개인정보보호정책 등록','개인정보보호정책 등록','/uss/sam/ipm/registIndvdlInfoPolicy.do');
insert into LETTNPROGRMLIST(PROGRM_FILE_NM,PROGRM_STRE_PATH,PROGRM_KOREAN_NM,PROGRM_DC,URL) values ('EgovIndvdlInfoPolicyUpdt','/uss/sam/ipm/','개인정보보호정책 수정','개인정보보호정책 수정','/uss/sam/ipm/updtIndvdlInfoPolicy.do');
insert into LETTNPROGRMLIST(PROGRM_FILE_NM,PROGRM_STRE_PATH,PROGRM_KOREAN_NM,PROGRM_DC,URL) values ('EgovInfoFree','/cop/bbs/','자유게시판','자유게시판','/cop/bbs/selectBoardList.do?bbsId=BBSMSTR_BBBBBBBBBBBB');
insert into LETTNPROGRMLIST(PROGRM_FILE_NM,PROGRM_STRE_PATH,PROGRM_KOREAN_NM,PROGRM_DC,URL) values ('EgovInfoFreeAdmin','/cop/bbs/','자유게시판','자유게시판','/cop/bbs/selectBoardList.do?bbsId=BBSMSTR_BBBBBBBBBBBB');
insert into LETTNPROGRMLIST(PROGRM_FILE_NM,PROGRM_STRE_PATH,PROGRM_KOREAN_NM,PROGRM_DC,URL) values ('EgovInfoNotice','/cop/bbs/','공지사항','공지사항','/cop/bbs/selectBoardList.do?bbsId=BBSMSTR_AAAAAAAAAAAA');
insert into LETTNPROGRMLIST(PROGRM_FILE_NM,PROGRM_STRE_PATH,PROGRM_KOREAN_NM,PROGRM_DC,URL) values ('EgovInfoNoticeAdmin','/cop/bbs/','공지사항','공지사항','/cop/bbs/selectBoardList.do?bbsId=BBSMSTR_AAAAAAAAAAAA');
insert into LETTNPROGRMLIST(PROGRM_FILE_NM,PROGRM_STRE_PATH,PROGRM_KOREAN_NM,PROGRM_DC,URL) values ('EgovLoginUsr','/uat/uia/','포털사이트 로그인','포털사이트 로그인','/uat/uia/egovLoginUsr.do');
insert into LETTNPROGRMLIST(PROGRM_FILE_NM,PROGRM_STRE_PATH,PROGRM_KOREAN_NM,PROGRM_DC,URL) values ('EgovMainHome','uat/uia/','포털사이트 메인','포털사이트 메인','/uat/uia/actionMain.do');
insert into LETTNPROGRMLIST(PROGRM_FILE_NM,PROGRM_STRE_PATH,PROGRM_KOREAN_NM,PROGRM_DC,URL) values ('EgovMberInsert','/uss/umt/mber/','일반회원등록','일반회원등록','/uss/umt/mber/EgovMberInsertView.do');
insert into LETTNPROGRMLIST(PROGRM_FILE_NM,PROGRM_STRE_PATH,PROGRM_KOREAN_NM,PROGRM_DC,URL) values ('EgovMberManage','/uss/umt/mber/','일반회원관리(조회,삭제)','일반회원관리(조회,삭제)','/uss/umt/mber/EgovMberManage.do');
insert into LETTNPROGRMLIST(PROGRM_FILE_NM,PROGRM_STRE_PATH,PROGRM_KOREAN_NM,PROGRM_DC,URL) values ('EgovMberPasswordUpdt','/uss/umt/mber/','일반회원암호수정','일반회원암호수정','/uss/umt/mber/EgovMberPasswordUpdtView.do');
insert into LETTNPROGRMLIST(PROGRM_FILE_NM,PROGRM_STRE_PATH,PROGRM_KOREAN_NM,PROGRM_DC,URL) values ('EgovMberSbscrb','/uss/umt/cmm/','일반회원가입신청','일반회원가입신청','/uss/umt/cmm/EgovMberSbscrbView.do');
insert into LETTNPROGRMLIST(PROGRM_FILE_NM,PROGRM_STRE_PATH,PROGRM_KOREAN_NM,PROGRM_DC,URL) values ('EgovMberSelectUpdt','/uss/umt/mber/','일반회원상세조회,수정','일반회원상세조회,수정','/uss/umt/mber/EgovMberSelectUpdtView.do');
insert into LETTNPROGRMLIST(PROGRM_FILE_NM,PROGRM_STRE_PATH,PROGRM_KOREAN_NM,PROGRM_DC,URL) values ('EgovNoticeInqire','/cop/bbs/','게시물조회','게시물조회','/cop/bbs/selectBoardArticle.do');
insert into LETTNPROGRMLIST(PROGRM_FILE_NM,PROGRM_STRE_PATH,PROGRM_KOREAN_NM,PROGRM_DC,URL) values ('EgovNoticeList','/cop/bbs/','게시물 목록','게시물 목록','/cop/bbs/selectBoardList.do');
insert into LETTNPROGRMLIST(PROGRM_FILE_NM,PROGRM_STRE_PATH,PROGRM_KOREAN_NM,PROGRM_DC,URL) values ('EgovNoticeRegist','/cop/bbs/','게시물 등록','게시물 등록','/cop/bbs/addBoardArticle.do');
insert into LETTNPROGRMLIST(PROGRM_FILE_NM,PROGRM_STRE_PATH,PROGRM_KOREAN_NM,PROGRM_DC,URL) values ('EgovNoticeReply','/cop/bbs/','답글 작성','답글 작성','/cop/bbs/addReplyBoardArticle.do');
insert into LETTNPROGRMLIST(PROGRM_FILE_NM,PROGRM_STRE_PATH,PROGRM_KOREAN_NM,PROGRM_DC,URL) values ('EgovNoticeUpdt','/cop/bbs/','게시물 수정','게시물 수정','/cop/bbs/forUpdateBoardArticle.do');
insert into LETTNPROGRMLIST(PROGRM_FILE_NM,PROGRM_STRE_PATH,PROGRM_KOREAN_NM,PROGRM_DC,URL) values ('EgovQnaAnswerDetailInqire','/uss/olh/qnm/','QnA답변상세조회','QnA답변상세조회','/uss/olh/qnm/QnaAnswerDetailInqire.do');
insert into LETTNPROGRMLIST(PROGRM_FILE_NM,PROGRM_STRE_PATH,PROGRM_KOREAN_NM,PROGRM_DC,URL) values ('EgovQnaAnswerListInqire','/uss/olh/qnm/','QnA답변목록조회','QnA답변목록조회','/uss/olh/qnm/QnaAnswerListInqire.do');
insert into LETTNPROGRMLIST(PROGRM_FILE_NM,PROGRM_STRE_PATH,PROGRM_KOREAN_NM,PROGRM_DC,URL) values ('EgovQnaCnAnswerUpdt','/uss/olh/qnm/','QnA내용답변수정','QnA내용답변수정','/uss/olh/qnm/QnaCnAnswerUpdtView.do');
insert into LETTNPROGRMLIST(PROGRM_FILE_NM,PROGRM_STRE_PATH,PROGRM_KOREAN_NM,PROGRM_DC,URL) values ('EgovQnaCnRegist','/uss/olh/qna/','QnA내용등록','QnA내용등록','/uss/olh/qna/QnaCnRegistView.do');
insert into LETTNPROGRMLIST(PROGRM_FILE_NM,PROGRM_STRE_PATH,PROGRM_KOREAN_NM,PROGRM_DC,URL) values ('EgovQnaCnUpdt','/uss/olh/qna/','QnA내용수정','QnA내용수정','/uss/olh/qna/QnaInqireCoUpdt.do');
insert into LETTNPROGRMLIST(PROGRM_FILE_NM,PROGRM_STRE_PATH,PROGRM_KOREAN_NM,PROGRM_DC,URL) values ('EgovQnaDetailInqire','/uss/olh/qna/','QnA상세조회','QnA상세조회','/uss/olh/qna/QnaInqireCoUpdt.do');
insert into LETTNPROGRMLIST(PROGRM_FILE_NM,PROGRM_STRE_PATH,PROGRM_KOREAN_NM,PROGRM_DC,URL) values ('EgovQnaListInqire','/uss/olh/qna/','QnA목록조회','QnA목록조회','/uss/olh/qna/QnaListInqire.do');
insert into LETTNPROGRMLIST(PROGRM_FILE_NM,PROGRM_STRE_PATH,PROGRM_KOREAN_NM,PROGRM_DC,URL) values ('EgovQnaPasswordConfirm','/uss/olh/qna/','QnA작성비밀번호 확인','QnA작성비밀번호 확인','/uss/olh/qna/EgovQnaPasswordConfirm.do');
insert into LETTNPROGRMLIST(PROGRM_FILE_NM,PROGRM_STRE_PATH,PROGRM_KOREAN_NM,PROGRM_DC,URL) values ('EgovQustnrItemManageDetail','/uss/olp/qim/','항목관리상세조회','항목관리상세조회','/uss/olp/qim/EgovQustnrItemManageDetail.do');
insert into LETTNPROGRMLIST(PROGRM_FILE_NM,PROGRM_STRE_PATH,PROGRM_KOREAN_NM,PROGRM_DC,URL) values ('EgovQustnrItemManageList','/uss/olp/qim/','항목관리목록','항목관리목록','/uss/olp/qim/EgovQustnrItemManageList.do');
insert into LETTNPROGRMLIST(PROGRM_FILE_NM,PROGRM_STRE_PATH,PROGRM_KOREAN_NM,PROGRM_DC,URL) values ('EgovQustnrItemManageModify','/uss/olp/qim/','항목관리수정','항목관리수정','/uss/olp/qim/EgovQustnrItemManageModify.do');
insert into LETTNPROGRMLIST(PROGRM_FILE_NM,PROGRM_STRE_PATH,PROGRM_KOREAN_NM,PROGRM_DC,URL) values ('EgovQustnrItemManageRegist','/uss/olp/qim/','항목관리등록','항목관리등록','/uss/olp/qim/EgovQustnrItemManageRegist.do');
insert into LETTNPROGRMLIST(PROGRM_FILE_NM,PROGRM_STRE_PATH,PROGRM_KOREAN_NM,PROGRM_DC,URL) values ('EgovQustnrManageDetail','/uss/olp/qmc/','설문관리상세조회','설문관리상세조회','/uss/olp/qmc/EgovQustnrManageDetail.do');
insert into LETTNPROGRMLIST(PROGRM_FILE_NM,PROGRM_STRE_PATH,PROGRM_KOREAN_NM,PROGRM_DC,URL) values ('EgovQustnrManageList','/uss/olp/qmc/','설문관리목록조회','설문관리목록조회','/uss/olp/qmc/EgovQustnrManageList.do');
insert into LETTNPROGRMLIST(PROGRM_FILE_NM,PROGRM_STRE_PATH,PROGRM_KOREAN_NM,PROGRM_DC,URL) values ('EgovQustnrManageModify','/uss/olp/qmc/','설문관리수정','설문관리수정','/uss/olp/qmc/EgovQustnrManageModify.do');
insert into LETTNPROGRMLIST(PROGRM_FILE_NM,PROGRM_STRE_PATH,PROGRM_KOREAN_NM,PROGRM_DC,URL) values ('EgovQustnrManagePopupList','/uss/olp/qmc/','설문관리목록팝업','설문관리목록팝업','/uss/olp/qmc/EgovQustnrManageListPopup.do');
insert into LETTNPROGRMLIST(PROGRM_FILE_NM,PROGRM_STRE_PATH,PROGRM_KOREAN_NM,PROGRM_DC,URL) values ('EgovQustnrManageRegist','/uss/olp/qmc/','설문관리등록','설문관리등록','/uss/olp/qmc/EgovQustnrManageRegist.do');
insert into LETTNPROGRMLIST(PROGRM_FILE_NM,PROGRM_STRE_PATH,PROGRM_KOREAN_NM,PROGRM_DC,URL) values ('EgovQustnrQestnManageDetail','/uss/olp/qqm/','문항관리상세조회','문항관리상세조회','/uss/olp/qqm/EgovQustnrQestnManageDetail.do');
insert into LETTNPROGRMLIST(PROGRM_FILE_NM,PROGRM_STRE_PATH,PROGRM_KOREAN_NM,PROGRM_DC,URL) values ('EgovQustnrQestnManageList','/uss/olp/qqm/','문항관리 목록조회','문항관리 목록조회','/uss/olp/qqm/EgovQustnrQestnManageList.do');
insert into LETTNPROGRMLIST(PROGRM_FILE_NM,PROGRM_STRE_PATH,PROGRM_KOREAN_NM,PROGRM_DC,URL) values ('EgovQustnrQestnManageListPopup','/uss/olp/qqm/','문항관리 목록 팝업','문항관리 목록 팝업','/uss/olp/qqm/EgovQustnrQestnManageListPopup.do');
insert into LETTNPROGRMLIST(PROGRM_FILE_NM,PROGRM_STRE_PATH,PROGRM_KOREAN_NM,PROGRM_DC,URL) values ('EgovQustnrQestnManageModify','/uss/olp/qqm/','문항관리수정','문항관리수정','/uss/olp/qqm/EgovQustnrQestnManageModify.do');
insert into LETTNPROGRMLIST(PROGRM_FILE_NM,PROGRM_STRE_PATH,PROGRM_KOREAN_NM,PROGRM_DC,URL) values ('EgovQustnrQestnManageRegist','/uss/olp/qqm/','문항관리등록','문항관리등록','/uss/olp/qqm/EgovQustnrQestnManageRegist.do');
insert into LETTNPROGRMLIST(PROGRM_FILE_NM,PROGRM_STRE_PATH,PROGRM_KOREAN_NM,PROGRM_DC,URL) values ('EgovQustnrQestnManageStatistics','/uss/olp/qqm/','문항관리통계','문항관리통계','/uss/olp/qqm/EgovQustnrQestnManageStatistics.do');
insert into LETTNPROGRMLIST(PROGRM_FILE_NM,PROGRM_STRE_PATH,PROGRM_KOREAN_NM,PROGRM_DC,URL) values ('EgovQustnrRespondInfoDetail','/uss/olp/qri/','설문조사상세조회','설문조사상세조회','/uss/olp/qri/EgovQustnrRespondInfoDetail.do');
insert into LETTNPROGRMLIST(PROGRM_FILE_NM,PROGRM_STRE_PATH,PROGRM_KOREAN_NM,PROGRM_DC,URL) values ('EgovQustnrRespondInfoList','/uss/olp/qri/','설문조사 목록조회','설문조사 목록조회','/uss/olp/qri/EgovQustnrRespondInfoList.do');
insert into LETTNPROGRMLIST(PROGRM_FILE_NM,PROGRM_STRE_PATH,PROGRM_KOREAN_NM,PROGRM_DC,URL) values ('EgovQustnrRespondInfoManageList','/uss/olp/qnn/','설문참여목록조회','설문참여목록조회','/uss/olp/qnn/EgovQustnrRespondInfoManageList.do');
insert into LETTNPROGRMLIST(PROGRM_FILE_NM,PROGRM_STRE_PATH,PROGRM_KOREAN_NM,PROGRM_DC,URL) values ('EgovQustnrRespondInfoManageRegist','/uss/olp/qnn/','설문참여등록','설문참여등록','/uss/olp/qnn/EgovQustnrRespondInfoManageRegist.do');
insert into LETTNPROGRMLIST(PROGRM_FILE_NM,PROGRM_STRE_PATH,PROGRM_KOREAN_NM,PROGRM_DC,URL) values ('EgovQustnrRespondInfoManageStatistics','/uss/olp/qqm/','설문통계','설문통계','/uss/olp/qqm/EgovQustnrQestnManageStatistics.do');
insert into LETTNPROGRMLIST(PROGRM_FILE_NM,PROGRM_STRE_PATH,PROGRM_KOREAN_NM,PROGRM_DC,URL) values ('EgovQustnrRespondInfoModify','/uss/olp/qri/','설문조사수정','설문조사수정','/uss/olp/qri/EgovQustnrRespondInfoModify.do');
insert into LETTNPROGRMLIST(PROGRM_FILE_NM,PROGRM_STRE_PATH,PROGRM_KOREAN_NM,PROGRM_DC,URL) values ('EgovQustnrRespondInfoRegist','/uss/olp/qri/','설문조사등록','설문조사등록','/uss/olp/qri/EgovQustnrRespondInfoRegist.do');
insert into LETTNPROGRMLIST(PROGRM_FILE_NM,PROGRM_STRE_PATH,PROGRM_KOREAN_NM,PROGRM_DC,URL) values ('EgovQustnrRespondManageDetail','/uss/olp/qrm/','응답자관리 상세조회','응답자관리 상세조회','/uss/olp/qrm/EgovQustnrRespondManageDetail.do');
insert into LETTNPROGRMLIST(PROGRM_FILE_NM,PROGRM_STRE_PATH,PROGRM_KOREAN_NM,PROGRM_DC,URL) values ('EgovQustnrRespondManageList','/uss/olp/qrm/','응답자관리 목록조회','응답자관리 목록조회','/uss/olp/qrm/EgovQustnrRespondManageList.do');
insert into LETTNPROGRMLIST(PROGRM_FILE_NM,PROGRM_STRE_PATH,PROGRM_KOREAN_NM,PROGRM_DC,URL) values ('EgovQustnrRespondManageModify','/uss/olp/qrm/','응답자관리 수정','응답자관리 수정','/uss/olp/qrm/EgovQustnrRespondManageModify.do');
insert into LETTNPROGRMLIST(PROGRM_FILE_NM,PROGRM_STRE_PATH,PROGRM_KOREAN_NM,PROGRM_DC,URL) values ('EgovQustnrRespondManageRegist','/uss/olp/qrm/','응답자관리 등록','응답자관리 등록','/uss/olp/qrm/EgovQustnrRespondManageRegist.do');
insert into LETTNPROGRMLIST(PROGRM_FILE_NM,PROGRM_STRE_PATH,PROGRM_KOREAN_NM,PROGRM_DC,URL) values ('EgovQustnrTmplatManageDetail','/uss/olp/qtm/','설문템플릿 상세조회','설문템플릿 상세조회','/uss/olp/qtm/EgovQustnrTmplatManageImg.do');
insert into LETTNPROGRMLIST(PROGRM_FILE_NM,PROGRM_STRE_PATH,PROGRM_KOREAN_NM,PROGRM_DC,URL) values ('EgovQustnrTmplatManageList','/uss/olp/qtm/','설문템플릿 목록조회','설문템플릿 목록조회','/uss/olp/qtm/EgovQustnrTmplatManageList.do');
insert into LETTNPROGRMLIST(PROGRM_FILE_NM,PROGRM_STRE_PATH,PROGRM_KOREAN_NM,PROGRM_DC,URL) values ('EgovQustnrTmplatManageModify','/uss/olp/qtm/','설문템플릿 수정','설문템플릿 수정','/uss/olp/qtm/EgovQustnrTmplatManageModify.do');
insert into LETTNPROGRMLIST(PROGRM_FILE_NM,PROGRM_STRE_PATH,PROGRM_KOREAN_NM,PROGRM_DC,URL) values ('EgovQustnrTmplatManageRegist','/uss/olp/qtm/','설문템플릿 등록','설문템플릿 등록','/uss/olp/qtm/EgovQustnrTmplatManageRegist.do');
insert into LETTNPROGRMLIST(PROGRM_FILE_NM,PROGRM_STRE_PATH,PROGRM_KOREAN_NM,PROGRM_DC,URL) values ('EgovRoleInsert','/sec/rmt/','롤등록','롤등록','/sec/rmt/EgovRoleInsertView.do');
insert into LETTNPROGRMLIST(PROGRM_FILE_NM,PROGRM_STRE_PATH,PROGRM_KOREAN_NM,PROGRM_DC,URL) values ('EgovRoleManage','/sec/rmt/','롤관리','롤관리','/sec/rmt/EgovRoleList.do');
insert into LETTNPROGRMLIST(PROGRM_FILE_NM,PROGRM_STRE_PATH,PROGRM_KOREAN_NM,PROGRM_DC,URL) values ('EgovRoleUpdt','/sec/rmt/','롤수정','롤수정','/sec/rmt/EgovRole.do');
insert into LETTNPROGRMLIST(PROGRM_FILE_NM,PROGRM_STRE_PATH,PROGRM_KOREAN_NM,PROGRM_DC,URL) values ('EgovSiteAddress','/','찾아오시는 길','찾아오시는 길','/EgovPageLink.do?link=main/sample_menu/EgovAboutSite');
insert into LETTNPROGRMLIST(PROGRM_FILE_NM,PROGRM_STRE_PATH,PROGRM_KOREAN_NM,PROGRM_DC,URL) values ('EgovSiteHistory','/','연혁','연혁','/EgovPageLink.do?link=main/sample_menu/EgovAboutSite');
insert into LETTNPROGRMLIST(PROGRM_FILE_NM,PROGRM_STRE_PATH,PROGRM_KOREAN_NM,PROGRM_DC,URL) values ('EgovSiteInfo','/','사이트 소개','사이트 소개','/EgovPageLink.do?link=main/sample_menu/EgovAboutSite');
insert into LETTNPROGRMLIST(PROGRM_FILE_NM,PROGRM_STRE_PATH,PROGRM_KOREAN_NM,PROGRM_DC,URL) values ('EgovSiteOrganization','/','조직소개','조직소개','/EgovPageLink.do?link=main/sample_menu/EgovAboutSite');
insert into LETTNPROGRMLIST(PROGRM_FILE_NM,PROGRM_STRE_PATH,PROGRM_KOREAN_NM,PROGRM_DC,URL) values ('EgovStplatCnRegist','/uss/sam/stp/','약관내용등록','약관내용등록','/uss/sam/stp/StplatCnRegistView.do');
insert into LETTNPROGRMLIST(PROGRM_FILE_NM,PROGRM_STRE_PATH,PROGRM_KOREAN_NM,PROGRM_DC,URL) values ('EgovStplatCnUpdt','/uss/sam/stp/','약관내용수정','약관내용수정','/uss/sam/stp/StplatCnUpdtView.do');
insert into LETTNPROGRMLIST(PROGRM_FILE_NM,PROGRM_STRE_PATH,PROGRM_KOREAN_NM,PROGRM_DC,URL) values ('EgovStplatDetailInqire','/uss/sam/stp/','약관상세조회','약관상세조회','/uss/sam/stp/StplatDetailInqire.do');
insert into LETTNPROGRMLIST(PROGRM_FILE_NM,PROGRM_STRE_PATH,PROGRM_KOREAN_NM,PROGRM_DC,URL) values ('EgovStplatListInqire','/uss/sam/stp/','약관목록조회','약관목록조회','/uss/sam/stp/StplatListInqire.do');
insert into LETTNPROGRMLIST(PROGRM_FILE_NM,PROGRM_STRE_PATH,PROGRM_KOREAN_NM,PROGRM_DC,URL) values ('EgovTemplateInqirePopup','/cop/com/','템플릿 조회팝업','템플릿 조회팝업','/cop/com/EgovTemplateInqirePopup.do');
insert into LETTNPROGRMLIST(PROGRM_FILE_NM,PROGRM_STRE_PATH,PROGRM_KOREAN_NM,PROGRM_DC,URL) values ('EgovTemplateList','/cop/com/','템플릿 목록 조회','템플릿 목록 조회','/cop/com/selectTemplateInfs.do');
insert into LETTNPROGRMLIST(PROGRM_FILE_NM,PROGRM_STRE_PATH,PROGRM_KOREAN_NM,PROGRM_DC,URL) values ('EgovTemplateRegist','/cop/com/','템플릿 등록','템플릿 등록','/cop/com/addTemplateInf.do');
insert into LETTNPROGRMLIST(PROGRM_FILE_NM,PROGRM_STRE_PATH,PROGRM_KOREAN_NM,PROGRM_DC,URL) values ('EgovTemplateUpdt','/cop/com/','템플릿 수정','템플릿 수정','/cop/com/selectTemplateInf.do');


-- 메뉴목록
insert into LETTNMENUINFO(MENU_NM,PROGRM_FILE_NM,MENU_NO,UPPER_MENU_NO,MENU_ORDR,MENU_DC,RELATE_IMAGE_PATH,RELATE_IMAGE_NM) values ('root','dir',0,0,1,'root','/','/');
insert into LETTNMENUINFO(MENU_NM,PROGRM_FILE_NM,MENU_NO,UPPER_MENU_NO,MENU_ORDR,MENU_DC,RELATE_IMAGE_PATH,RELATE_IMAGE_NM) values ('사이트소개','dir',1000000,0,1,'사이트소개','/','/');
insert into LETTNMENUINFO(MENU_NM,PROGRM_FILE_NM,MENU_NO,UPPER_MENU_NO,MENU_ORDR,MENU_DC,RELATE_IMAGE_PATH,RELATE_IMAGE_NM) values ('사이트 소개','EgovSiteInfo',1010000,1000000,1,'사이트 소개','/','/');
insert into LETTNMENUINFO(MENU_NM,PROGRM_FILE_NM,MENU_NO,UPPER_MENU_NO,MENU_ORDR,MENU_DC,RELATE_IMAGE_PATH,RELATE_IMAGE_NM) values ('연혁','EgovSiteHistory',1020000,1000000,2,'연혁','/','/');
insert into LETTNMENUINFO(MENU_NM,PROGRM_FILE_NM,MENU_NO,UPPER_MENU_NO,MENU_ORDR,MENU_DC,RELATE_IMAGE_PATH,RELATE_IMAGE_NM) values ('조직소개','EgovSiteOrganization',1030000,1000000,3,'조직소개','/','/');
insert into LETTNMENUINFO(MENU_NM,PROGRM_FILE_NM,MENU_NO,UPPER_MENU_NO,MENU_ORDR,MENU_DC,RELATE_IMAGE_PATH,RELATE_IMAGE_NM) values ('찾아오시는 길','EgovSiteAddress',1040000,1000000,4,'찾아오시는 길','/','/');
insert into LETTNMENUINFO(MENU_NM,PROGRM_FILE_NM,MENU_NO,UPPER_MENU_NO,MENU_ORDR,MENU_DC,RELATE_IMAGE_PATH,RELATE_IMAGE_NM) values ('민원광장','dir',2000000,0,2,'민원광장','/','/');
insert into LETTNMENUINFO(MENU_NM,PROGRM_FILE_NM,MENU_NO,UPPER_MENU_NO,MENU_ORDR,MENU_DC,RELATE_IMAGE_PATH,RELATE_IMAGE_NM) values ('민원신청','EgovEgovMinwonRequest',2010000,2000000,1,'민원신청','/','/');
insert into LETTNMENUINFO(MENU_NM,PROGRM_FILE_NM,MENU_NO,UPPER_MENU_NO,MENU_ORDR,MENU_DC,RELATE_IMAGE_PATH,RELATE_IMAGE_NM) values ('민원결과확인','EgovEgovMinwonResult',2020000,2000000,2,'민원결과확인','/','/');
insert into LETTNMENUINFO(MENU_NM,PROGRM_FILE_NM,MENU_NO,UPPER_MENU_NO,MENU_ORDR,MENU_DC,RELATE_IMAGE_PATH,RELATE_IMAGE_NM) values ('알림마당','dir',3000000,0,3,'알림마당','/','/');
insert into LETTNMENUINFO(MENU_NM,PROGRM_FILE_NM,MENU_NO,UPPER_MENU_NO,MENU_ORDR,MENU_DC,RELATE_IMAGE_PATH,RELATE_IMAGE_NM) values ('공지사항','EgovInfoNotice',3010000,3000000,1,'공지사항','/','/');
insert into LETTNMENUINFO(MENU_NM,PROGRM_FILE_NM,MENU_NO,UPPER_MENU_NO,MENU_ORDR,MENU_DC,RELATE_IMAGE_PATH,RELATE_IMAGE_NM) values ('자유게시판','EgovInfoFree',3040000,3000000,2,'자유게시판','/','/');
insert into LETTNMENUINFO(MENU_NM,PROGRM_FILE_NM,MENU_NO,UPPER_MENU_NO,MENU_ORDR,MENU_DC,RELATE_IMAGE_PATH,RELATE_IMAGE_NM) values ('정보마당','dir',4000000,0,4,'정보마당','/','/');
insert into LETTNMENUINFO(MENU_NM,PROGRM_FILE_NM,MENU_NO,UPPER_MENU_NO,MENU_ORDR,MENU_DC,RELATE_IMAGE_PATH,RELATE_IMAGE_NM) values ('FAQ','EgovFaqListInqire',4010000,4000000,1,'FAQ','/','/');
insert into LETTNMENUINFO(MENU_NM,PROGRM_FILE_NM,MENU_NO,UPPER_MENU_NO,MENU_ORDR,MENU_DC,RELATE_IMAGE_PATH,RELATE_IMAGE_NM) values ('QnA','EgovQnaListInqire',4020000,4000000,2,'QnA','/','/');
insert into LETTNMENUINFO(MENU_NM,PROGRM_FILE_NM,MENU_NO,UPPER_MENU_NO,MENU_ORDR,MENU_DC,RELATE_IMAGE_PATH,RELATE_IMAGE_NM) values ('설문조사','EgovQustnrRespondInfoManageList',4030000,4000000,3,'설문조사','/','/');
insert into LETTNMENUINFO(MENU_NM,PROGRM_FILE_NM,MENU_NO,UPPER_MENU_NO,MENU_ORDR,MENU_DC,RELATE_IMAGE_PATH,RELATE_IMAGE_NM) values ('포털서비스관리','dir',5000000,0,5,'포털서비스관리','/','/');
insert into LETTNMENUINFO(MENU_NM,PROGRM_FILE_NM,MENU_NO,UPPER_MENU_NO,MENU_ORDR,MENU_DC,RELATE_IMAGE_PATH,RELATE_IMAGE_NM) values ('설문관리','dir',5010000,5000000,1,'설문관리','/','/');
insert into LETTNMENUINFO(MENU_NM,PROGRM_FILE_NM,MENU_NO,UPPER_MENU_NO,MENU_ORDR,MENU_DC,RELATE_IMAGE_PATH,RELATE_IMAGE_NM) values ('설문템플릿','EgovQustnrTmplatManageList',5010100,5010000,2,'설문템플릿','/','/');
insert into LETTNMENUINFO(MENU_NM,PROGRM_FILE_NM,MENU_NO,UPPER_MENU_NO,MENU_ORDR,MENU_DC,RELATE_IMAGE_PATH,RELATE_IMAGE_NM) values ('설문지','EgovQustnrManageList',5010200,5010000,1,'설문지','/','/');
insert into LETTNMENUINFO(MENU_NM,PROGRM_FILE_NM,MENU_NO,UPPER_MENU_NO,MENU_ORDR,MENU_DC,RELATE_IMAGE_PATH,RELATE_IMAGE_NM) values ('설문문항','EgovQustnrQestnManageList',5010300,5010000,3,'설문문항','/','/');
insert into LETTNMENUINFO(MENU_NM,PROGRM_FILE_NM,MENU_NO,UPPER_MENU_NO,MENU_ORDR,MENU_DC,RELATE_IMAGE_PATH,RELATE_IMAGE_NM) values ('설문항목','EgovQustnrItemManageList',5010400,5010000,4,'설문항목','/','/');
insert into LETTNMENUINFO(MENU_NM,PROGRM_FILE_NM,MENU_NO,UPPER_MENU_NO,MENU_ORDR,MENU_DC,RELATE_IMAGE_PATH,RELATE_IMAGE_NM) values ('설문응답결과','EgovQustnrRespondManageList',5010500,5010000,5,'설문응답결과','/','/');
insert into LETTNMENUINFO(MENU_NM,PROGRM_FILE_NM,MENU_NO,UPPER_MENU_NO,MENU_ORDR,MENU_DC,RELATE_IMAGE_PATH,RELATE_IMAGE_NM) values ('서비스관리','dir',5020000,5000000,2,'포털서비스관리','/','/');
insert into LETTNMENUINFO(MENU_NM,PROGRM_FILE_NM,MENU_NO,UPPER_MENU_NO,MENU_ORDR,MENU_DC,RELATE_IMAGE_PATH,RELATE_IMAGE_NM) values ('FAQ관리','EgovFaqListInqire',5020100,5020000,1,'FAQ관리','/','/');
insert into LETTNMENUINFO(MENU_NM,PROGRM_FILE_NM,MENU_NO,UPPER_MENU_NO,MENU_ORDR,MENU_DC,RELATE_IMAGE_PATH,RELATE_IMAGE_NM) values ('QnA관리','EgovQnaListInqire',5020200,5020000,2,'QnA관리','/','/');
insert into LETTNMENUINFO(MENU_NM,PROGRM_FILE_NM,MENU_NO,UPPER_MENU_NO,MENU_ORDR,MENU_DC,RELATE_IMAGE_PATH,RELATE_IMAGE_NM) values ('QnA답변관리','EgovQnaAnswerListInqire',5020300,5020000,3,'QnA답변관리','/','/');
insert into LETTNMENUINFO(MENU_NM,PROGRM_FILE_NM,MENU_NO,UPPER_MENU_NO,MENU_ORDR,MENU_DC,RELATE_IMAGE_PATH,RELATE_IMAGE_NM) values ('게시판템플릿관리','EgovTemplateList',5020400,5020000,4,'게시판템플릿관리','/','/');
insert into LETTNMENUINFO(MENU_NM,PROGRM_FILE_NM,MENU_NO,UPPER_MENU_NO,MENU_ORDR,MENU_DC,RELATE_IMAGE_PATH,RELATE_IMAGE_NM) values ('게시판생성관리','EgovBoardMstrList',5020500,5020000,5,'게시판생성관리','/','/');
insert into LETTNMENUINFO(MENU_NM,PROGRM_FILE_NM,MENU_NO,UPPER_MENU_NO,MENU_ORDR,MENU_DC,RELATE_IMAGE_PATH,RELATE_IMAGE_NM) values ('게시판사용관리','EgovBoardUseInfList',5020600,5020000,6,'게시판사용관리','/','/');
insert into LETTNMENUINFO(MENU_NM,PROGRM_FILE_NM,MENU_NO,UPPER_MENU_NO,MENU_ORDR,MENU_DC,RELATE_IMAGE_PATH,RELATE_IMAGE_NM) values ('공지사항관리','EgovInfoNoticeAdmin',5020700,5020000,7,'공지사항관리','/','/');
insert into LETTNMENUINFO(MENU_NM,PROGRM_FILE_NM,MENU_NO,UPPER_MENU_NO,MENU_ORDR,MENU_DC,RELATE_IMAGE_PATH,RELATE_IMAGE_NM) values ('자유게시판관리','EgovInfoFreeAdmin',5020800,5020000,8,'자유게시판관리','/','/');
insert into LETTNMENUINFO(MENU_NM,PROGRM_FILE_NM,MENU_NO,UPPER_MENU_NO,MENU_ORDR,MENU_DC,RELATE_IMAGE_PATH,RELATE_IMAGE_NM) values ('배너관리','EgovBannerList',5020900,5020000,9,'배너관리','/','/');
insert into LETTNMENUINFO(MENU_NM,PROGRM_FILE_NM,MENU_NO,UPPER_MENU_NO,MENU_ORDR,MENU_DC,RELATE_IMAGE_PATH,RELATE_IMAGE_NM) values ('포털시스템관리','dir',6000000,0,6,'포털시스템관리','/','/');
insert into LETTNMENUINFO(MENU_NM,PROGRM_FILE_NM,MENU_NO,UPPER_MENU_NO,MENU_ORDR,MENU_DC,RELATE_IMAGE_PATH,RELATE_IMAGE_NM) values ('사용자관리','dir',6010000,6000000,1,'사용자관리','/','/');
insert into LETTNMENUINFO(MENU_NM,PROGRM_FILE_NM,MENU_NO,UPPER_MENU_NO,MENU_ORDR,MENU_DC,RELATE_IMAGE_PATH,RELATE_IMAGE_NM) values ('회원관리','EgovMberManage',6010100,6010000,1,'회원관리','/','/');
insert into LETTNMENUINFO(MENU_NM,PROGRM_FILE_NM,MENU_NO,UPPER_MENU_NO,MENU_ORDR,MENU_DC,RELATE_IMAGE_PATH,RELATE_IMAGE_NM) values ('이용약관관리','EgovStplatListInqire',6010200,6010000,2,'이용약관관리','/','/');
insert into LETTNMENUINFO(MENU_NM,PROGRM_FILE_NM,MENU_NO,UPPER_MENU_NO,MENU_ORDR,MENU_DC,RELATE_IMAGE_PATH,RELATE_IMAGE_NM) values ('개인정보보호관리','EgovIndvdlInfoPolicyList',6010300,6010000,3,'개인정보보호관리','/','/');
insert into LETTNMENUINFO(MENU_NM,PROGRM_FILE_NM,MENU_NO,UPPER_MENU_NO,MENU_ORDR,MENU_DC,RELATE_IMAGE_PATH,RELATE_IMAGE_NM) values ('사용자권한관리','dir',6020000,6000000,2,'사용자권한관리','/','/');
insert into LETTNMENUINFO(MENU_NM,PROGRM_FILE_NM,MENU_NO,UPPER_MENU_NO,MENU_ORDR,MENU_DC,RELATE_IMAGE_PATH,RELATE_IMAGE_NM) values ('권한관리','EgovAuthorManage',6020100,6020000,1,'권한관리','/','/');
insert into LETTNMENUINFO(MENU_NM,PROGRM_FILE_NM,MENU_NO,UPPER_MENU_NO,MENU_ORDR,MENU_DC,RELATE_IMAGE_PATH,RELATE_IMAGE_NM) values ('사용자그룹관리','EgovGroupManage',6020200,6020000,2,'그룹관리','/','/');
insert into LETTNMENUINFO(MENU_NM,PROGRM_FILE_NM,MENU_NO,UPPER_MENU_NO,MENU_ORDR,MENU_DC,RELATE_IMAGE_PATH,RELATE_IMAGE_NM) values ('사용자별권한관리','EgovAuthorRoleManage',6020300,6020000,3,'권한그룹관리','/','/');
insert into LETTNMENUINFO(MENU_NM,PROGRM_FILE_NM,MENU_NO,UPPER_MENU_NO,MENU_ORDR,MENU_DC,RELATE_IMAGE_PATH,RELATE_IMAGE_NM) values ('롤관리','EgovRoleManage',6020400,6020000,4,'롤관리','/','/');


-- 메뉴생성목록
insert into LETTNMENUCREATDTLS(MENU_NO,AUTHOR_CODE,MAPNG_CREAT_ID) values (0,'ROLE_ADMIN',null);
insert into LETTNMENUCREATDTLS(MENU_NO,AUTHOR_CODE,MAPNG_CREAT_ID) values (0,'ROLE_ANONYMOUS',null);
insert into LETTNMENUCREATDTLS(MENU_NO,AUTHOR_CODE,MAPNG_CREAT_ID) values (0,'ROLE_USER_MEMBER',null);
insert into LETTNMENUCREATDTLS(MENU_NO,AUTHOR_CODE,MAPNG_CREAT_ID) values (1000000,'ROLE_ADMIN',null);
insert into LETTNMENUCREATDTLS(MENU_NO,AUTHOR_CODE,MAPNG_CREAT_ID) values (1000000,'ROLE_ANONYMOUS',null);
insert into LETTNMENUCREATDTLS(MENU_NO,AUTHOR_CODE,MAPNG_CREAT_ID) values (1000000,'ROLE_USER_MEMBER',null);
insert into LETTNMENUCREATDTLS(MENU_NO,AUTHOR_CODE,MAPNG_CREAT_ID) values (1010000,'ROLE_ADMIN',null);
insert into LETTNMENUCREATDTLS(MENU_NO,AUTHOR_CODE,MAPNG_CREAT_ID) values (1010000,'ROLE_ANONYMOUS',null);
insert into LETTNMENUCREATDTLS(MENU_NO,AUTHOR_CODE,MAPNG_CREAT_ID) values (1010000,'ROLE_USER_MEMBER',null);
insert into LETTNMENUCREATDTLS(MENU_NO,AUTHOR_CODE,MAPNG_CREAT_ID) values (1020000,'ROLE_ADMIN',null);
insert into LETTNMENUCREATDTLS(MENU_NO,AUTHOR_CODE,MAPNG_CREAT_ID) values (1020000,'ROLE_ANONYMOUS',null);
insert into LETTNMENUCREATDTLS(MENU_NO,AUTHOR_CODE,MAPNG_CREAT_ID) values (1020000,'ROLE_USER_MEMBER',null);
insert into LETTNMENUCREATDTLS(MENU_NO,AUTHOR_CODE,MAPNG_CREAT_ID) values (1030000,'ROLE_ADMIN',null);
insert into LETTNMENUCREATDTLS(MENU_NO,AUTHOR_CODE,MAPNG_CREAT_ID) values (1030000,'ROLE_ANONYMOUS',null);
insert into LETTNMENUCREATDTLS(MENU_NO,AUTHOR_CODE,MAPNG_CREAT_ID) values (1030000,'ROLE_USER_MEMBER',null);
insert into LETTNMENUCREATDTLS(MENU_NO,AUTHOR_CODE,MAPNG_CREAT_ID) values (1040000,'ROLE_ADMIN',null);
insert into LETTNMENUCREATDTLS(MENU_NO,AUTHOR_CODE,MAPNG_CREAT_ID) values (1040000,'ROLE_ANONYMOUS',null);
insert into LETTNMENUCREATDTLS(MENU_NO,AUTHOR_CODE,MAPNG_CREAT_ID) values (1040000,'ROLE_USER_MEMBER',null);
insert into LETTNMENUCREATDTLS(MENU_NO,AUTHOR_CODE,MAPNG_CREAT_ID) values (2000000,'ROLE_ADMIN',null);
insert into LETTNMENUCREATDTLS(MENU_NO,AUTHOR_CODE,MAPNG_CREAT_ID) values (2000000,'ROLE_ANONYMOUS',null);
insert into LETTNMENUCREATDTLS(MENU_NO,AUTHOR_CODE,MAPNG_CREAT_ID) values (2000000,'ROLE_USER_MEMBER',null);
insert into LETTNMENUCREATDTLS(MENU_NO,AUTHOR_CODE,MAPNG_CREAT_ID) values (2010000,'ROLE_ADMIN',null);
insert into LETTNMENUCREATDTLS(MENU_NO,AUTHOR_CODE,MAPNG_CREAT_ID) values (2010000,'ROLE_ANONYMOUS',null);
insert into LETTNMENUCREATDTLS(MENU_NO,AUTHOR_CODE,MAPNG_CREAT_ID) values (2010000,'ROLE_USER_MEMBER',null);
insert into LETTNMENUCREATDTLS(MENU_NO,AUTHOR_CODE,MAPNG_CREAT_ID) values (2020000,'ROLE_ADMIN',null);
insert into LETTNMENUCREATDTLS(MENU_NO,AUTHOR_CODE,MAPNG_CREAT_ID) values (2020000,'ROLE_ANONYMOUS',null);
insert into LETTNMENUCREATDTLS(MENU_NO,AUTHOR_CODE,MAPNG_CREAT_ID) values (2020000,'ROLE_USER_MEMBER',null);
insert into LETTNMENUCREATDTLS(MENU_NO,AUTHOR_CODE,MAPNG_CREAT_ID) values (3000000,'ROLE_ADMIN',null);
insert into LETTNMENUCREATDTLS(MENU_NO,AUTHOR_CODE,MAPNG_CREAT_ID) values (3000000,'ROLE_ANONYMOUS',null);
insert into LETTNMENUCREATDTLS(MENU_NO,AUTHOR_CODE,MAPNG_CREAT_ID) values (3000000,'ROLE_USER_MEMBER',null);
insert into LETTNMENUCREATDTLS(MENU_NO,AUTHOR_CODE,MAPNG_CREAT_ID) values (3010000,'ROLE_ADMIN',null);
insert into LETTNMENUCREATDTLS(MENU_NO,AUTHOR_CODE,MAPNG_CREAT_ID) values (3010000,'ROLE_ANONYMOUS',null);
insert into LETTNMENUCREATDTLS(MENU_NO,AUTHOR_CODE,MAPNG_CREAT_ID) values (3010000,'ROLE_USER_MEMBER',null);
insert into LETTNMENUCREATDTLS(MENU_NO,AUTHOR_CODE,MAPNG_CREAT_ID) values (3040000,'ROLE_ADMIN',null);
insert into LETTNMENUCREATDTLS(MENU_NO,AUTHOR_CODE,MAPNG_CREAT_ID) values (3040000,'ROLE_ANONYMOUS',null);
insert into LETTNMENUCREATDTLS(MENU_NO,AUTHOR_CODE,MAPNG_CREAT_ID) values (3040000,'ROLE_USER_MEMBER',null);
insert into LETTNMENUCREATDTLS(MENU_NO,AUTHOR_CODE,MAPNG_CREAT_ID) values (4000000,'ROLE_ADMIN',null);
insert into LETTNMENUCREATDTLS(MENU_NO,AUTHOR_CODE,MAPNG_CREAT_ID) values (4000000,'ROLE_ANONYMOUS',null);
insert into LETTNMENUCREATDTLS(MENU_NO,AUTHOR_CODE,MAPNG_CREAT_ID) values (4000000,'ROLE_USER_MEMBER',null);
insert into LETTNMENUCREATDTLS(MENU_NO,AUTHOR_CODE,MAPNG_CREAT_ID) values (4010000,'ROLE_ADMIN',null);
insert into LETTNMENUCREATDTLS(MENU_NO,AUTHOR_CODE,MAPNG_CREAT_ID) values (4010000,'ROLE_ANONYMOUS',null);
insert into LETTNMENUCREATDTLS(MENU_NO,AUTHOR_CODE,MAPNG_CREAT_ID) values (4010000,'ROLE_USER_MEMBER',null);
insert into LETTNMENUCREATDTLS(MENU_NO,AUTHOR_CODE,MAPNG_CREAT_ID) values (4020000,'ROLE_ADMIN',null);
insert into LETTNMENUCREATDTLS(MENU_NO,AUTHOR_CODE,MAPNG_CREAT_ID) values (4020000,'ROLE_ANONYMOUS',null);
insert into LETTNMENUCREATDTLS(MENU_NO,AUTHOR_CODE,MAPNG_CREAT_ID) values (4020000,'ROLE_USER_MEMBER',null);
insert into LETTNMENUCREATDTLS(MENU_NO,AUTHOR_CODE,MAPNG_CREAT_ID) values (4030000,'ROLE_ADMIN',null);
insert into LETTNMENUCREATDTLS(MENU_NO,AUTHOR_CODE,MAPNG_CREAT_ID) values (4030000,'ROLE_ANONYMOUS',null);
insert into LETTNMENUCREATDTLS(MENU_NO,AUTHOR_CODE,MAPNG_CREAT_ID) values (4030000,'ROLE_USER_MEMBER',null);
insert into LETTNMENUCREATDTLS(MENU_NO,AUTHOR_CODE,MAPNG_CREAT_ID) values (5000000,'ROLE_ADMIN',null);
insert into LETTNMENUCREATDTLS(MENU_NO,AUTHOR_CODE,MAPNG_CREAT_ID) values (5010000,'ROLE_ADMIN',null);
insert into LETTNMENUCREATDTLS(MENU_NO,AUTHOR_CODE,MAPNG_CREAT_ID) values (5010100,'ROLE_ADMIN',null);
insert into LETTNMENUCREATDTLS(MENU_NO,AUTHOR_CODE,MAPNG_CREAT_ID) values (5010200,'ROLE_ADMIN',null);
insert into LETTNMENUCREATDTLS(MENU_NO,AUTHOR_CODE,MAPNG_CREAT_ID) values (5010300,'ROLE_ADMIN',null);
insert into LETTNMENUCREATDTLS(MENU_NO,AUTHOR_CODE,MAPNG_CREAT_ID) values (5010400,'ROLE_ADMIN',null);
insert into LETTNMENUCREATDTLS(MENU_NO,AUTHOR_CODE,MAPNG_CREAT_ID) values (5010500,'ROLE_ADMIN',null);
insert into LETTNMENUCREATDTLS(MENU_NO,AUTHOR_CODE,MAPNG_CREAT_ID) values (5020000,'ROLE_ADMIN',null);
insert into LETTNMENUCREATDTLS(MENU_NO,AUTHOR_CODE,MAPNG_CREAT_ID) values (5020100,'ROLE_ADMIN',null);
insert into LETTNMENUCREATDTLS(MENU_NO,AUTHOR_CODE,MAPNG_CREAT_ID) values (5020200,'ROLE_ADMIN',null);
insert into LETTNMENUCREATDTLS(MENU_NO,AUTHOR_CODE,MAPNG_CREAT_ID) values (5020300,'ROLE_ADMIN',null);
insert into LETTNMENUCREATDTLS(MENU_NO,AUTHOR_CODE,MAPNG_CREAT_ID) values (5020400,'ROLE_ADMIN',null);
insert into LETTNMENUCREATDTLS(MENU_NO,AUTHOR_CODE,MAPNG_CREAT_ID) values (5020500,'ROLE_ADMIN',null);
insert into LETTNMENUCREATDTLS(MENU_NO,AUTHOR_CODE,MAPNG_CREAT_ID) values (5020600,'ROLE_ADMIN',null);
insert into LETTNMENUCREATDTLS(MENU_NO,AUTHOR_CODE,MAPNG_CREAT_ID) values (5020700,'ROLE_ADMIN',null);
insert into LETTNMENUCREATDTLS(MENU_NO,AUTHOR_CODE,MAPNG_CREAT_ID) values (5020800,'ROLE_ADMIN',null);
insert into LETTNMENUCREATDTLS(MENU_NO,AUTHOR_CODE,MAPNG_CREAT_ID) values (5020900,'ROLE_ADMIN',null);
insert into LETTNMENUCREATDTLS(MENU_NO,AUTHOR_CODE,MAPNG_CREAT_ID) values (6000000,'ROLE_ADMIN',null);
insert into LETTNMENUCREATDTLS(MENU_NO,AUTHOR_CODE,MAPNG_CREAT_ID) values (6010000,'ROLE_ADMIN',null);
insert into LETTNMENUCREATDTLS(MENU_NO,AUTHOR_CODE,MAPNG_CREAT_ID) values (6010100,'ROLE_ADMIN',null);
insert into LETTNMENUCREATDTLS(MENU_NO,AUTHOR_CODE,MAPNG_CREAT_ID) values (6010200,'ROLE_ADMIN',null);
insert into LETTNMENUCREATDTLS(MENU_NO,AUTHOR_CODE,MAPNG_CREAT_ID) values (6010300,'ROLE_ADMIN',null);
insert into LETTNMENUCREATDTLS(MENU_NO,AUTHOR_CODE,MAPNG_CREAT_ID) values (6020000,'ROLE_ADMIN',null);
insert into LETTNMENUCREATDTLS(MENU_NO,AUTHOR_CODE,MAPNG_CREAT_ID) values (6020100,'ROLE_ADMIN',null);
insert into LETTNMENUCREATDTLS(MENU_NO,AUTHOR_CODE,MAPNG_CREAT_ID) values (6020200,'ROLE_ADMIN',null);
insert into LETTNMENUCREATDTLS(MENU_NO,AUTHOR_CODE,MAPNG_CREAT_ID) values (6020300,'ROLE_ADMIN',null);
insert into LETTNMENUCREATDTLS(MENU_NO,AUTHOR_CODE,MAPNG_CREAT_ID) values (6020400,'ROLE_ADMIN',null);

insert into LETTNQUSTNRTMPLAT(QUSTNR_TMPLAT_ID,QUSTNR_TMPLAT_TY,QUSTNR_TMPLAT_DC,QUSTNR_TMPLAT_PATH_NM,FRST_REGIST_PNTTM,FRST_REGISTER_ID,LAST_UPDT_PNTTM,LAST_UPDUSR_ID,QUSTNR_TMPLAT_IMAGE_INFO) values ('QTMPLA_0000000000001','A','A형템플릿','/uss/olp/qri/template/template',SYSDATE,'USRCNFRM_00000000000',SYSDATE,'USRCNFRM_00000000000',null);

-- 게시물
insert into LETTNBBS(NTT_ID,BBS_ID,NTT_NO,NTT_SJ,NTT_CN,ANSWER_AT,PARNTSCTT_NO,ANSWER_LC,SORT_ORDR,RDCNT,USE_AT,NTCE_BGNDE,NTCE_ENDDE,NTCR_ID,NTCR_NM,PASSWORD,ATCH_FILE_ID,FRST_REGIST_PNTTM,FRST_REGISTER_ID,LAST_UPDT_PNTTM,LAST_UPDUSR_ID) values (1,'BBSMSTR_AAAAAAAAAAAA',1,'포탈사이트 샘플공지1','포탈사이트 샘플공지1','N',0,0,2,0,'Y','10000101','99991231','','','',null,SYSDATE,'USRCNFRM_00000000000',null,null);
insert into LETTNBBS(NTT_ID,BBS_ID,NTT_NO,NTT_SJ,NTT_CN,ANSWER_AT,PARNTSCTT_NO,ANSWER_LC,SORT_ORDR,RDCNT,USE_AT,NTCE_BGNDE,NTCE_ENDDE,NTCR_ID,NTCR_NM,PASSWORD,ATCH_FILE_ID,FRST_REGIST_PNTTM,FRST_REGISTER_ID,LAST_UPDT_PNTTM,LAST_UPDUSR_ID) values (2,'BBSMSTR_AAAAAAAAAAAA',1,'포탈사이트 샘플공지2','포탈사이트 샘플공지2','N',0,0,2,0,'Y','10000101','99991231','','','',null,SYSDATE,'USRCNFRM_00000000000',null,null);
insert into LETTNBBS(NTT_ID,BBS_ID,NTT_NO,NTT_SJ,NTT_CN,ANSWER_AT,PARNTSCTT_NO,ANSWER_LC,SORT_ORDR,RDCNT,USE_AT,NTCE_BGNDE,NTCE_ENDDE,NTCR_ID,NTCR_NM,PASSWORD,ATCH_FILE_ID,FRST_REGIST_PNTTM,FRST_REGISTER_ID,LAST_UPDT_PNTTM,LAST_UPDUSR_ID) values (3,'BBSMSTR_AAAAAAAAAAAA',1,'포탈사이트 샘플공지3','포탈사이트 샘플공지3','N',0,0,2,0,'Y','10000101','99991231','','','',null,SYSDATE,'USRCNFRM_00000000000',null,null);
insert into LETTNBBS(NTT_ID,BBS_ID,NTT_NO,NTT_SJ,NTT_CN,ANSWER_AT,PARNTSCTT_NO,ANSWER_LC,SORT_ORDR,RDCNT,USE_AT,NTCE_BGNDE,NTCE_ENDDE,NTCR_ID,NTCR_NM,PASSWORD,ATCH_FILE_ID,FRST_REGIST_PNTTM,FRST_REGISTER_ID,LAST_UPDT_PNTTM,LAST_UPDUSR_ID) values (4,'BBSMSTR_AAAAAAAAAAAA',1,'포탈사이트 샘플공지4','포탈사이트 샘플공지4','N',0,0,2,0,'Y','10000101','99991231','','','',null,SYSDATE,'USRCNFRM_00000000000',null,null);
insert into LETTNBBS(NTT_ID,BBS_ID,NTT_NO,NTT_SJ,NTT_CN,ANSWER_AT,PARNTSCTT_NO,ANSWER_LC,SORT_ORDR,RDCNT,USE_AT,NTCE_BGNDE,NTCE_ENDDE,NTCR_ID,NTCR_NM,PASSWORD,ATCH_FILE_ID,FRST_REGIST_PNTTM,FRST_REGISTER_ID,LAST_UPDT_PNTTM,LAST_UPDUSR_ID) values (5,'BBSMSTR_AAAAAAAAAAAA',1,'포탈사이트 샘플공지5','포탈사이트 샘플공지5','N',0,0,2,0,'Y','10000101','99991231','','','',null,SYSDATE,'USRCNFRM_00000000000',null,null);

insert into LETTNBBS(NTT_ID,BBS_ID,NTT_NO,NTT_SJ,NTT_CN,ANSWER_AT,PARNTSCTT_NO,ANSWER_LC,SORT_ORDR,RDCNT,USE_AT,NTCE_BGNDE,NTCE_ENDDE,NTCR_ID,NTCR_NM,PASSWORD,ATCH_FILE_ID,FRST_REGIST_PNTTM,FRST_REGISTER_ID,LAST_UPDT_PNTTM,LAST_UPDUSR_ID) values (6,'BBSMSTR_BBBBBBBBBBBB',1,'포탈사이트 샘플게시1','포탈사이트 샘플게시1','N',0,0,2,0,'Y','10000101','99991231','','','',null,SYSDATE,'USRCNFRM_00000000000',null,null);
insert into LETTNBBS(NTT_ID,BBS_ID,NTT_NO,NTT_SJ,NTT_CN,ANSWER_AT,PARNTSCTT_NO,ANSWER_LC,SORT_ORDR,RDCNT,USE_AT,NTCE_BGNDE,NTCE_ENDDE,NTCR_ID,NTCR_NM,PASSWORD,ATCH_FILE_ID,FRST_REGIST_PNTTM,FRST_REGISTER_ID,LAST_UPDT_PNTTM,LAST_UPDUSR_ID) values (7,'BBSMSTR_BBBBBBBBBBBB',1,'포탈사이트 샘플게시2','포탈사이트 샘플게시2','N',0,0,2,0,'Y','10000101','99991231','','','',null,SYSDATE,'USRCNFRM_00000000000',null,null);
insert into LETTNBBS(NTT_ID,BBS_ID,NTT_NO,NTT_SJ,NTT_CN,ANSWER_AT,PARNTSCTT_NO,ANSWER_LC,SORT_ORDR,RDCNT,USE_AT,NTCE_BGNDE,NTCE_ENDDE,NTCR_ID,NTCR_NM,PASSWORD,ATCH_FILE_ID,FRST_REGIST_PNTTM,FRST_REGISTER_ID,LAST_UPDT_PNTTM,LAST_UPDUSR_ID) values (8,'BBSMSTR_BBBBBBBBBBBB',1,'포탈사이트 샘플게시3','포탈사이트 샘플게시3','N',0,0,2,0,'Y','10000101','99991231','','','',null,SYSDATE,'USRCNFRM_00000000000',null,null);
insert into LETTNBBS(NTT_ID,BBS_ID,NTT_NO,NTT_SJ,NTT_CN,ANSWER_AT,PARNTSCTT_NO,ANSWER_LC,SORT_ORDR,RDCNT,USE_AT,NTCE_BGNDE,NTCE_ENDDE,NTCR_ID,NTCR_NM,PASSWORD,ATCH_FILE_ID,FRST_REGIST_PNTTM,FRST_REGISTER_ID,LAST_UPDT_PNTTM,LAST_UPDUSR_ID) values (9,'BBSMSTR_BBBBBBBBBBBB',1,'포탈사이트 샘플게시4','포탈사이트 샘플게시4','N',0,0,2,0,'Y','10000101','99991231','','','',null,SYSDATE,'USRCNFRM_00000000000',null,null);
insert into LETTNBBS(NTT_ID,BBS_ID,NTT_NO,NTT_SJ,NTT_CN,ANSWER_AT,PARNTSCTT_NO,ANSWER_LC,SORT_ORDR,RDCNT,USE_AT,NTCE_BGNDE,NTCE_ENDDE,NTCR_ID,NTCR_NM,PASSWORD,ATCH_FILE_ID,FRST_REGIST_PNTTM,FRST_REGISTER_ID,LAST_UPDT_PNTTM,LAST_UPDUSR_ID) values (10,'BBSMSTR_BBBBBBBBBBBB',1,'포탈사이트 샘플게시5','포탈사이트 샘플게시5','N',0,0,2,0,'Y','10000101','99991231','','','',null,SYSDATE,'USRCNFRM_00000000000',null,null);

-- FAQ
Insert into LETTNFAQINFO (FAQ_ID, QESTN_SJ, QESTN_CN, ANSWER_CN, RDCNT, FRST_REGIST_PNTTM, FRST_REGISTER_ID, LAST_UPDT_PNTTM, LAST_UPDUSR_ID)
 Values ('FAQ_000000000000000A', 'FAQ 샘플1', 'FAQ 샘플1 - 질문내용', 'FAQ 샘플1 - 답변내용', 0, SYSDATE, 'USRCNFRM_00000000000', SYSDATE, 'USRCNFRM_00000000000');

Insert into LETTNFAQINFO (FAQ_ID, QESTN_SJ, QESTN_CN, ANSWER_CN, RDCNT, FRST_REGIST_PNTTM, FRST_REGISTER_ID, LAST_UPDT_PNTTM, LAST_UPDUSR_ID)
 Values ('FAQ_000000000000000B', 'FAQ 샘플2', 'FAQ 샘플2 - 질문내용', 'FAQ 샘플2 - 답변내용', 0, SYSDATE, 'USRCNFRM_00000000000', SYSDATE, 'USRCNFRM_00000000000');

Insert into LETTNFAQINFO (FAQ_ID, QESTN_SJ, QESTN_CN, ANSWER_CN, RDCNT, FRST_REGIST_PNTTM, FRST_REGISTER_ID, LAST_UPDT_PNTTM, LAST_UPDUSR_ID)
 Values ('FAQ_000000000000000C', 'FAQ 샘플3', 'FAQ 샘플3 - 질문내용', 'FAQ 샘플3 - 답변내용', 0, SYSDATE, 'USRCNFRM_00000000000', SYSDATE, 'USRCNFRM_00000000000');
