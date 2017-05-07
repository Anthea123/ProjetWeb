class Note < ApplicationRecord
	validates :note, presence: true
	belongs_to :teacher, :class_name => 'Teacher', :foreign_key => 'teacher_id'
	belongs_to :student, :class_name => 'Student', :foreign_key => 'student_id'
	belongs_to :subject, :class_name => 'Subject', :foreign_key => 'subject_id'
	belongs_to :test, :class_name => 'Test', :foreign_key => 'test_id'
end
