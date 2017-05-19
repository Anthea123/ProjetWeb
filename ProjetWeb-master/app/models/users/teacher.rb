class Teacher < User
	has_many :subjects
	has_many :notes
	has_many :tests
	has_many :invited_students
end