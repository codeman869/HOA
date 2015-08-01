class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  has_one :unit
  
  def admin?
    self.role == "Admin"
  end
  
  def president?
    self.role == "President"
  end
  
  def treasurer?
    self.role == "Treasurer"
  end
  
  def secretary?
    self.role == "Secretary"
  end
  
  
end
