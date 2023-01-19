class UserSubmissionsController < ApplicationController
  def create
    UserSubmission.create!(user_submission_params)
    redirect_to root_path, notice: 'Thanks. Your application is being reviewed.'
  end

  def user_submission_params
    params.require(:user_submission).permit(:first_name, :last_name, :email, :website, :text, :job_role, :plan_name)
  end
end
