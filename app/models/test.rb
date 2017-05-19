class Test < ApplicationRecord
	validates :title, presence: true
	validates :test_date, presence: true
	belongs_to :teacher, :class_name => 'Teacher', :foreign_key => 'teacher_id'
	belongs_to :subject, :class_name => 'Subject', :foreign_key => 'subject_id'
	has_many :notes
	has_many :students
end
