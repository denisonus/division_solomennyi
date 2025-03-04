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
student_course(bob,history).
student_course(bob,math).
student_course(clark,math).
student_course(emily,english).
student_course(emily,history).
student_course(emily,math).
student_course(emily,biology).

student_all_courses_bagof(Student) :-
    student(Student),
    bagof(C, course(C), Courses),
    forall(member(C, Courses), student_course(Student, C)).

student_all_courses_setof(Student) :-
    student(Student),
    setof(C, course(C), Courses),
    forall(member(C, Courses), student_course(Student, C)).

student_all_courses_findall(Student) :-
    student(Student),
    findall(C, course(C), Courses),
    forall(member(C, Courses), student_course(Student, C)).

student_all_courses_not(Student) :-
    student(Student),
    not(( course(C), not(student_course(Student, C)) )).

bad_student(Student) :-
    student(Student),
    course(C),
    not(student_course(Student, C)).

student_all_courses_subtraction(Student) :-
    student(Student),
    \+ bad_student(Student).


