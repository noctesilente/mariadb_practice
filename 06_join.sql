SELECT
		 *
  FROM tbl_menu
  JOIN tbl_category ON tbl_menu.category_code = tbl_category.category_code;

-- -----------------------------------------------

-- 조인할 두 테이블 각각 조회
SELECT
		 *
  FROM tbl_menu;

SELECT
		 *
  FROM tbl_category;

-- 메뉴명과 카테고리명만 조회

SELECT
		 menu_name
	 ,  category_name
  FROM tbl_menu
  JOIN tbl_category ON (tbl_menu.category_code = tbl_category.category_code);

-- 너무 길다고 느끼면 테이블 명도 별칭(alias)을 붙일 수 있음
SELECT
		 menu_name
	 ,  category_name
  FROM tbl_menu a
  JOIN tbl_category b ON (a.category_code = b.category_code);

-- 두 테이블에 같은 컬럼명이 있는 상태에서 조인 시 주의할 점
SELECT
		 menu_name -- 별칭 안 붙어도 a에만 있는 거니까 오류 없이 돌아감
	 ,  category_name
  FROM tbl_menu a
  JOIN tbl_category b ON (a.category_code = b.category_code);
-- 두 테이블이 동일한 컬럼일 시 별칭 필수
  

SELECT 
		 menu_name
	  , category_name
	  , a.category_code  -- select 절도 동일한 컬럼은 별칭을 필수로 달아야 한다. 
  FROM tbl_menu a
  JOIN tbl_category b ON (a.category_code = b.category_code);


-- 관례상 join 시에는 쿼리에 사용되는 모든 컬럼에 별칭을 다는 것을 원칙으로 한다.

SELECT
		 a.menu_name
	  , b.category_name
	  , a.category_code
  FROM tbl_menu a
  JOIN tbl_category b ON (a.category_code = b.category_code);
 WHERE b.category_code = 8;
  


-- ---------------------------------------------
-- 1) inner join
-- on 또는 using 뒤에 오는 join의 조건을 만족하여 매칭되는 결과들만 join됨
SELECT
		 *
  FROM tbl_menu a
  JOIN tbl_category b ON (a.category_code = b.category_code)
 WHERE b.category_code = 7;
-- 조회 자체가 안 됨
-- 조회 결과 없음 (7번 카테고리(퓨전)는 존재하지만 join에는 존재 X)


-- 2) left join
-- join 키워드 기준 왼쪽 테이블의 행이 모두 나오도록 join
-- 이미 가지고 있는 데이터에서는 inner를 해도 다 나옴


-- 3) right join
-- join 키워드 기준 오른쪽 테이블의 행이 모두 나오도록 join
SELECT
		 *
  FROM tbl_menu a 
  JOIN tbl_category b USING (category_code);

SELECT 
		 *
  FROM tbl_menu a
  RIGHT JOIN tbl_category b USING (category_code);


-- 4) cross join
-- cross join은 의도했다기보다는 on에 쓰는 join 조건을 잘못 썼을 가능성이 높다.
SELECT
		 *
  FROM tbl_menu a
  JOIN tbl_category b ON (1=1);
-- (1=1): True라는 뜻
  
SELECT
		 *
  FROM tbl_menu a
  CROSS JOIN tbl_category b;


-- 5) self join
-- self join은 하나의 테이블에 상위 개념과 하위 개념이 모두 들어있을 때 
-- 자기 자신 테이블을 join하게 되는 경우에 사용한다.
-- (ex) 신입사원 vs 사수(선배사원)
-- 하위 카테고리 vs 상위 카테고리
-- 댓글 vs 대댓글 등)
SELECT
		 *
  FROM tbl_category;
  
SELECT
		 a.category_name
	  , b.category_name
  FROM tbl_category a
  JOIN tbl_category b ON (a.ref_category_code = b.category_name);
  
  