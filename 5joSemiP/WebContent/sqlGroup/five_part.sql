CREATE TABLE FIVE_PART(
	SEQ NUMBER(8) PRIMARY KEY,
	NAME VARCHAR2(50),
	ORDERNUM NUMBER(8)
)

INSERT INTO FIVE_PART VALUES(FIVE_PART_SEQ.nextVal,'상품문의',1)
INSERT INTO FIVE_PART VALUES(FIVE_PART_SEQ.nextVal,'배송문의',2)
INSERT INTO FIVE_PART VALUES(FIVE_PART_SEQ.nextVal,'기타문의',3)

SELECT *
FROM USER_SEQUENCES
WHERE SEQUENCE_NAME LIKE '%FIVE%'
--a.seq, a.title, b.seq,

SELECT  b.name
FROM FIVE_QNA a
LEFT OUTER JOIN FIVE_PART b ON a.part_seq = b.seq
WHERE A.SEQ = 7


SELECT a.seq, a.title, a.id, b.name, a.contents
FROM FIVE_QNA a
LEFT OUTER JOIN FIVE_PART b on a.part_seq = b.seq
WHERE a.SEQ = 7 