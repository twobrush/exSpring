-- 실습용으로 배포된 mysql 실행 (포트 3306)
-- 실행방법 : C:\eGovFrame-3.7.0\bin\mysql-5.6.21\startup.bat 더블클릭
-- 종료방법 : C:\eGovFrame-3.7.0\bin\mysql-5.6.21\stop.bat 더블클릭
-- 접속 정보 (Database/username/password) : com/com/com01 , hyb/hyb/hyb01, mobile/mobile/mobile01 
-- Data Source Explorer에 이미 com 커넥션 정보가 등록되어 있음

-- MEMBER 테이블 생성 
-- MEM_ID, MEM_PASS, MEM_NAME, MEM_POINT 컬럼을 정의
CREATE TABLE member
( mem_id VARCHAR(50) PRIMARY KEY,
  mem_pass VARCHAR(50),
  mem_name VARCHAR(50),
  mem_point NUMERIC(10,0)
-- , mem_reg_date DATETIME DEFAULT CURRENT_TIMESTAMP
-- , PRIMARY KEY ('mem_id')
);

select * from member;

-- BBS 테이블 생성  
-- MySQL 5.6.5, MariaDB 10.0 버전부터 DEFAULT CURRENT_TIMESTAMP, ON UPDATE CURRENT_TIMESTAMP 설정 가능
CREATE TABLE bbs
( bbs_no INT PRIMARY KEY AUTO_INCREMENT, 
  bbs_title VARCHAR(100),
  bbs_content TEXT,
  bbs_writer VARCHAR(50),
  bbs_reg_date DATETIME DEFAULT CURRENT_TIMESTAMP 
-- , bbs_mod_date DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
-- , bbs_count NUMERIC(10,0)
-- , FOREIGN KEY ('bbs_writer') REFERENCES 'member' ('mem_id')
);

-- member 테이블에 레코드 1개 추가
-- mem_id는 'a001', mem_pass는 '1234', 
-- mem_name은 '고길동', mem_point는 100로 저장
INSERT INTO member 
( mem_id, mem_pass, mem_name, mem_point )
VALUES ( 'a001', '1234', '고길동', 100 );

INSERT INTO bbs ( bbs_title, bbs_content, bbs_writer  ) VALUES ( '제목60', '내용111', 'a001' );
commit;

SELECT bbs_no, bbs_title, bbs_content, bbs_writer, bbs_reg_date FROM bbs WHERE bbs_title like CONCAT('%', '1', '%')limit , 10; 

-- 첨부파일 테이블 생성  
CREATE TABLE attach
( att_no INT PRIMARY KEY AUTO_INCREMENT, 
  att_org_name VARCHAR(255),
  att_new_name VARCHAR(255),
  att_bbs_no INT REFERENCES bbs (bbs_no)
--  ,PRIMARY KEY (att_no) 
--  ,FOREIGN KEY (att_bbs_no) REFERENCES attach (att_no)
);

-- 댓글 테이블 생성  
CREATE TABLE reply
( rep_no INT PRIMARY KEY AUTO_INCREMENT, 
  rep_content TEXT,
  rep_writer VARCHAR(50) REFERENCES member (mem_id),
  rep_date DATETIME DEFAULT CURRENT_TIMESTAMP,
  rep_bbs_no INT REFERENCES bbs (bbs_no)
--  ,PRIMARY KEY (bbs_no) 
--  ,FOREIGN KEY (rep_bbs_no) REFERENCES bbs (bbs_no)
--  ,FOREIGN KEY (rep_writer) REFERENCES member (mem_id)
);