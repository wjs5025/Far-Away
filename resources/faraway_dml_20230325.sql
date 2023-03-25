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

-- 회원 가입
insert into `faraway`.`users` (user_id, user_name, user_password, email_id, email_domain, join_date)
values 	('ssafy', '김싸피', '1234', 'ssafy', 'ssafy.com', now()), 
		('admin', '관리자', '1234', 'admin', 'google.com', now());
        
-- 로그인
select user_id,  user_name
from users
where user_id = 'ssafy' and user_password = 1234;

-- 회원 정보 조회

-- 회원 정보 수정

-- 회원 탈퇴

-- 회원 비밀번호 찾기