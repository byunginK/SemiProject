SELECT *
FROM FIVE_MEMBER

INSERT INTO FIVE_MEMBER 
(ID, PASSWORD, NAME, EMAIL, PHONENUMBER, AUTH)
VALUES('aaa', '12345', '관리자','ohShopping@naver.com', '01055555555', 1) ;

DELETE FIVE_MEMBER
WHERE ID='aaa';


 bitcamp12    장동건  오조가오조가?a1   1052234556 jangdong@naver.com      3


SELECT *
FROM FIVE_SUGGEST

DELETE FROM FIVE_SUGGEST
WHERE STEP > 0;

 CREATE TABLE "HR"."FIVE_SUGGEST" 
   (	"SEQ" NUMBER(8,0), 
	"ID" VARCHAR2(50 BYTE) NOT NULL ENABLE, 
	"REF" NUMBER(8,0) NOT NULL ENABLE, 
	"STEP" NUMBER(8,0) NOT NULL ENABLE, 
	"DEPTH" NUMBER(8,0) NOT NULL ENABLE, 
	"TITLE" VARCHAR2(200 BYTE) NOT NULL ENABLE, 
	"CONTENT" VARCHAR2(4000 BYTE) NOT NULL ENABLE, 
	"WDATE" DATE NOT NULL ENABLE, 
	"DEL" NUMBER(1,0) NOT NULL ENABLE, 
	"READCOUNT" NUMBER(8,0) NOT NULL ENABLE, 
	 PRIMARY KEY ("SEQ")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE, 
	 CONSTRAINT "FK_FIVE_SUGGEST_ID" FOREIGN KEY ("ID")
	  REFERENCES "HR"."FIVE_MEMBER" ("ID") ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;


  CREATE TABLE FIVE_SUGGEST_COMMENT(
       SEQ NUMBER(8,0) PRIMARY KEY,
       SUGGEST_NO NUMBER(8,0) NOT NULL,
       WRITER_ID VARCHAR2(50) NOT NULL,
       CONTENT VARCHAR2(400) NOT NULL,
       WDATE DATE NOT NULL,
       DEL NUMBER(1) NOT NULL
  );
  
ALTER TABLE FIVE_SUGGEST_COMMENT
ADD CONSTRAINT FK_FIVE_SUGGEST_COMMEN_ID FOREIGN KEY(WRITER_ID)
REFERENCES FIVE_MEMBER(ID)

ALTER TABLE FIVE_SUGGEST_COMMENT
ADD CONSTRAINT FK_FIVE_SUGGEST_COMMENT_NO FOREIGN KEY(SUGGEST_NO)
REFERENCES FIVE_SUGGEST(SEQ)

CREATE SEQUENCE SEQ_FIVE_SUGGEST_COMMENT
  START WITH 1
  INCREMENT BY 1
  MAXVALUE 10000
  MINVALUE 1;


DROP TABLE FIVE_SUGGEST_COMMENT
CASCADE CONSTRAINTS;
  
drop sequence SEQ_FIVE_SUGGEST_COMMENT;


INSERT INTO FIVE_SUGGEST_COMMENT
 (SEQ, WRITER_ID, SUGGEST_NO,
  CONTENT, WDATE, DEL ) 
 VALUES(SEQ_FIVE_SUGGEST_COMMENT.NEXTVAL, 'aaa', 42, 'rtrt', SYSDATE, 0 ) ;
  
SELECT *
FROM FIVE_SUGGEST_COMMENT