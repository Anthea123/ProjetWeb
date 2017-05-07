class PermitedTeacher < ApplicationRecord
	validates :surname, presence: true
	validates :name, presence: true
	validates :email, presence: true
	validates :email, uniqueness: true
	validates :username, presence: true
	validates :username, uniqueness: true
	validates :password, presence: true
end
