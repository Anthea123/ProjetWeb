class AdministratorsController < ApplicationController
	def home
		if !@current_user.try(:admin?)
			flash[:error] = "Accès interdit"
			return redirect_to request.referrer || root_path
		end
	end
end
