SELECT
		 category_code
  FROM tbl_menu
 WHERE category_code IS NOT NULL 
-- where절은 from 뒤에 넣기
-- 여기까지 하고 실행하면 카테고리 코드가 있는 메뉴만 나옴
 GROUP BY category_code;
-- 카테고리가 있는 것들을 그룹으로 묶음


-- 조회의 6가지 절을 모두 활용한 예제
-- 1. select : group by 절에서 group을 묶는 조건으로 활용한 컬럼만 조회
--          또는 그룹 함수를 통해 조회한다
-- 2. from : 테이블 또는 join을 활용한 result set을 작성한다
-- 3. where : from절의 각 행마다 적용될 조건을 작성한다
-- 4. group by : where절까지 만족하는 행들에 대해 그룹이 될 컬럼을 작성한다
-- 5. having : 그룹별로 적용할 조건을 group by에서 작성한 컬럼
--          또는 그룹 함수를 통해 조회한다
-- 6. order by : 제일 마지막에 해석되며 select의 결과 (result set)의 순번,
--            별칭, 컬럼명 등으로 오름차순 또는 내림차순한다

SELECT
		 category_code
		, COUNT(*)           -- 모든 행 개수 세기
		, COUNT(category_code)  -- category_code가 NULL이 아닌 행만 개수 세기
		, SUM(menu_price)
		, AVG(menu_price)
  FROM tbl_menu -- JOIN은 여기에 들어감 FROM이랑 함께라고 보면 됨
 WHERE category_code IS NOT NULL 
 GROUP BY category_code
HAVING SUM(menu_price) >= 24000
 ORDER BY 2;  -- 두번째 컬럼인 COUNT(*) 오름차순으로 정렬
 
 
 
-- 메뉴가 없는 카테고리까지 셀 건지 구분해서 count 해보기
SELECT
		 COUNT(*)
		, COUNT(a.menu_name)   -- NULL이 아닌 것만 세기
  FROM tbl_menu a
  RIGHT JOIN tbl_category b ON (a.category_code = b.category_code);
  
-- --------------------------------------------------------------------
-- 함수의 종류
-- 단일행 함수 : NVL 또는 IFNULL과 같이 단일 행마다 적용되어 행의 개수만큼 결과가 나오는 경우
-- 그룹 함수 : COUNT, SUM, AVG과 같이 그룹마다 적용되어 그룹의 개수만큼 결과가 나오는 경우 
-- 단, GROUP BY를 안 쓰면 전체를 한 그룹으로 봄 -> 결과가 하나로 나옴 -> 단일행


-- ----------------------------------------
-- ROLLUP
-- 중간 합계 및 최종 합계를 도출
-- group by에서 두 개 이상의 컬럼으로 그룹 형성 시

-- 앞의 컬럼을 기준으로 중간 합계가 나오게 된다
SELECT
		 menu_price
		, category_code
		, SUM(menu_price)
  FROM tbl_menu
 GROUP BY menu_price, category_code
  WITH ROLLUP;
  
-- ------------------------------------------
CREATE TABLE sales (
    CODE INT AUTO_INCREMENT,
    YEAR VARCHAR(4),
    MONTH VARCHAR(2),
    product VARCHAR(50),
    amount DECIMAL(10,2),
    PRIMARY KEY(CODE)
);

INSERT 
    INTO sales 
(
  CODE, YEAR, MONTH
, product, amount
) 
VALUES
(
NULL, '2023', LPAD('1', 2, '0')
, 'Product A', 1000.00
),
(
NULL, '2023', LPAD('1', 2, '0')
, 'Product B', 1500.00
),
(
NULL, '2023', LPAD('2', 2, '0')
, 'Product A', 2000.00
),
(
NULL, '2023', LPAD('2', 2, '0')
, 'Product B', 2500.00
),
(
NULL, '2023', LPAD('3', 2, '0')
, 'Product A', 1200.00
),
(
NULL, '2024', LPAD('3', 2, '0')
, 'Product B', 1700.00
);

SELECT * FROM sales; 
-- 값을 안 넣어도 1, 2, 3, 4, 5, 6이 붙어 있음
-- 위에 AUTO_INCREMENT 를 붙였기 때문 - 번호 발생기
-- 자체적으로 알아서 번호를 기억도 하고 증가도 시킴

-- ' ' 붙이면 문자열
-- 월 앞에 0이 붙게 하고 싶어서 LPAD 함수 사용
-- L = Left

-- 연, 월, 상품명을 모두 하나의 그룹으로 묶어
-- 연, 월 중간 합계 및 전체 합계를 ROLLUP으로 구함
SELECT 
       year
      , month
      , product
      , SUM(amount) AS total_sales
  FROM sales
 GROUP BY YEAR, MONTH, product
  WITH ROLLUP;
  
-- 1월 것만 볼 거면 where 붙여서 보면 되지만 이 결과값은 table이 아님
-- 두 가지 방법이 있음 -1. 서브 쿼리 -2. 뷰
-- 그럼 여기로부터 월별 통계치를 조회할 수 있음
