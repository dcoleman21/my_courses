# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#Students
student1 = Student.create(name: "Sally Jones", email: "sally@email.com")
student2 = Student.create(name: "Ben Harper", email: "ben@email.com")
student3 = Student.create(name: "Latisha Brown", email: "latisha@email.com")
student4 = Student.create(name: "Calvin Jenkins", email: "calvin@email.com")

#Course
course1 = Course.create(name: "Business", time: "11:15 AM")
course2 = Course.create(name: "Engineering", time: "2:20 PM")
course3 = Course.create(name: "Finance", time: "8:30 AM")
course4 = Course.create(name: "Economics", time: "4:25 PM")

# CourseRegistrations
student1.course_registrations.create!(student_id: student1.id, course_id: course1.id)
student1.course_registrations.create!(student_id: student1.id, course_id: course3.id)
student2.course_registrations.create!(student_id: student2.id, course_id: course2.id)
student2.course_registrations.create!(student_id: student2.id, course_id: course3.id)
student3.course_registrations.create!(student_id: student3.id, course_id: course4.id)
student3.course_registrations.create!(student_id: student3.id, course_id: course1.id)
student4.course_registrations.create!(student_id: student4.id, course_id: course2.id)
student4.course_registrations.create!(student_id: student4.id, course_id: course4.id)
