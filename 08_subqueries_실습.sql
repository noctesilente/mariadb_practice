-- 1. 가장 높은 급여를 받는 사원 조회하기 (MAX(컬럼명))
SELECT * FROM employee;

SELECT 
       *
  FROM employee 
 WHERE salary = ( SELECT MAX(salary)
                    FROM employee );

-- 2. 평균 급여가 가장 높은 부서 조회하기 AVG(컬럼명), MAX(컬럼명), (>=ALL)
SELECT * FROM department;
SELECT * FROM employee;

-- i) 이중 서브 쿼리를 활용한 방법

-- AVG가 들어갔음 -> 기능이 동작하는 함수지 컬럼 이름이 아님!
-- 컬럼을 지칭하고 싶으면 별칭을 달아야 함 
-- -> 서브 쿼리 바깥에서도 지칭이 가능해짐
-- 부서끼리 묶은 다음에 평균 salary 구하기
SELECT AVG(salary) AS sal_avg
  FROM employee
 GROUP BY dept_code;

-- 그 중에서 제일 높은 평균 구하기
SELECT MAX(a.sal_avg) AS max_avg
  FROM (SELECT AVG(salary) sal_avg
          FROM employee
         GROUP BY dept_code) a;
-- 이렇게 하면 결과가 하나(단일행) 나옴

DESC employee;
DESC department;

SELECT 
       a.dept_code
      , b.dept_title
  FROM employee a
  JOIN department b ON (b.DEPT_ID = a.DEPT_CODE)
 GROUP BY a.dept_code
HAVING AVG(a.salary) = (SELECT MAX(c.sal_avg)
                        FROM (SELECT AVG(salary) sal_avg
                                FROM employee
                               GROUP BY dept_code) c);
 
-- ii) >= ALL을 활용한 방법
-- 서브 쿼리 중에 다중행 서브 쿼리인 경우에는 
-- 비교 연산자가 일반 비교 연산자와 달라진다
-- > ALL, < ALL, > ANY, < ANY, IN 등의 연산자를 쓰게 됨

-- 1. > ALL : 모든 서브쿼리 결과보다 크다 (서브쿼리의 최대값보다 크다)
-- 2. < ALL : 모든 서브쿼리 결과보다 작다 (서브쿼리의 최소값보다 작다)
-- 3. > ANY : 서브쿼리 결과보다 최소 하나보다는 크다 (서브쿼리의 최소값보다 크다)
-- 4. < ANY : 서브쿼리 결과보다 최대 하나보다는 작다 (서브쿼리의 최대값보다 작다)
-- 5. IN : 서브쿼리 결과 중에 하나라도 일치한다

SELECT 
       dept_code
  FROM employee
 GROUP BY dept_code
HAVING AVG(salary) >= ALL(SELECT AVG(salary)
                            FROM employee
                           GROUP BY dept_code);
 