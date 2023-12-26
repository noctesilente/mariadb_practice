-- employee 과제 db(employeedb)에서 실행해볼 것
-- 유재식 씨의 부서와 같은 부서에서 일하는 직원

SELECT * FROM employee;
-- 서브쿼리
SELECT dept_code FROM employee WHERE emp_name = '유재식'; -- D6
-- 메인쿼리
SELECT * FROM employee WHERE dept_code = 'D6'; -- 유재식 씨와 같은 부서에서 일하는 직원(본인 포함)

-- 두 개를 한 번에 조회하는 방법 - 서브쿼리
-- 메인 쿼리를 추출하기 위한 것 = 서브쿼리
-- 쿼리 한 개가 나머지 한 개를 도와주는 관계이다 -> 도와주는 쿼리가 서브쿼리

-- 서브쿼리를 포함한 메인 쿼리
SELECT 
       *
  FROM employee
 WHERE dept_code = (SELECT dept_code 
                      FROM employee
                     WHERE emp_name = '유재식');
                     

-- 이와 같은 방법으로 유재식 씨 사원 번호를 추출해서 해당 사원을 제거해보기
SELECT
       *
  FROM employee
 WHERE dept_code = (SELECT dept_code
                      FROM employee
                     WHERE emp_name = '유재식')
   AND emp_id <> (SELECT emp_id 
                    FROM employee
                   WHERE emp_name = '유재식');
-- 두 조건을 다 만족해야 돼서 AND 사용

