require 'rails_helper'

RSpec.describe 'Books API' do
  # Initialize the test data
  let!(:author) { create(:author, name: 'Stephen', lastname: 'Hawking') }
  let!(:book) { create(:book, title: "A brief history of time", isbn: '1900123', author: author) }
  let!(:book2) { create(:book, title: "A second book of time", isbn: '1800321', author: author) }
  let(:id) { book.id }
  let(:author_id) { author.id }
  let(:title_search_term) { 'time' }
  let(:isbn_search_term) { '1800321' }

  # Test suite for GET /api/v1/books
  describe 'GET /api/v1/books' do
    before { get "/api/v1/books" }

    context 'when author exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns all books' do
        expect(json.size).to eq(2)
      end
    end
  end

  # Test suite for GET /api/v1/books/:id
  describe 'GET /api/v1/books/:id' do
    before { get "/api/v1/books/#{id}" }

    context 'when book exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns the book' do
        expect(json['id']).to eq(id)
      end
    end

    context 'when book does not exist' do
      let(:id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Book/)
      end
    end
  end

  # Test suite for POST /api/v1/books
  describe 'POST /api/v1/books' do
    let(:valid_attributes) { { book: { title: 'The Road Ahead', isbn: '100200', price: 35, author_id: author_id } } }

    context 'when request attributes are valid' do
      before { post "/api/v1/books", params: valid_attributes, as: :json }

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when an invalid request' do
      before { post "/api/v1/books", params: { book: { author_id: author_id, isbn: '100201', price: 35 } }, as: :json }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a failure message' do
        expect(response.body).to match(/Title can't be blank/)
      end
    end
  end

  # Test suite for DELETE /api/v1/books/:id
  describe 'DELETE /api/v1/books/:id' do
    before { delete "/api/v1/books/#{id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
  
  # Test suite for SEARCH by TITLE /api/v1/books/search_by_title
  describe 'GET /api/v1/books/search_by_title' do
    before { get search_by_title_api_v1_books_url( book: { term: title_search_term }), as: :json}

    context 'when found books' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns all books' do
        expect(json.size).to eq(2)
      end
    end
  end

end