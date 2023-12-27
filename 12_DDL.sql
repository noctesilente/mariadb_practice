CREATE TABLE IF NOT EXISTS tb1 (
   pk INT PRIMARY KEY,
   fk INT,
   col1 VARCHAR(255),
   CHECK(col1 IN ('Y', 'N'))
)  ENGINE=INNODB;

DESC tb1;

INSERT
  INTO tb1
VALUES
(
  '1', '2', 'Y'
);

SELECT * FROM tb1;


-- ---------------------------------------
-- auto_increment

CREATE TABLE IF NOT EXISTS tb2 (
   pk INT PRIMARY KEY AUTO_INCREMENT,
   fk INT,
   col1 VARCHAR(255),
   CHECK(col1 IN ('Y', 'N'))
)  ENGINE=INNODB;

DESC tb2;

INSERT
  INTO tb2
VALUES
(
  NULL, '2', 'Y'
);

SELECT * FROM tb1;

-- -----------------------------
-- ALTER
-- 컬럼 추가
ALTER TABLE tb2 ADD col2 INT NOT NULL;
DESC tb2;

-- 컬럼 삭제
ALTER TABLE tb2 DROP COLUMN col2;
DESC tb2;

-- 컬럼 이름 및 컬럼 정의 변경
ALTER TABLE tb2
CHANGE COLUMN fk change_fk INT NOT NULL;

DESC tb2;

-- 제약조건(auto_increment로 인해 제거 불가) 제거
ALTER TABLE tb2 DROP PRIMARY KEY;
-- 오류 발생

-- auto_increment 제거
ALTER TABLE tb2 MODIFY pk INT;
DESC tb2;

-- 다시 primary key 제거
ALTER TABLE tb2 DROP PRIMARY KEY;


-- TRUNCATE
-- tb6 테이블 생성
CREATE TABLE IF NOT EXISTS tb6(
  pk INT AUTO_INCREMENT PRIMARY KEY,
  fk INT,
  col1 VARCHAR(255),
  CHECK(col1 IN ('Y', 'N'))
) ENGINE=INNODB;

-- 4개 행 데이터 INSERT
INSERT 
  INTO tb6 
VALUES 
 (NULL, 10, 'Y'), 
 (NULL, 20, 'Y'), 
 (NULL, 30, 'Y'), 
 (NULL, 40, 'Y');

-- 제대로 INSERT 되었는지 확인
SELECT * FROM tb6;

-- 테이블 초기화 하기
-- TRUNCATE TABLE tb6;
TRUNCATE tb6;         -- TABLE 키워드 생략 가능

SELECT * FROM tb6;