-- 명시적 형변환
SELECT AVG(menu_price) FROM tbl_menu;

-- 1) 숫자 -> 숫자
-- integer이므로 소수점 반올림을 해서 정수형로 변환
SELECT CAST(AVG(menu_price) AS UNSIGNED INTEGER) AS '가격평균' FROM tbl_menu;
-- 소수로 표현하고 싶다면 FLOAT
-- 소수점 이하 한 자리까지 변환
SELECT CAST(AVG(menu_price) AS FLOAT) AS '가격평균' FROM tbl_menu;
-- 소수점이 더 많이 나오려면 DOUBLE
-- 소수점 이하 12자리까지 변환
SELECT CAST(AVG(menu_price) AS DOUBLE) AS '가격평균' FROM tbl_menu;


-- 2) 문자 -> 날짜
-- 2023년 12월 27일을 date형으로 변환
SELECT CAST('2023$12$27' AS DATE);
SELECT CONVERT('2023/12/27', DATE);
SELECT CONVERT('2023-12-27', DATE);
SELECT CONVERT('2023#12#27', DATE);

SELECT CAST('2023$5$30' AS DATE);
SELECT CAST('2023/5/30' AS DATE);
SELECT CAST('2023%5%30' AS DATE);
SELECT CAST('2023@5@30' AS DATE);

-- 3) 숫자 -> 문자
SELECT CONCAT(CAST(1000 AS CHAR), '원');



-- 암시적 형변환
-- 연산자 사용 시 자동 형변환이 되는데 주의해야 한다
-- '2'가 숫자 2로 변환
SELECT 1 + '2';
-- 모든 문자는 산술연산 또는 비교 연산을 만나면 0이 된다
SELECT '1' + '2';

-- 더하는 게 아니라 1과 2를 붙이고 싶으면 concat을 써야 함
SELECT CONCAT('1', '2');

-- 모든 문자는 산술연산 또는 비교 연산을 만나면 0이 된다
SELECT '안녕' + '하세요';

-- true의 의미인 1이 반환된다
SELECT 5 > '반가워';


