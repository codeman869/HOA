class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  has_one :unit
  
  def is_admin?
    self.role == "Admin"
  end
  
  def is_president?
    self.role == "President"
  end
  
  def is_treasurer?
    self.role == "Treasurer"
  end
  
  def is_secretary?
    self.role == "Secretary"
  end
  
  
end
