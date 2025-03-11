CREATE SEQUENCE question_seq
    START WITH 1
    INCREMENT BY 1
    NOMAXVALUE;
    
CREATE SEQUENCE answer_seq
    START WITH 1
    INCREMENT BY 1
    NOMAXVALUE;
    
INSERT INTO question (ID, SUBJECT, CONTENT, CREATE_DATE)
VALUES (QUESTION_SEQ.NEXTVAL, '플라스크 질문', '플라스크는 무엇인가요?', SYSDATE);

INSERT INTO question (ID, SUBJECT, CONTENT, CREATE_DATE)
VALUES (QUESTION_SEQ.NEXTVAL, 'Flask Question', '플라스크는 무엇인가요?', SYSDATE);

select * from Question;
select * from Answer;

delete from question;
commit;

CREATE SEQUENCE users_seq
    START WITH 1
    INCREMENT BY 1;
    
CREATE TABLE users (
    id NUMBER PRIMARY KEY,
    username VARCHAR2(150) NOT NULL UNIQUE,
    password VARCHAR2(200) NOT NULL,
    email VARCHAR2(120) NOT NULL UNIQUE
);

drop table users;
drop sequence users_seq;

select * from users;

ALTER TABLE question ADD user_id NUMBER NULL;
UPDATE question SET user_id = (SELECT MIN(id) FROM users);
ALTER TABLE question MODIFY user_id NUMBER NOT NULL;
ALTER TABLE question ADD CONSTRAINT fk_question_user FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE;
ALTER TABLE question ADD modify_date DATE NULL;

ALTER TABLE answer ADD user_id NUMBER;
update answer set user_id = (select min(id) from users);
alter table answer modify user_id number not null;
ALTER TABLE answer ADD CONSTRAINT fk_answer_user
    FOREIGN KEY (user_id)
    REFERENCES users(id)
    ON DELETE CASCADE;
    
ALTER TABLE answer ADD modify_date DATE;
commit;