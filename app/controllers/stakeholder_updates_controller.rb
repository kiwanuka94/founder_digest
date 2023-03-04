class StakeholderUpdatesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_project, except: [:new]
  before_action :set_stakeholder_update, except: [:new, :create]

  def new
    @stakeholder_update = StakeholderUpdate.new
  end

  def show
  end

  def edit
  end

  def update
    @stakeholder_update.update(stakeholder_update_params)
    
    if @stakeholder_update.confirmed?
      redirect_to dashboard_path, notice: 'Stakeholder update will be shared!'
    else
      redirect_to stakeholder_update_path(@stakeholder_update), notice: 'Stakeholder update was edited!'
    end
  end

  def create
    stakeholder_update = @project.stakeholder_updates.create!(stakeholder_update_params)
    redirect_to stakeholder_update_path(stakeholder_update), notice: 'Stakeholder update created!'
  end


  private

  def set_project
    @project = current_user.default_project
  end

  def stakeholder_update_params
    params.require(:stakeholder_update).permit(:title, :content, :confirmed_at)
  end

  def set_stakeholder_update
    
    @stakeholder_update = @project.stakeholder_updates.find(params[:id])
  end

end
