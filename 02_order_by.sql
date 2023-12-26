-- 오름차순
SELECT
	    menu_code
	 ,  menu_name
	 ,  menu_price
	FROM tbl_menu
-- ORDER BY menu_price ASC; -- ascending: 오름차순, descending: 내림차순
 ORDER BY menu_price;
 
 -- 내림차순
 select
 		 menu_code
 	  , menu_name
 	  , menu_price
   FROM tbl_menu
  ORDER BY menu_price DESC;
  
 -- 컬럼의 순번을 활용한 정렬(실제 테이블의 순서가 아닌 조회할 때의 컬럼 순서 기준)
SELECT 
       menu_price    -- 1번째
     , menu_name     -- 2번째
   FROM tbl_menu
 ORDER BY 1 ASC ;
 
 --별칭을 활용한 정렬
SELECT 
	    menu_code AS 'mc'
	  , menu_price AS 'mp'
	  , menu_name AS 'mn'
  FROM tbl_menu
 ORDER BY 'mp' DESC;   -- 별칭으로 정렬할 때는 별칭명에 single quatation(')을 붙이면 안 된다.
 
 -- 컬럼의 복수개로 정렬
SELECT 
       menu_price
     , menu_name
  FROM tbl_menu
 ORDER BY 1 DESC, 2 ASC;
 -- 1 DESC 가 먼저 나와야 되는 정렬 기준이 높은 것 -- 그래도 똑같으면 2 ASC 기준을 봐주기
 -- '가격'으로 내림차순 후 같은 가격일 시, '메뉴 이름'을 오름차순으로 조회
 
 
 -- -------------------------------------------------
 -- Field
 SELECT FIELD('a', 'b', 'z', 'a');  -- 2번째 이후 인자 중에 1번째 인자의 값이 위치하는 값이 나옴(=3)
 -- 처음 a가 찾고자 하는 대상 뒤의 3개에서 찾기 -> 찾아낸 숫자 중 몇 번째에 있는가? 3번째 -> 3이 나옴
 -- field 통해서도 정렬을 할 수 있음
 
 -- table에서 조회 시 field 활용
SELECT 
		 FIELD(orderable_status, 'N', 'Y')
	  , orderable_status
	  , menu_name
	  , menu_code
 FROM tbl_menu;
 -- 이 테이블이 가진 행마다 하고 있음
 
 
 -- field를 활용한 order by
SELECT
		 menu_name
	  , orderable_status
 FROM tbl_menu
 ORDER BY FIELD(orderable_status, 'N', 'Y') DESC; 
 
-- --------------------------------------------------------------
-- null 값에 대한 정렬(그 칸에 아무것도 없다는 뜻)
-- 1) 오름차순 시: NULL 값이 먼저 나옴(제일 위에 나옴)

SELECT
		 *
  FROM tbl_category
 ORDER BY ref_category_code ASC;

-- 2) 내림차순 시: NULL 값이 나중에 나옴(맨 마지막에 나옴)
SELECT
		 *
  FROM tbl_category
 ORDER BY ref_category_code DESC;
 
 -- 3) 오름차순에서 NULL이 나중에 나오도록 바꿈
SELECT 
		 *
  FROM tbl_category
 ORDER BY -ref_category_code DESC;  -- DESC를 통해 Null을 나중에 보냄 -> -로 Null이 아닌 값을 ASC로 바꿈
 
 -- 4) 내림차순에서 NULL이 처음에 오도록 바꿈
SELECT 
		 *
  FROM tbl_category
 ORDER BY -ref_category_code ASC;   -- ASC를 통해 Null을 처음으로 보냄 -> -로 Null이 아닌 값을 DESC로 바꿈
 
 
 