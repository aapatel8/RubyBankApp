class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, 
         :recoverable, :rememberable, :trackable, :validatable

  def self.GetDefaultAdmin
    @invincibleAdmin = Admin.all().order('created_at').limit(1)

    @invincibleAdmin = @invincibleAdmin[0]
  end
end
