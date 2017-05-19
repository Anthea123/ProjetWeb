# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

admin1 = Administrator.create(username: anthea, password: 123soleil, name: Anthea, surname: Mérida)
admin2 = Administrator.create(username: min, password: 123soleil, name: Min, surname: Li)

teacher1 = Teacher.create(username: prof1, password: prof1, name: Prof1, surname: Prof1)
teacher2 = Teacher.create(username: prof2, password: prof2, name: Prof2, surname: Prof2)
teacher3 = Teacher.create(username: prof3, password: prof3, name: Prof3, surname: Prof3)
teacher4 = Teacher.create(username: prof4, password: prof4, name: Prof4, surname: Prof4)
teacher5 = Teacher.create(username: prof5, password: prof5, name: Prof5, surname: Prof5)

student1 = Student.create(username: student1, password: student1, name: Student1, surname: Student1)
student2 = Student.create(username: student2, password: student2, name: Student2, surname: Student2)
student3 = Student.create(username: student3, password: student3, name: Student3, surname: Student3)
student4 = Student.create(username: student4, password: student4, name: Student4, surname: Student4)
student5 = Student.create(username: student5, password: student5, name: Student5, surname: Student5)





