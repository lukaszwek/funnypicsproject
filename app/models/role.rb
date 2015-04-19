class Role < ActiveRecord::Base
  has_many :user_roles, dependent: :destroy
  has_many :users, through: :user_roles

  enum role_type: [:user, :moderator, :admin]
end
