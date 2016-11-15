class Concern < ApplicationRecord
  has_many :ideas
  default_scope { order(name: :asc) }
end
