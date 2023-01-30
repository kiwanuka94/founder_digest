class UserSubmissionsController < ApplicationController
  def create
    UserSubmission.create!(user_submission_params)
    redirect_to '/thanks'
  end

  def update
    # TODO: update user submissions status
    # HERE, it wants you to render a template, ie show a page, or redirect the user
    # Bottom of every method should tell the user where to go, or what to look at.
  end

  def user_submission_params
    params.require(:user_submission).permit(:first_name, :last_name, :email, :website, :text, :job_role, :plan_name)
  end
end
