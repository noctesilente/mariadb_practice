-- INSERT 구문

INSERT 
  INTO tbl_menu
VALUES
(
   NULL, '바나나해장국'
,  8500, 4
, 'Y' 
);

-- 메뉴를 추가할 때 메뉴 이름이랑 가격을 추가하고 나머지를 안 넣고 싶으면?

INSERT 
  INTO tbl_menu
(
   menu_price
,  menu_name
)
VALUES
(
   8500, 
,  '바나나해장국' 
);

-- INTO 밑에 다 쓰는 걸 추천함!
-- 이 테이블의 컬럼이 뭔지 desc를 통해 확인함
DESC tbl_menu;

INSERT 
  INTO tbl_menu
(  
  menu_code
, menu_name
, menu_price
, category_code
, orderable_status
)
VALUES
(
   NULL
,  '바나나해장국'
,  8500
,  4
,  'Y' 
);

-- 들어간 행 확인
SELECT * FROM tbl_menu ORDER BY 1 DESC;

DELETE 
  FROM tbl_menu
 WHERE menu_code = 23;
-- auto increment가 되어 있기 때문에 삭제하고 다른 행을 삽입하면 23이 아니라 24로 뜸
-- 애초에 이 auto increment를 지울 일이 없긴 함


UPDATE tbl_menu -- table 이름
   SET menu_name = '딸기해장국'   -- 컬럼 이름
 WHERE menu_code = 22;
-- 들어간 행 확인
SELECT * FROM tbl_menu ORDER BY 1 DESC;

-- --------------------------------------------------
-- 17이 뭔지 확인
SELECT * FROM tbl_menu WHERE menu_code = 17;

REPLACE
  INTO tbl_menu
(
  menu_code,  menu_name,  menu_price
,  category_code,  orderable_status
)
VALUES
(
  17, '아샷추매운탕', 9000
,  4, 'N'
);
