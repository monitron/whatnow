class Idea < ApplicationRecord
  belongs_to :concern

  before_create :generate_slug

  validates :name, :action_url, :description, presence: true
  validates :name, length: {maximum: 60}
  validates :action_url, length: {maximum: 250}
  validates :description, length: {maximum: 200}, allow_blank: true
  validates :contributor_name, length: {maximum: 40}, allow_blank: true
  validates :contributor_place, length: {maximum: 30}, allow_blank: true

  def generate_slug
    self.slug = SecureRandom.hex(10)
  end

  def approve!
    self.update! approved: true
  end

  def to_param
    slug
  end
end
