CREATE TABLE course (
    course_name VARCHAR(255) PRIMARY KEY
);

CREATE TABLE student (
    student_name VARCHAR(255) PRIMARY KEY
);

CREATE TABLE student_course (
    student_name VARCHAR(255),
    course_name VARCHAR(255)
);

INSERT INTO course (course_name) VALUES ('english');
INSERT INTO course (course_name) VALUES ('math');

INSERT INTO student (student_name) VALUES ('alice');
INSERT INTO student (student_name) VALUES ('bob');
INSERT INTO student (student_name) VALUES ('clark');
INSERT INTO student (student_name) VALUES ('david');
INSERT INTO student (student_name) VALUES ('emily');

INSERT INTO student_course (student_name, course_name) VALUES ('alice', 'english');
INSERT INTO student_course (student_name, course_name) VALUES ('alice', 'history');
INSERT INTO student_course (student_name, course_name) VALUES ('bob', 'english');
INSERT INTO student_course (student_name, course_name) VALUES ('bob', 'math');
INSERT INTO student_course (student_name, course_name) VALUES ('clark', 'math');
INSERT INTO student_course (student_name, course_name) VALUES ('emily', 'english');
INSERT INTO student_course (student_name, course_name) VALUES ('emily', 'history');
INSERT INTO student_course (student_name, course_name) VALUES ('emily', 'math');

SELECT s.student_name
FROM student s
WHERE NOT EXISTS (
    SELECT *
    FROM course c
    WHERE NOT EXISTS (
        SELECT *
        FROM student_course sc
        WHERE sc.student_name = s.student_name
          AND sc.course_name = c.course_name
    )
);
