
-- 부서테이블에서 부서코드가 D1, D2, D3인 부서만 조회 하세요

select dept_id ,instr('D1|D2|D3',DEPT_ID)
from DEPT
where instr('D1|D2|D3',DEPT_ID) >0 ; 

select *
from DEPT
where DEPT_ID = 'D1'
or DEPT_ID = 'D2'
or DEPT_ID = 'D3';

-- 사원테이블에서 주민등록번호의 뒤1자리까지 추출하고 오른쪽에 *문자를 채워서 출력

select rpad(substr(emp_no,1,8),14,'*')
from emp;

-- 사원테이블에서 여자사원의 모든컬럼을 조회 하세요

select *
from emp 
where substr(emp_no,8,1) in(2,4);

-- 사원 테이블의 주민등록 번호의 뒷번호 1번째 자리까지 추출

select rpad(substr(emp_no,1,8),14,'*')
from EMP;

-- EMP 테이블에서 BONUS로 내림차순 정렬
-- (단, BONUS 값이 일치할 경우 그때는 SALARY 가지고 오름차순정렬)
-- 사원명 보너스 급여 

select emp_name 사원명 , bonus 보너스, SALARY 급여 
from emp
order by 보너스 desc nulls last;


-- EMP 테이블에서 직급 코드가 J2 또는 J7 직급인 사원들 중 
-- 급여가 200만원 이상인 사원들의 모든 컬럼 조회

select *
from EMP
where Job_code in('J2','J7')
and salary >= 2000000;

-- EMP 테이블에서 D5 부서원들과 D6 부서원들, D8 부서원들의 사원명, 부서 코드, 급여 조회

select emp_name 사원명, dept_code "부서 코드" , salary 급여 
from emp
where instr('D5|D6|D8',dept_code)>0
order by dept_code asc;

-- EMP 테이블에서 부서 배치를 받진 않았지만 보너스는 받는 사원의 사원명, 부서 코드, 보너스 조회

select emp_name 사원명, dept_code "부서 코드", bonus 보너스
from emp
where DEPT_CODE is null
and bonus is not null ;

-- EMP 테이블에서 이메일 중 _ 앞 글자가 3자리인 이메일 주소(ex sun_di@or.kr)를 
-- 가진 사원의 사번 사원명, 이메일 조회
-- $_ : 이메일 주소에 _가 입력된 경우, _를 와일드 카드가 아닌 문자열로 사용

select emp_no 사번  , emp_name 사원명  , email 이메일 
from emp
where email like '___$_%' ESCAPE '$' ; 

-- EMP 테이블에서 입사일 '90/01/01' ~ '01/01/01'인 사원의 모든 컬럼 조회

select *
from EMP
where HIRE_DATE BETWEEN '01-01-90' AND '01-01-01' ; 

-- 2. EMP 테이블에서 연봉이 5000만원 이상인 직원의 직원명, 급여, 연봉, 입사일 조회

select emp_name 직원명, to_char(salary,'999,999,999') 급여, nvl(bonus,0) 보너스, to_char((salary*nvl(bonus,0)+salary)*12,'999,999,999') 연봉, hire_date 입사일 
from emp
where (salary*nvl(bonus,0)+salary)*12 >= 50000000
order by 연봉 DESC ;

SELECT  job_code
FROM    emp;

SELECT  distinct job_code
FROM    emp;

select  DISTINCT job_code 직급코드,  dept_code 부서코드
from    emp;

SELECT to_char(salary, '999,999,999') 
from emp;

SELECT  EMP_NAME || '사원의 급여는 ' || 
            to_char(salary, '999,999,999')
            || '원 입니다.' 사원급여
from    emp;





