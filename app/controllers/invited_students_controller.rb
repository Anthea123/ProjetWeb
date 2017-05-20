class InvitedStudentsController < ApplicationController
  def create
    @invitedstudent = InvitedStudent.create name: params[:name], surname: params[:surname], email: params[:email]
    if @invitedstudent.save
      flash[:notice] = "Étudiant invité"
    else
      flash[:notice] = "Erreur"
    end
    redirect_to "/teachers/invite"
  end
end
