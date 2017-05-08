class PermitedTeacher < ApplicationRecord
	validates :surname, presence: true
	validates :name, presence: true
	validates :email, presence: true
	validates :email, uniqueness: true
	validates :username, presence: true
	validates :username, uniqueness: true
	validate :new_username
	validates :password, presence: true

	def new_username
		if User.where( :username => self.username).any?
        	errors.add(:username, "ce nom d'utilisateur existe déjà")
    	end
	end
end
