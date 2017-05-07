class User < ApplicationRecord
	validates :username, presence: true
	validates :username, uniqueness: true
	validates :password, presence: true
	validates :surname, presence: true
	validates :name, presence: true
	
end