class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  attr_accessor :role
  has_many :user_roles, dependent: :destroy
  has_many :roles, through: :user_roles
  has_many :images

  after_create :assign_role

  scope :banned, -> { where(banned: true) }
  scope :unbanned, -> { where(banned: false) }

  def has_role?(role)
    !roles.where(role_type: role).empty?
  end

  def banned?
    banned
  end

  private

  def assign_role
    role = if @role.present?
      Role.find_by(role_type: @role)
    else
      Role.find_by(role_type: 'user')
    end
    UserRole.create!(role: role, user_id: id)
  end
end
