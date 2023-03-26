/*
board table schema
+---------------+---------------+------+-----+-------------------+-------------------+
| Field         | Type          | Null | Key | Default           | Extra             |
+---------------+---------------+------+-----+-------------------+-------------------+
| board_id      | int           | NO   | PRI | NULL              | auto_increment    |
| user_id       | varchar(16)   | YES  | MUL | NULL              |                   |
| title         | varchar(100)  | YES  |     | NULL              |                   |
| content       | varchar(2000) | YES  |     | NULL              |                   |
| category      | varchar(20)   | NO   |     | NULL              |                   |
| hit           | int           | YES  |     | 0                 |                   |
| register_time | timestamp     | NO   |     | CURRENT_TIMESTAMP | DEFAULT_GENERATED |
+---------------+---------------+------+-----+-------------------+-------------------+
*/
/*
users table schema
+---------------+-------------+------+-----+-------------------+-------------------+
| Field         | Type        | Null | Key | Default           | Extra             |
+---------------+-------------+------+-----+-------------------+-------------------+
| user_id       | varchar(16) | NO   | PRI | NULL              |                   |
| user_name     | varchar(20) | NO   |     | NULL              |                   |
| user_password | varchar(16) | NO   |     | NULL              |                   |
| email_id      | varchar(20) | YES  |     | NULL              |                   |
| email_domain  | varchar(45) | YES  |     | NULL              |                   |
| join_date     | timestamp   | NO   |     | CURRENT_TIMESTAMP | DEFAULT_GENERATED |
+---------------+-------------+------+-----+-------------------+-------------------+
*/
/* 회원 등록 */
insert into `ssafyweb`.`users` (user_id, user_name, user_password, email_id, email_domain, join_date)
values ('user01', '홍길동', 'password01', 'user01', 'work.com', now());

insert into `ssafyweb`.`users` (user_id, user_name, user_password, email_id, email_domain)
values ('user02', '강감찬', 'password02', 'user02', 'work.com');

/* 회원 전체조회 */
select *
from users
order by join_date desc;

/* 회원 상세조회 */
select *
from users
where user_id = 'ssafy';

/* 회원 변경 : 이름, 비번, 이메일_아이디, 이메일_도메인 */
update users 
set user_name='전인혁', user_password='1111', email_id='jeon', email_domain='ssafy.com'
where user_id = 'ssafy';

/* 회원 삭제 */  
delete from users where user_id='ssafy';
  
/* 로그인 */  
select user_id, user_name
from users
where user_id = 'ssafy' and user_password = '1234';

/* 아이디 찾기 : 이름, 이메일 */
select user_id
from users
where user_name='관리자' and concat(email_id, '@', email_domain) = 'admin@google.com';

/* 비밀번호 찾기 : 아이디, 이름, 이메일 */
select user_password
from users
where user_id = 'admin' and user_name='관리자' and concat(email_id, '@', email_domain) = 'admin@google.com';
/*
attraction_info schema
+-----------------+----------------+------+-----+---------+-------+
| Field           | Type           | Null | Key | Default | Extra |
+-----------------+----------------+------+-----+---------+-------+
| content_id      | int            | NO   | PRI | NULL    |       |
| content_type_id | int            | YES  | MUL | NULL    |       |
| title           | varchar(100)   | YES  |     | NULL    |       |
| addr1           | varchar(100)   | YES  |     | NULL    |       |
| addr2           | varchar(50)    | YES  |     | NULL    |       |
| zipcode         | varchar(50)    | YES  |     | NULL    |       |
| tel             | varchar(50)    | YES  |     | NULL    |       |
| first_image     | varchar(200)   | YES  |     | NULL    |       |
| first_image2    | varchar(200)   | YES  |     | NULL    |       |
| readcount       | int            | YES  |     | NULL    |       |
| sido_code       | int            | YES  | MUL | NULL    |       |
| gugun_code      | int            | YES  | MUL | NULL    |       |
| latitude        | decimal(20,17) | YES  |     | NULL    |       |
| longitude       | decimal(20,17) | YES  |     | NULL    |       |
| mlevel          | varchar(2)     | YES  |     | NULL    |       |
+-----------------+----------------+------+-----+---------+-------+
*/
select * from attraction_info limit 10;

select * from sido;
select * from gugun where sido_code = 1;

select *
from attraction_info
where content_type_id = null or sido_code = null or gugun_code = null;