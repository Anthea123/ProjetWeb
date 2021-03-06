class Relation < ApplicationRecord
	belongs_to :student, :class_name => 'Student', :foreign_key => 'student_id'
	belongs_to :subject, :class_name => 'Subject', :foreign_key => 'subject_id'
	validates :student_id, uniqueness: { scope: :subject_id }
end
