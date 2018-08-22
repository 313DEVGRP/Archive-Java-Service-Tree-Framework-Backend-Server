/*
 * JsTree 추적 로그 테이블
 * 트리거 Log를 저장합니다.
 */
CREATE TABLE T_DIRECT_CHAT_LOG
(
 C_ID        NUMBER                            NOT NULL,
 C_PARENTID  NUMBER                            NOT NULL,
 C_POSITION  NUMBER                            NOT NULL,
 C_LEFT      NUMBER                            NOT NULL,
 C_RIGHT     NUMBER                            NOT NULL,
 C_LEVEL     NUMBER                            NOT NULL,
 C_TITLE     VARCHAR2(4000 BYTE),
 C_TYPE      VARCHAR2(4000 BYTE),
 C_METHOD    VARCHAR2(4000 BYTE),
 C_STATE     VARCHAR2(4000 BYTE),
 C_DATE      DATE                              NOT NULL
);
 
COMMENT ON TABLE T_DIRECT_CHAT_LOG IS '기본 트리 스키마 트리거 로그';
COMMENT ON COLUMN T_DIRECT_CHAT_LOG.C_ID IS '노드 아이디';
COMMENT ON COLUMN T_DIRECT_CHAT_LOG.C_PARENTID IS '부모 노드 아이디';
COMMENT ON COLUMN T_DIRECT_CHAT_LOG.C_POSITION IS '노드 포지션';
COMMENT ON COLUMN T_DIRECT_CHAT_LOG.C_LEFT IS '노드 좌측 끝 포인트';
COMMENT ON COLUMN T_DIRECT_CHAT_LOG.C_RIGHT IS '노드 우측 끝 포인트';
COMMENT ON COLUMN T_DIRECT_CHAT_LOG.C_LEVEL IS '노드 DEPTH ';
COMMENT ON COLUMN T_DIRECT_CHAT_LOG.C_TITLE IS '노드 명';
COMMENT ON COLUMN T_DIRECT_CHAT_LOG.C_TYPE IS '노드 타입';
COMMENT ON COLUMN T_DIRECT_CHAT_LOG.C_METHOD IS '노드 변경 행위';
COMMENT ON COLUMN T_DIRECT_CHAT_LOG.C_STATE IS '노드 상태값 ( 이전인지. 이후인지)';
COMMENT ON COLUMN T_DIRECT_CHAT_LOG.C_DATE IS '노드 변경 시';
 
/*
 * JsTree
 */
CREATE TABLE T_DIRECT_CHAT
(
 C_ID        		NUMBER                            NOT NULL,
 C_PARENTID  	NUMBER                            NOT NULL,
 C_POSITION  	NUMBER                            NOT NULL,
 C_LEFT      		NUMBER                            NOT NULL,
 C_RIGHT     		NUMBER                            NOT NULL,
 C_LEVEL     		NUMBER                            NOT NULL,
 C_TITLE     		VARCHAR2(4000 BYTE),
 C_TYPE      		VARCHAR2(4000 BYTE),
 
 MENU_ID  		        NUMBER,
 USER_ID      		    VARCHAR2(4000 BYTE),
 USER_LEVEL	            NUMBER,
 WRITE_TIME	            VARCHAR2(4000 BYTE),
 SELECTED_COMPARE_ITEM	NUMBER,
 CONTENTS_BODY          VARCHAR2(4000 BYTE),
 HASH_TAGS              VARCHAR2(4000 BYTE),
 LIKE_COUNT	            NUMBER,
 HATE_COUNT	            NUMBER,
 HIDDEN_YN              VARCHAR2(4000 BYTE),
 REPORT_YN              VARCHAR2(4000 BYTE),

 CONSTRAINT  T_DIRECT_CHAT_PK PRIMARY KEY (C_ID)
 /*
   * CONSTRAINT  T_DIRECT_CHAT_FK1 FOREIGN KEY (OTHER_ID) REFERENCES OTHER T_DIRECT_CHAT(C_ID) ON DELETE CASCADE
   */
);
 
COMMENT ON TABLE T_DIRECT_CHAT IS '기본 트리 스키마';
COMMENT ON COLUMN T_DIRECT_CHAT.C_ID IS '노드 아이디';
COMMENT ON COLUMN T_DIRECT_CHAT.C_PARENTID IS '부모 노드 아이디';
COMMENT ON COLUMN T_DIRECT_CHAT.C_POSITION IS '노드 포지션';
COMMENT ON COLUMN T_DIRECT_CHAT.C_LEFT IS '노드 좌측 끝 포인트';
COMMENT ON COLUMN T_DIRECT_CHAT.C_RIGHT IS '노드 우측 끝 포인트';
COMMENT ON COLUMN T_DIRECT_CHAT.C_LEVEL IS '노드 DEPTH ';
COMMENT ON COLUMN T_DIRECT_CHAT.C_TITLE IS '노드 명';
COMMENT ON COLUMN T_DIRECT_CHAT.C_TYPE IS '노드 타입';

COMMENT ON COLUMN T_DIRECT_CHAT.MENU_ID IS '다이렉트챗 메뉴아이디 ( request )';
COMMENT ON COLUMN T_DIRECT_CHAT.USER_ID IS '글쓴 사용자 아이디 ( springsecurity )';
COMMENT ON COLUMN T_DIRECT_CHAT.USER_LEVEL IS '글쓴 사용자 레벨 ( springsecurity )';
COMMENT ON COLUMN T_DIRECT_CHAT.WRITE_TIME IS '글쓴시간 ( system )';
COMMENT ON COLUMN T_DIRECT_CHAT.SELECTED_COMPARE_ITEM IS '글쓴이 선택 진영 ( usermappingitem )';
COMMENT ON COLUMN T_DIRECT_CHAT.CONTENTS_BODY IS '글내용';
COMMENT ON COLUMN T_DIRECT_CHAT.HASH_TAGS IS '글해시태그';
COMMENT ON COLUMN T_DIRECT_CHAT.LIKE_COUNT IS '좋아요 카운트';
COMMENT ON COLUMN T_DIRECT_CHAT.HATE_COUNT IS '싫어요 카운트';
COMMENT ON COLUMN T_DIRECT_CHAT.HIDDEN_YN IS '글 보이기 감추기 여부';
COMMENT ON COLUMN T_DIRECT_CHAT.REPORT_YN IS '신고여부';
/*
 * 인덱스는 되도록 걸지 말것.
 * CREATE UNIQUE INDEX I_COMPREHENSIVETREE ON T_DIRECT_CHAT
 *      ("C_ID" ASC)
 * DROP SEQUENCE S_DIRECT_CHAT;
 */
 
 
CREATE SEQUENCE S_DIRECT_CHAT
 START WITH 10
 MAXVALUE 999999999999999999999999999
 MINVALUE 0
 NOCYCLE
 CACHE 20
 NOORDER;
 
/*
 * JsTree 트리거
 */
CREATE OR REPLACE TRIGGER "TRIGGER_DIRECT_CHAT"
BEFORE DELETE OR INSERT OR UPDATE
ON T_DIRECT_CHAT
REFERENCING NEW AS NEW OLD AS OLD
FOR EACH ROW
DECLARE
tmpVar NUMBER;
/******************************************************************************
   NAME:       TRIGGER_COMPREHENSIVETREE
   PURPOSE:    
 
   REVISIONS:
   Ver        Date        Author           Description
   ---------  ----------  ---------------  ------------------------------------
   1.0        2012-08-29             1. Created this trigger.
 
   NOTES:
 
   Automatically available Auto Replace Keywords:
      Object Name:     TRIGGER_COMPREHENSIVETREE
      Sysdate:         2012-08-29
      Date and Time:   2012-08-29, 오후 5:26:44, and 2012-08-29 오후 5:26:44
      Username:         (set in TOAD Options, Proc Templates)
      Table Name:      T_DIRECT_CHAT (set in the "New PL/SQL Object" dialog)
      Trigger Options:  (set in the "New PL/SQL Object" dialog)
******************************************************************************/
BEGIN
  tmpVar := 0;
   IF UPDATING  THEN    
       insert into T_DIRECT_CHAT_LOG
       values (:old.C_ID,:old.C_PARENTID,:old.C_POSITION,:old.C_LEFT,:old.C_RIGHT,:old.C_LEVEL,:old.C_TITLE,:old.C_TYPE,'update','변경이전데이터',sysdate);        
       insert into T_DIRECT_CHAT_LOG
       values (:new.C_ID,:new.C_PARENTID,:new.C_POSITION,:new.C_LEFT,:new.C_RIGHT,:new.C_LEVEL,:new.C_TITLE,:new.C_TYPE,'update','변경이후데이터',sysdate);   
    END IF;
   IF DELETING THEN
       insert into T_DIRECT_CHAT_LOG
       values (:old.C_ID,:old.C_PARENTID,:old.C_POSITION,:old.C_LEFT,:old.C_RIGHT,:old.C_LEVEL,:old.C_TITLE,:old.C_TYPE,'delete','삭제된데이터',sysdate);
   END IF;   
   IF INSERTING  THEN
       insert into T_DIRECT_CHAT_LOG
       values (:new.C_ID,:new.C_PARENTID,:new.C_POSITION,:new.C_LEFT,:new.C_RIGHT,:new.C_LEVEL,:new.C_TITLE,:new.C_TYPE,'insert','삽입된데이터',sysdate);
   END IF;
 
  EXCEPTION
    WHEN OTHERS THEN
      -- Consider logging the error and then re-raise
      RAISE;
END TRIGGER_DIRECT_CHAT;
/