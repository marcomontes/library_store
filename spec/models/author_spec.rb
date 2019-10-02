require 'rails_helper'

RSpec.describe Author, type: :model do
  # Association test
  # ensure Author model has a 1:m relationship with the Book model
  it { should have_many(:books).dependent(:destroy) }
  # Validation tests
  # ensure columns name and lastname are present before saving
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:lastname) }
end