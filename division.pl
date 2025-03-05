course(english).
course(math).

student(alice).
student(bob).
student(clark).
student(david).
student(emily).

student_course(alice,english).
student_course(alice,history).
student_course(bob,english).
student_course(bob,math).
student_course(clark,math).
student_course(emily,english).
student_course(emily,history).
student_course(emily,math).

% student_all_courses_bagof(-Student)
student_all_courses_bagof(Student) :-
    student(Student),
    bagof(C, course(C), Courses),
    forall(member(C, Courses), student_course(Student, C)).

% student_all_courses_setof(-Student)
student_all_courses_setof(Student) :-
    student(Student),
    setof(C, course(C), Courses),
    forall(member(C, Courses), student_course(Student, C)).

% student_all_courses_findall(-Student)
student_all_courses_findall(Student) :-
    student(Student),
    findall(C, course(C), Courses),
    forall(member(C, Courses), student_course(Student, C)).

% student_all_courses_forall(-Student)
student_all_courses_forall(Student) :-
    student(Student),
    forall(course(C), student_course(Student, C)).


% student_all_courses_not(-Student)
student_all_courses_not(Student) :-
    student(Student),
    not(( course(C), not(student_course(Student, C)) )).


student_course_product(Student, Course) :-
    student(Student),
    course(Course).

missing_course(Student, Course) :-
    student_course_product(Student, Course),
    not(student_course(Student, Course)).

bad_student(Student) :-
    missing_course(Student, _).

% student_all_courses_product_subtraction(-Student)
student_all_courses_product_subtraction(Student) :-
    student(Student),
    not(bad_student(Student)).




/** <examples>
?- student_all_courses_bagof(Student).
?- student_all_courses_setof(Student).
?- student_all_courses_forall(Student).
?- student_all_courses_not(Student).
?- student_all_courses_findall(Student).
?- student_all_courses_product_subtraction(Student).
*/
