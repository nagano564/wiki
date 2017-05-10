class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable


  before_save { self.role ||= :standard }
  has_many :wikis
  enum role: [:standard, :admin, :premium]
  def downgrade!
    update_attributes(role: 'standard', subscription_id: nil)
    wikis.update_all(private: false)
  end
end
