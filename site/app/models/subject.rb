class Subject < ApplicationRecord
	validates :title, presence: true
	validates :start_date, presence: true
	validates :end_date, presence: true
	belongs_to :teacher, :class_name => 'Teacher', :foreign_key => 'teacher_id'
	has_and_belongs_to_many :students
	has_many :notes
	has_many :tests
end
