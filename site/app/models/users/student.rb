class Student < User
	has_and_belongs_to_many :subjects
	has_many :notes
end