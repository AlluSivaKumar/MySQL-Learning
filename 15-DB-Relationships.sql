Create database company;
use company;

CREATE TABLE student (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(50) NOT NULL
);

CREATE TABLE course (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(50) NOT NULL
);

CREATE TABLE enrollment (
    student_id INT,
    course_id INT,
    enrollment_date DATE,

    PRIMARY KEY (student_id, course_id),

    FOREIGN KEY (student_id)
        REFERENCES student(student_id),

    FOREIGN KEY (course_id)
        REFERENCES course(course_id)
);

INSERT INTO student VALUES
(1, 'Siva'),
(2, 'Rakesh');

INSERT INTO course VALUES
(101, 'Java'),
(102, 'SQL');

INSERT INTO enrollment VALUES
(1, 101, '2026-09-01'),
(1, 102, '2026-09-02'),
(2, 102, '2026-09-03');

-- Display all student names with their enrolled course names.
SELECT S.STUDENT_NAME , C.COURSE_NAME 
FROM STUDENT S INNER JOIN enrollment E
ON S.STUDENT_ID = 	E.STUDENT_ID 
					INNER JOIN COURSE C
					ON E.COURSE_ID = C.COURSE_ID;


-- Find all courses taken by Siva.
SELECT C.COURSE_NAME
FROM STUDENT S INNER JOIN ENROLLMENT E
ON S.STUDENT_ID = 	E.STUDENT_ID 
					INNER JOIN COURSE C
                    ON E.COURSE_ID = C.COURSE_ID
                    WHERE S.STUDENT_NAME = 'SIVA';

-- Find all students enrolled in SQL.
SELECT S.STUDENT_NAME 
FROM STUDENT S INNER JOIN ENROLLMENT E
ON S.STUDENT_ID = E.STUDENT_ID 
				  INNER JOIN COURSE C
                  ON C.COURSE_ID = E.COURSE_ID
                  WHERE C.COURSE_NAME = 'SQL';
                  
SELECT STUDENT_NAME
FROM STUDENT
WHERE STUDENT_ID IN (
    SELECT STUDENT_ID
    FROM ENROLLMENT
    WHERE COURSE_ID IN (
        SELECT COURSE_ID
        FROM COURSE
        WHERE COURSE_NAME = 'SQL'
    )
);

-- Count enrollments for every course, including courses with zero enrollments.
SELECT C.COURSE_NAME , (
						SELECT COUNT(*)
						FROM ENROLLMENT E
                        WHERE E.COURSE_ID = C.COURSE_ID
                    ) AS TOTAL_ENROLLMENTS
FROM COURSE C;

SELECT C.COURSE_NAME,
       COUNT(E.STUDENT_ID) AS TOTAL_ENROLLMENTS
FROM COURSE C
LEFT JOIN ENROLLMENT E
    ON C.COURSE_ID = E.COURSE_ID
GROUP BY C.COURSE_ID, C.COURSE_NAME;

Find students who have not enrolled in any course.
Find students enrolled in more than one course.
Try inserting (1, 101) into enrollment again. Explain the error.
Try enrolling student 99, who does not exist. Explain the error.
