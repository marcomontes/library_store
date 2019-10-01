class Book < ApplicationRecord
  belongs_to :author

  validates :title,  presence: true
  validates :author, presence: true
  validates :isbn,   presence: true
  validates :isbn,   uniqueness: true
  validates :price,  presence: true
  validates :price,  numericality: { only_integer: true }

  delegate :full_name, to: :author, prefix: true
end
