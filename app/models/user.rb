class User < ApplicationRecord
  include Signupable
  include Onboardable
  include Billable
  

  scope :subscribed, -> { where(paying_customer: true) }


  has_many :projects
  has_many :subscribers
  has_many :stakeholder_updates, through: :projects

  before_create :generate_auth_code

  def generate_auth_code
    self.auth_code = SecureRandom.hex(20)
  end

  def default_project
    projects.order(created_at: :asc).first
  end

  def name
    "#{ first_name } #{ last_name }"
  end

  def pro_plan?
    plan_name == 'pro'
  end

  def has_started_subscription?
    return true unless pro_plan?

    stripe_subscription_id.present?
  end

end
