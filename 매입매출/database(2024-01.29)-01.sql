-- 매입매출 
DROP TABLE tbl_iolist;
CREATE TABLE tbl_iolist(
	io_seq	BIGINT PRIMARY KEY,
	io_date	VARCHAR(10) NOT NULL,
	io_time	VARCHAR(10) NOT NULL,
	io_pcode VARCHAR(6) NOT NULL,
	io_dcode VARCHAR(5) NOT NULL,
	io_div VARCHAR(1) ,
	io_quan	INT,
	io_iprice INT,
	io_oprice INT
);
SELECT COUNT(*) FROM tbl_depts;
SELECT COUNT(*) FROM tbl_iolist;
SELECT COUNT(*) FROM tbl_products;

SELECT * FROM tbl_depts;
SELECT * FROM tbl_iolist LIMIT 10;
SELECT * FROM tbl_products;

-- 정규화(제 3 정규화)된 데이터의
-- tbl_iolist 테이블만 가지고는 상품에 대한 구체적인 정보(이름 포함)와 
-- 거래처에 대한 구체적인 정보(이름 포함)을 알 수 없다.
-- 이럴 때 테이블 간 JOIN 을 실행하여 확인을 해야 한다.

-- Table JOIN 을 통해 "참조 무결성" 검증 필요.
-- 상품과 매입매출 테이블의 Relation 검증
-- 결과가 하나라도 출력이 되면
-- tbl_iolist 에는 상품 코드 데이터가 포함되어 있지만,
-- tbl_products 에는 상품 코드 데이터가 누락되어 있다.
-- 참조관계(참조무결성)이 문제가 있음.
SELECT io_pcode, p_name
FROM tbl_iolist
	LEFT JOIN tbl_products
		ON io_pcode = p_code
WHERE p_name IS NULL;

-- 거래처 데이터와 매입매출 "참조무결성" 검증
SELECT io_dcode, d_name
FROM tbl_iolist
	LEFT JOIN tbl_depts
		ON io_dcode = d_code
WHERE d_name IS NULL;

/*
외래키 설정(FOREIGN KEY, FK) : 참조무결성 제약조건 설정
다중 테이블간의 관계에서 참조무결성이 무너지지 않도록 
미리 테이블에 제약조건을 설정하고, 
데이터의 추가, 수정, 삭제를 할 때 적용.

외래키는 1:N 관계에서 N 인 테이블에 설정한다.
1 의 조건 테이블의 PK 와 연결한다.
*/
-- PK : 개체무결성 보장. UNIQUE + NOT NULL
-- FK : 참조무결성. NOT NULL

-- 매입매출과 상품 테이블의 FK 설정
-- 매입매출과 상품은 N:1 의 관계이다
-- N 인 매입매출 Table 에 FK 를 설정한다
ALTER TABLE tbl_iolist
ADD CONSTRAINT FK_PCODE
FOREIGN KEY (io_pcode)
REFERENCES tbl_products(p_code);
-- io_pcode 와 p_code 를 연결하여 이름을 FK_PCODE 로 만든다

SELECT * FROM tbl_iolist LIMIT 10;
-- tbl_iolist 에 P00012 상품의 거래 데이터가 있기 때문에
-- tbl_products(상품테이블) 에서 P00012 인 상품의 데이터는 
-- 절대 삭제할 수 없게 되었다.
DELETE FROM tbl_products WHERE p_code = 'P00012';
SELECT * FROM tbl_iolist WHERE io_pcode = 'P00012';

-- 매입매출과 거래처 테이블 간에 FK 설정하기 (iolist를 선택)
ALTER TABLE tbl_iolist
ADD CONSTRAINT FK_DCODE
FOREIGN KEY (io_dcode)
REFERENCES tbl_depts(d_code);

-- database 메뉴에서 reverse engineer.. 에서 erd 볼 수 있음








