# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

admin1 = Administrator.create(username: 'anthea', password: '123soleil', name: 'Anthea', surname: 'Mérida')
admin2 = Administrator.create(username: 'min', password: '123soleil', name: 'Min', surname: 'Li')

teacher1 = Teacher.create(username: 'prof1', password: 'prof1', name: 'Prof1', surname: 'Prof1')
teacher2 = Teacher.create(username: 'prof2', password: 'prof2', name: 'Prof2', surname: 'Prof2')
teacher3 = Teacher.create(username: 'prof3', password: 'prof3', name: 'Prof3', surname: 'Prof3')
teacher4 = Teacher.create(username: 'prof4', password: 'prof4', name: 'Prof4', surname: 'Prof4')
teacher5 = Teacher.create(username: 'prof5', password: 'prof5', name: 'Prof5', surname: 'Prof5')

student1 = Student.create(username: 'student1', password: 'student1', name: 'Student1', surname: 'Student1')
student2 = Student.create(username: 'student2', password: 'student2', name: 'Student2', surname: 'Student2')
student3 = Student.create(username: 'student3', password: 'student3', name: 'Student3', surname: 'Student3')
student4 = Student.create(username: 'student4', password: 'student4', name: 'Student4', surname: 'Student4')
student5 = Student.create(username: 'student5', password: 'student5', name: 'Student5', surname: 'Student5')

subject1 = Subject.create(title: 'Maths', start_date: '10/10/2017', end_date: '03/03/2018', teacher_id: teacher1.id)
subject2 = Subject.create(title: 'Physique', start_date: '10/10/2017', end_date: '03/03/2018', teacher_id: teacher2.id)
subject3 = Subject.create(title: 'Anglais', start_date: '10/10/2017', end_date: '03/03/2018', teacher_id: teacher3.id)
subject4 = Subject.create(title: 'Français', start_date: '10/10/2017', end_date: '03/03/2018', teacher_id: teacher4.id)
subject5 = Subject.create(title: 'Histoire', start_date: '10/10/2017', end_date: '03/03/2018', teacher_id: teacher5.id)

relation1 = Relation.create(student_id: student1.id, subject_id: subject1.id)
relation2 = Relation.create(student_id: student2.id, subject_id: subject2.id)
relation3 = Relation.create(student_id: student3.id, subject_id: subject3.id)
relation4 = Relation.create(student_id: student4.id, subject_id: subject4.id)
relation5 = Relation.create(student_id: student5.id, subject_id: subject5.id)

test1 = Test.create(title: 'Dérivation', test_date: '15/01/2018', teacher_id: teacher1.id, subject_id: subject1.id)
test2 = Test.create(title: 'Lois de Newton', test_date: '15/01/2018', teacher_id: teacher2.id, subject_id: subject2.id)
test3 = Test.create(title: 'Conjugation', test_date: '15/01/2018', teacher_id: teacher3.id, subject_id: subject3.id)
test4 = Test.create(title: 'Conjugaison', test_date: '15/01/2018', teacher_id: teacher4.id, subject_id: subject4.id)
test5 = Test.create(title: 'La 2e Guerre Mondiale', test_date: '15/01/2018', teacher_id: teacher5.id, subject_id: subject5.id)

note1 = Note.create(note: 10, teacher_id: teacher1.id, student_id: student1.id, subject_id: subject1.id, test_id: test1.id)
note2 = Note.create(note: 9, teacher_id: teacher2.id, student_id: student2.id, subject_id: subject2.id, test_id: test2.id)
note3 = Note.create(note: 8, teacher_id: teacher3.id, student_id: student3.id, subject_id: subject3.id, test_id: test3.id)
note4 = Note.create(note: 7, teacher_id: teacher4.id, student_id: student4.id, subject_id: subject4.id, test_id: test4.id)
note5 = Note.create(note: 6, teacher_id: teacher5.id, student_id: student5.id, subject_id: subject5.id, test_id: test5.id)


