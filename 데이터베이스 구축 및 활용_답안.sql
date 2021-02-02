빅데이터 기반 AI 응용 솔루션 개발자 전문과정

교과목명 : 데이터베이스 구축 및 활용

- 평가일 : 21.02.02
- 성명 : 전병수
- 점수 : 75

※ HR TABLES(EMPLOYEES, DEPARTMENTS, COUNTRIES, JOB_HISSTORY, JOBS, LOCATIONS, REGIONS)를 활용하여 다음 질문들을 수행하세요.
desc hr;
--Q1. HR EMPLOYEES 테이블에서 이름, 연봉, 10% 인상된 연봉을 출력하세요.

select first_name, salary "연봉", salary*110/100  "10%인상된 연봉"
from employees;
    
--Q2.  2005년 상반기에 입사한 사람들만 출력



SELECT *
FROM EMPLOYEES
WHERE HIRE_DATE between '05/01/01' and '05/06/30';




--Q3. 업무 SA_MAN IT_PROG ST_MAN 인 사람만 출력
SELECT *
FROM EMPLOYEES
WHERE JOB_ID in ('SA_MAN','IT_PROG','ST_MAN');

   
--Q4. manager_id 가 101에서 103인 사람만 출력

SELECT
    *
FROM EMPLOYEES
WHERE MANAGER_ID between 101 and 103;

--Q5. EMPLOYEES 테이블에서 LAST_NAME, HIRE_DATE 및 입사일의 6개월 후 첫 번째 월요일을 출력하세요.
--SELECT LAST_NAME , HIRE_DATE,
select last_name, hire_date, to_char(next_day(add_months(hire_date,6),'월요일')) "6개월후 월요일"
from employees;

--Q6. EMPLOYEES 테이블에서 EMPLPYEE_ID, LAST_NAME, SALARY, HIRE_DATE 및 입사일 기준으로 W_MONTH(근속월수)를 정수로 계산해서 출력하세요.(근속월수 기준 내림차순)

select last_name "이름", hire_date "입사일", trunc(months_between(sysdate,hire_date)) "근속월수"
from employees
order by trunc(months_between(sysdate,hire_date)) desc;

--Q7. EMPLOYEES 테이블에서 EMPLPYEE_ID, LAST_NAME, SALARY, HIRE_DATE 및 입사일 기준으로 W_YEAR(근속년수)를 계산해서 출력하세요.(근속년수 기준 내림차순)
select last_name "이름", hire_date "입사일", trunc((sysdate-hire_date+1) /365) "근속년수"
from employees
order by trunc(months_between(sysdate,hire_date)) desc;

--Q8. EMPLOYEE_ID가 홀수인 직원의 EMPLPYEE_ID와 LAST_NAME을 출력하세요.

select employee_id,last_name from employees
where mod(employee_id,2)= 1 ;


--Q9. EMPLOYEES 테이블에서 EMPLPYEE_ID, LAST_NAME 및 M_SALARY(월급)을 출력하세요. 단 월급은 소수점 둘째자리까지만 표현하세요.
select employee_id , last_name , round(salary/12,2) "월급"
from employees;

--Q10. EMPLOYEES 테이블에서 EMPLPYEE_ID, LAST_NAME, SALARY, HIRE_DATE 및 입사일 기준으로 근속년수를 계산해서 아래사항을 추가한 후에 출력하세요.
--     현지시점을 기준으로 근속년수에 따라 30 등급으로 나누고  등급에 따라 1000원의 수당을 산정한 BONUS 컬럼을 기준으로 내림차순 정렬.    

select employee_id, LAST_NAME, SALARY, HIRE_DATE, trunc((sysdate-hire_date) /365) "근속년수" ,
trunc((sysdate-hire_date) /365)*1000 "bonus"
from employees
order by trunc((sysdate-hire_date) /365);
--Q11. EMPLOYEES 테이블에서 deparment_id 가 없는 직원을 추출하여  POSITION을 '신입'으로 출력하세요.
SELECT
    *
FROM employees

where department_id is null
;

update employees set department_id = '신입'
where department_id is null;

--Q12. 사번이 120번인 사람의 사번, 이름, 업무(job_id), 업무명(job_title)을 출력(join~on, where 로 조인하는 두 가지 방법 모두)
select employee_id, first_name ,last_name, jobs.job_id,jobs.job_title
from employees ,jobs 
where jobs.job_id = employees.job_id and employees.employee_id =120;
--Q13.  employees 테이블에서 이름에 FIRST_NAME에 LAST_NAME을 붙여서 'NAME' 컬럼명으로 출력하세요.
--예) Steven King

select first_name||(' ')||last_name "name"
from employees;

--Q14. HR EMPLOYEES 테이블에서 이름, 연봉, 10% 인상된 연봉을 출력하세요.
--답안 작성시 각 요약 테이블의 query문과 그에 대한 간단한 설명도 추가하시기 바랍니다

select first_name, salary "연봉", salary*110/100 "10%인상된 연봉"
from employees;
    

--Q15. HR EMPLOYEES 테이블에서 escape 옵션을 사용하여 아래와 같이 출력되는 SQL문을 작성하세요.

--job_id 칼럼에서  _을 와일드카드가 아닌 문자로 취급하여 '_A'를 포함하는  모든 행을 출력
select *
from employees
where job_id like '___A%';
--Q16. HR EMPLOYEES 테이블에서 SALARY, LAST_NAME 순으로 올림차순 정렬하여 출력하세요.
select salary , last_name
from employees
order by salary asc, last_name asc;
--Q17. EMPLOYEES 테이블에서 LAST_NAME, HIRE_DATE 및 입사일의 6개월 후 첫 번째 월요일을 출력하세요.


--Q18. EMPLOYEES 테이블에서 EMPLPYEE_ID, LAST_NAME, SALARY, HIRE_DATE 및 입사일 기준으로 W_MONTH(근속월수)를 정수로 계산해서 출력하세요.(근속월수 기준 내림차순)

--Q19. EMPLOYEES 테이블에서 EMPLPYEE_ID, LAST_NAME, SALARY, HIRE_DATE 및 입사일 기준으로 W_YEAR(근속년수)를 계산해서 출력하세요.(근속년수 기준 내림차순)

--Q20. Seo라는 사람의 부서명을 출력하세요.
select last_name, job_title, employee_id
from jobs ,employees
where employees.job_id = jobs.job_id and employees.last_name = 'Seo';