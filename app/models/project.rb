class Project < ApplicationRecord
  belongs_to :user

  has_many :stakeholder_updates
  has_many :subscribers

  # scope :scope_name, -> {  }
  scope :ready, -> { where.not(title: nil).where.not(description: nil).where.not(website: nil) }


  def self.except(project)
    where.not(id: project.id)
  end


  def latest_stakeholder_update
    stakeholder_updates.order(created_at: :desc).first
  end



end
