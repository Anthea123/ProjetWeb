class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_current_user

  private
  
  def set_current_user
    if session[:user_id]
      @current_user = User.find(session[:user_id])
    end
  end

  def admin_exclusive
    if !@current_user.try(:admin?)
			flash[:error] = "Accès interdit"
			return redirect_to request.referrer || root_path
		end
  end

  def teacher_exclusive
    if !@current_user.try(:teacher?)
			flash[:error] = "Accès interdit"
			return redirect_to request.referrer || root_path
		end
  end

  def student_exclusive
    if !@current_user.try(:student?)
			flash[:error] = "Accès interdit"
			return redirect_to request.referrer || root_path
		end
  end

  def logged_in
    if @current_user == nil
      flash[:error] = "Accès interdit"
			return redirect_to request.referrer || root_path
    end
  end
end
