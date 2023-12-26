-- distinct
-- distinct는 해당 컬럼의 종류를 보여준다

SELECT
		 category_code
  FROM tbl_menu;
  
SELECT
		 DISTINCT category_code
  FROM tbl_menu;
  

-- 안 되는 경우
-- distinct 사용 시에는 일반 컬럼을 사용할 수 없다.
-- distinct가 무의미해지기 때문에
SELECT
		 DISTINCT category_code  -- 8바퀴
	  , menu_name               -- 21바퀴
  FROM tbl_menu;
-- 이거 안 됨! menu_name은 그룹별이 아니기 때문


-- null값을 포함한 컬럼의 distinct
SELECT
		 DISTINCT ref_category_code
  FROM tbl_category;
  
  
-- null을 나중으로 보내는 정렬을 해보기
SELECT
		 DISTINCT ref_category_code -- 실제 테이블에 존재하는 것이 아님(첫째 줄=1)
  FROM tbl_category
 ORDER BY 1 DESC;
 
 
SELECT
		 DISTINCT ref_category_code 
  FROM tbl_category
 ORDER BY ref_category_code DESC;

 
SELECT
		 DISTINCT ref_category_code 
  FROM tbl_category
 ORDER BY ref_category_code DESC;


-- 별칭 사용
SELECT
		 DISTINCT ref_category_code AS 'rcc'
  FROM tbl_category
 ORDER BY -rcc DESC;


-- 이건 안 돌아감
-- syntax 에러(문법 에러)가 발생한다
SELECT
		 DISTINCT ref_category_code
  FROM tbl_category
 ORDER BY distinct ref_category_code DESC;
-- disntinct를 이용한 정렬은 순번이나 별칭을 사용하지 않고는 정렬 불가능!!

-- 반드시 별칭으로! 예시
SELECT
		 SUM(menu_price) AS 'sum'
  FROM tbl_menu 
 GROUP BY category_code
 ORDER BY menu_price;
 
DESC tbl_menu;

-- -------------------------
-- 돌아는 가지만 안 좋음
-- 컬럼 2개 이상도 distinct로 묶을 수는 있지만 좋은 형태는 아니다
-- 컬럼 2개 이상부터는 이후 배울 group by절을 통해 중복 제거를 하자
SELECT
		 DISTINCT category_code, orderable_status
  FROM tbl_menu;





