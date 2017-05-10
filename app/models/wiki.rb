class Wiki < ActiveRecord::Base
  belongs_to :user
  has_many :comments, dependent: :destroy

  after_initialize :set_default_private, unless: :persisted?

  private
  def set_default_private
    self.private = false if self.private.nil?
  end
end
