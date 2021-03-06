class User < ApplicationRecord
	validates :username, presence: true
	validates :username, uniqueness: true
	validates :password, presence: true
	validates :surname, presence: true
	validates :name, presence: true

	def teacher?
		return self.type == "Teacher"
	end

	def admin?
		return self.type == "Administrator"
	end

	def student?
		return self.type == "Student"
	end
	
end
