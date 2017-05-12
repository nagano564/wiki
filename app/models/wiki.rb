class Wiki < ActiveRecord::Base
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :collaborators
  has_many :collaborate_users, through: :collaborators, source: :user

  after_initialize :set_default_private, unless: :persisted?

  private
  def set_default_private
    self.private = false if self.private.nil?
  end
end
