class Idea < ApplicationRecord
  belongs_to :concern

  before_create :generate_slug

  def generate_slug
    self.slug = SecureRandom.hex(10)
  end

  def to_param
    slug
  end
end
