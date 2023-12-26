 -- orderable_status = 'N'인 행들 조회하기
 -- 주문 불가능한 메뉴 조회(메뉴명, 메뉴코드)
SELECT 
 		 menu_name
 	  , menu_code
--  	  , orderable_status    -- 여기다가 이걸 추가하면 진짜 N인 애들만 나옴
  FROM tbl_menu
 WHERE orderable_status = 'N';
 
-- DESC를 통한 컬럼명 빠르게 확인
DESC tbl_menu; 

-- --------------------------------------------------------
-- '기타' 카테고리에 해당하지 않는 메뉴를 조회하시오.
-- 1) '기타' 카테고리의 번호 파악하기
-- SELECT * FROM tbl_category; 
SELECT * FROM tbl_category WHERE category_name = '기타';  -- 기타 카테고리가 '10번'임을 알아냄

-- 2) 해당 번호를 가지지 않는 메뉴 조회
-- SELECT * FROM tbl_menu;
SELECT * FROM tbl_menu WHERE category_code != 10;
SELECT * FROM tbl_menu WHERE category_code <> 10;


-- ---------------------------------------------------------
-- 10,000원 이상(>=)의 메뉴 조회
SELECT * FROM tbl_menu WHERE menu_price >= 10000;

-- 세로로 쓸 때
SELECT 
		 *
  FROM tbl_menu
 WHERE menu_price >= 10000;

-- 10,000원 미만(<)의 메뉴 조회
SELECT * FROM tbl_menu WHERE menu_price < 10000;

-- 10,000원 이상  12,000원 이하 메뉴 조회
SELECT * FROM tbl_menu WHERE menu_price >= 10000 AND menu_price <= 12000;

-- 세로로 쓸 떄
SELECT 
		 * 
  FROM tbl_menu 
 WHERE menu_price >= 10000 
   AND menu_price <= 12000;


-- 논리 연산자(=참과 거짓의 연산) - And, Or
-- 조카가 타고 싶은 롤러코스터는 7세 이상, 100cm 이상만 가능
-- (AND, 둘 다 만족, 이면서, 그리고, 동시에)
SELECT
		 *
  FROM newphew
 WHERE age >= 7
   AND height >= 100;

-- 내 친구는 콜라도 좋아하고 사이다도 상관없다. (콜라 또는 사이다)
-- (OR, 둘 중에 아무거나, 이거나, 또는)
SELECT
		 *
  FROM friend
 WHERE beverage = 'coke' 
    OR beverage = 'sprite';

-- ----------------------------
-- where절에서 and와 or을 통한 결과 비교
SELECT
		menu_code
	 , menu_name
	 , menu_price
	 , category_code
	 , orderable_status
  FROM tbl_menu
 WHERE menu_price > 5000
    AND category_code = 10;
    
SELECT
		menu_code
	 , menu_name
	 , menu_price
	 , category_code
	 , orderable_status
  FROM tbl_menu
 WHERE menu_price > 5000
    OR category_code = 10;
    
-- ------------------------------------------------
-- between 연산자 활용하기(feat. 이상 이하만 가능(초과, 미만은 불가능)
-- 가격이 5000원 이상 9000원 이하인 메뉴 전체 컬럼 조회
SELECT
		 *
  FROM tbl_menu
 WHERE menu_price >= 5000
   AND menu_price <= 9000;
   
SELECT
		 *
  FROM tbl_menu
 WHERE menu_price BETWEEN 5000 AND 9000;
 

-- 반대의 범위로 테스트하기
SELECT
		 *
  FROM tbl_menu
 WHERE menu_price < 5000
    OR menu_price > 9000;
   
SELECT
		 *
  FROM tbl_menu
 WHERE NOT menu_price BETWEEN 5000 AND 9000;
-- WHERE menu_price NOT BETWEEN 5000 AND 9000;
-- not의 위치는 컬럼명 앞뒤로 가능
 
-- -----------------------------------------------
-- LIKE
-- 메뉴 중에 '밥'이 들어간 메뉴 조회
SELECT 
 		 *
   FROM tbl_menu
 WHERE menu_name LIKE '%밥%';
 
-- 메뉴 중에 '밥'이 들어가지 않는 메뉴 조회
SELECT 
 		 *
   FROM tbl_menu
 WHERE NOT menu_name LIKE '%밥%';
 
-- ------------------------------------------------
-- in연산자
 
SELECT
		 *
  FROM tbl_menu
 WHERE category_code = 5
    OR category_code = 8
    OR category_code = 10;

-- in 연산자 활용

SELECT
		 *
  FROM tbl_menu
 WHERE category_code IN (5, 8, 10);
 
-- -------------------------------------------------
-- is null 연산자 활용
 
SELECT * FROM tbl_category;

-- ref_category_code(상위 카테고리 번호)가 없는 카테고리 조회

SELECT
		 *
  FROM tbl_category
 WHERE ref_category_code IS NULL;
 
-- 반대도 해보기
SELECT 
 		 *
  FROM tbl_category
 WHERE ref_category_code IS NOT NULL;
 
SELECT 
 		 *
  FROM tbl_category
 WHERE NOT ref_category_code IS NULL;
 
 
 


