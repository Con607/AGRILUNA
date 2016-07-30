class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  after_create :assign_initial_permissions


    has_many :user_companies
    has_many :companies, through: :user_companies
    has_many :user_roles
    has_many :roles, through: :user_roles

    def full_name
    	"#{first_name} #{last_name} #{second_last_name}"
    end

  def assign_initial_permissions
    initial_role = Role.where(name: 'Initial Role').first
    self.roles = [initial_role]
    self.save!
  end
end
