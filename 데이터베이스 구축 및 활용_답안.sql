������ ��� AI ���� �ַ�� ������ ��������

������� : �����ͺ��̽� ���� �� Ȱ��

- ���� : 21.02.02
- ���� : ������
- ���� : 75

�� HR TABLES(EMPLOYEES, DEPARTMENTS, COUNTRIES, JOB_HISSTORY, JOBS, LOCATIONS, REGIONS)�� Ȱ���Ͽ� ���� �������� �����ϼ���.
desc hr;
--Q1. HR EMPLOYEES ���̺��� �̸�, ����, 10% �λ�� ������ ����ϼ���.

select first_name, salary "����", salary*110/100  "10%�λ�� ����"
from employees;
    
--Q2.  2005�� ��ݱ⿡ �Ի��� ����鸸 ���



SELECT *
FROM EMPLOYEES
WHERE HIRE_DATE between '05/01/01' and '05/06/30';




--Q3. ���� SA_MAN IT_PROG ST_MAN �� ����� ���
SELECT *
FROM EMPLOYEES
WHERE JOB_ID in ('SA_MAN','IT_PROG','ST_MAN');

   
--Q4. manager_id �� 101���� 103�� ����� ���

SELECT
    *
FROM EMPLOYEES
WHERE MANAGER_ID between 101 and 103;

--Q5. EMPLOYEES ���̺��� LAST_NAME, HIRE_DATE �� �Ի����� 6���� �� ù ��° �������� ����ϼ���.
--SELECT LAST_NAME , HIRE_DATE,
select last_name, hire_date, to_char(next_day(add_months(hire_date,6),'������')) "6������ ������"
from employees;

--Q6. EMPLOYEES ���̺��� EMPLPYEE_ID, LAST_NAME, SALARY, HIRE_DATE �� �Ի��� �������� W_MONTH(�ټӿ���)�� ������ ����ؼ� ����ϼ���.(�ټӿ��� ���� ��������)

select last_name "�̸�", hire_date "�Ի���", trunc(months_between(sysdate,hire_date)) "�ټӿ���"
from employees
order by trunc(months_between(sysdate,hire_date)) desc;

--Q7. EMPLOYEES ���̺��� EMPLPYEE_ID, LAST_NAME, SALARY, HIRE_DATE �� �Ի��� �������� W_YEAR(�ټӳ��)�� ����ؼ� ����ϼ���.(�ټӳ�� ���� ��������)
select last_name "�̸�", hire_date "�Ի���", trunc((sysdate-hire_date+1) /365) "�ټӳ��"
from employees
order by trunc(months_between(sysdate,hire_date)) desc;

--Q8. EMPLOYEE_ID�� Ȧ���� ������ EMPLPYEE_ID�� LAST_NAME�� ����ϼ���.

select employee_id,last_name from employees
where mod(employee_id,2)= 1 ;


--Q9. EMPLOYEES ���̺��� EMPLPYEE_ID, LAST_NAME �� M_SALARY(����)�� ����ϼ���. �� ������ �Ҽ��� ��°�ڸ������� ǥ���ϼ���.
select employee_id , last_name , round(salary/12,2) "����"
from employees;

--Q10. EMPLOYEES ���̺��� EMPLPYEE_ID, LAST_NAME, SALARY, HIRE_DATE �� �Ի��� �������� �ټӳ���� ����ؼ� �Ʒ������� �߰��� �Ŀ� ����ϼ���.
--     ���������� �������� �ټӳ���� ���� 30 ������� ������  ��޿� ���� 1000���� ������ ������ BONUS �÷��� �������� �������� ����.    

select employee_id, LAST_NAME, SALARY, HIRE_DATE, trunc((sysdate-hire_date) /365) "�ټӳ��" ,
trunc((sysdate-hire_date) /365)*1000 "bonus"
from employees
order by trunc((sysdate-hire_date) /365);
--Q11. EMPLOYEES ���̺��� deparment_id �� ���� ������ �����Ͽ�  POSITION�� '����'���� ����ϼ���.
SELECT
    *
FROM employees

where department_id is null
;

update employees set department_id = '����'
where department_id is null;

--Q12. ����� 120���� ����� ���, �̸�, ����(job_id), ������(job_title)�� ���(join~on, where �� �����ϴ� �� ���� ��� ���)
select employee_id, first_name ,last_name, jobs.job_id,jobs.job_title
from employees ,jobs 
where jobs.job_id = employees.job_id and employees.employee_id =120;
--Q13.  employees ���̺��� �̸��� FIRST_NAME�� LAST_NAME�� �ٿ��� 'NAME' �÷������� ����ϼ���.
--��) Steven King

select first_name||(' ')||last_name "name"
from employees;

--Q14. HR EMPLOYEES ���̺��� �̸�, ����, 10% �λ�� ������ ����ϼ���.
--��� �ۼ��� �� ��� ���̺��� query���� �׿� ���� ������ ���� �߰��Ͻñ� �ٶ��ϴ�

select first_name, salary "����", salary*110/100 "10%�λ�� ����"
from employees;
    

--Q15. HR EMPLOYEES ���̺��� escape �ɼ��� ����Ͽ� �Ʒ��� ���� ��µǴ� SQL���� �ۼ��ϼ���.

--job_id Į������  _�� ���ϵ�ī�尡 �ƴ� ���ڷ� ����Ͽ� '_A'�� �����ϴ�  ��� ���� ���
select *
from employees
where job_id like '___A%';
--Q16. HR EMPLOYEES ���̺��� SALARY, LAST_NAME ������ �ø����� �����Ͽ� ����ϼ���.
select salary , last_name
from employees
order by salary asc, last_name asc;
--Q17. EMPLOYEES ���̺��� LAST_NAME, HIRE_DATE �� �Ի����� 6���� �� ù ��° �������� ����ϼ���.


--Q18. EMPLOYEES ���̺��� EMPLPYEE_ID, LAST_NAME, SALARY, HIRE_DATE �� �Ի��� �������� W_MONTH(�ټӿ���)�� ������ ����ؼ� ����ϼ���.(�ټӿ��� ���� ��������)

--Q19. EMPLOYEES ���̺��� EMPLPYEE_ID, LAST_NAME, SALARY, HIRE_DATE �� �Ի��� �������� W_YEAR(�ټӳ��)�� ����ؼ� ����ϼ���.(�ټӳ�� ���� ��������)

--Q20. Seo��� ����� �μ����� ����ϼ���.
select last_name, job_title, employee_id
from jobs ,employees
where employees.job_id = jobs.job_id and employees.last_name = 'Seo';