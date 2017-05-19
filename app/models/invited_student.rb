class InvitedStudent < ApplicationRecord
	has_one :teacher
	validates :surname, presence: true
	validates :name, presence: true
	validates :email, presence: true
	validates :email, uniqueness: true
end
