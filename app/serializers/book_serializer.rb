class BookSerializer < ActiveModel::Serializer
  attributes :id, :title, :isbn, :price, :short_description, :author

  def author
    self.object.author_full_name
  end 
end
