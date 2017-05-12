class User < ActiveRecord::Base

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable


  before_save { self.role ||= :standard }

  has_many :wikis
  has_many :collaborators
  has_many :collaborate_wikis, through: :collaborators, source: :wiki

  enum role: [:standard, :admin, :premium]

  def downgrade!
    update_attributes(role: 'standard', subscription_id: nil)
    wikis.update_all(private: false)
  end
end
