-- 상관 서브쿼리
-- 메뉴 조회 시 메뉴의 카테고리에 있는 메뉴들의 평균 가격보다 높은 메뉴만 조회
-- 단일행 서브쿼리
SELECT
       a.menu_code
      , a.menu_name
      , a.menu_price
      , a.category_code
      , a.orderable_status
 FROM tbl_menu a
 WHERE a.menu_price > (SELECT AVG(menu_price)
                         FROM tbl_menu b
                        WHERE b.category_code = a.category_code);
                        
-- 자신의 카테고리의 평균과 같은 가격의 메뉴를 조회
-- 상관 서브쿼리 안 쓰고 다중행 서브쿼리               
SELECT
       *
  FROM tbl_menu a
 WHERE a.menu_code IN (SELECT AVG(b.menu_price)
                         FROM tbl_menu b
                        GROUP BY category_code);
                        
                        
-- --------------------------------------
-- 메뉴가 있는 카테고리 조회
SELECT
       category_code
      , category_name
  FROM tbl_category a
 WHERE EXISTS(SELECT 1
                FROM tbl_menu b
                WHERE b.category_code = a.category_code)
 ORDER BY 1;
 
-- 4번 카테고리를 메인 쿼리에서 where조건 판별 중 동작하는 서브쿼리
SELECT 1
 FROM tbl_menu b
 WHERE b.category_code = 4;
 
-- join을 활용한 메뉴가 있는 카테고리 조회도 해보기
SELECT
       a.category_code
      , a.category_name
  FROM tbl_category a
  JOIN tbl_menu b ON (a.category_code = b.category_code)
 GROUP BY a.category_code, a.category_name
 ORDER BY 1;
 
SELECT * FROM tbl_category;
SELECT * FROM tbl_menu;