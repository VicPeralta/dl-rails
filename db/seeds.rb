# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Student.create(id:'PEGV-0001', name: 'John Smith #1')
Student.create(id:'PEGV-0002', name: 'John Smith #2')
Student.create(id:'PEGV-0003', name: 'John Smith #3')
Student.create(id:'PEGV-0004', name: 'John Smith #4')
Student.create(id:'PEGV-0005', name: 'John Smith #5')
Student.create(id:'PEGV-0006', name: 'John Smith #6')
Student.create(id:'PEGV-0007', name: 'John Smith #7')
Student.create(id:'PEGV-0008', name: 'John Smith #8')
Student.create(id:'PEGV-0009', name: 'John Smith #9')
Student.create(id:'PEGV-0010',name: 'John Smith #10')

Course.create(id: 'Math-101', name: 'Mathematics 1')
Course.create(id: 'Math-102', name: 'Mathematics 2')
Course.create(id: 'Math-103', name: 'Mathematics 3')
Course.create(id: 'Math-104', name: 'Mathematics 4')
Course.create(id: 'Math-105', name: 'Mathematics 5')
Course.create(id: 'Math-106', name: 'Mathematics 6')
Course.create(id: 'Math-107', name: 'Mathematics 7')
Course.create(id: 'Math-108', name: 'Mathematics 8')
Course.create(id: 'Math-109', name: 'Mathematics 9')
Course.create(id: 'Math-110', name: 'Mathematics 10')

Grade.create(student_id: 'PEGV-0001', course_id: 'Math-101')
Grade.create(student_id: 'PEGV-0001', course_id: 'Math-102')
Grade.create(student_id: 'PEGV-0001', course_id: 'Math-103')
Grade.create(student_id: 'PEGV-0001', course_id: 'Math-104')
Grade.create(student_id: 'PEGV-0001', course_id: 'Math-105')