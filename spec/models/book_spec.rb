require 'rails_helper'

RSpec.describe Book, type: :model do
  let!(:author) { create(:author, name: 'Stephen', lastname: 'Hawking') }
  let!(:book) { create(:book, title: "A brief history of time", isbn: '1900123', author: author) }

  # Association test
  # ensure a book belongs to a author
  it { should belong_to(:author) }
  # Validation test
  # ensure columns are present before saving
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:isbn) }
  it { should validate_presence_of(:price) }
  it { should validate_presence_of(:author) }

  it "search books using title" do
    books_results = Book.search('tory')
    expect(books_results.first).to be_an_instance_of(Book)
  end

  it "search books using isbn" do
    books_results = Book.search('012')
    expect(books_results.first).to be_an_instance_of(Book)
  end
end