class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  attr_accessor :role
  has_many :user_roles, dependent: :destroy
  has_many :roles, through: :user_roles
  has_many :images

  before_validation :assign_role

  def has_role?(role)
    !roles.where(role_type: role).empty?
  end

  private

  def assign_role
    if @role.present?
      role = Role.find_by(role_type: @role)
    else
      role = 'user'
    end
    UserRole.create!(role: role, user_id: id)
  end
end
