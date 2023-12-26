SELECT
	    menu_code
    , menu_name
    , category_code
 FROM tbl_menu;
 
 DESC tbl_category;
 
 SELECT
 		category_code
 	 , category_name
 	 , ref_category_code
	FROM tbl_category;
	

SELECT 
		menu_name
	 , category_name
	FROM tbl_menu a
	JOIN tbl_category b ON (a.category_code = b.category_code);
		
-- ------------------------------------------------------------------

SELECT 7 + 3;
SELECT 10 * 2;
SELECT 7 + 3 AS '합', 10 * 2 AS '곱';
SELECT 7 + 3 '합', 10 * 2 '곱';
SELECT 7 + 3 합, 10 * 2 곱;
SELECT 7 + 3 '합 입니다.', 10 * 2 AS '곱 입니다.';

-- 특수기호가 들어간 별칭은 싱글 쿼테이션(')이 반드시 필요하다.
SELECT 7 + 3 합 입니다., 10 * 2 AS 곱 입니다.;

-- ----------------------------------------------------------------------

SELECT 6 % 3, 6 % 4;
-- modulus(=mod) 연산자: 피제수 % 제수 -> 나머지 

SELECT NOW();
SELECT NOW() AS '현재 시간';

-- ------------------------------------------------------------------------

SELECT CONCAT('유', ' ', '관순');

