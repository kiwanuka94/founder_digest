class ApplicationController < ActionController::Base
  def after_sign_in_path_for(resource)
    # insert logic to determine where the user should go after signing in
    start_path
	end

  def maybe_skip_onboarding
    redirect_to dashboard_index_path, notice: "You're already subscribed" if current_user.finished_onboarding?
  end
end
