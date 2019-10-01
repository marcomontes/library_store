class Author < ApplicationRecord
  has_many :books

  validates :name,     presence: true
  validates :lastname, presence: true

  def full_name
    "#{name} #{lastname}"
  end
end
