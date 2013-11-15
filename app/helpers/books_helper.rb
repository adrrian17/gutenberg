module BooksHelper
  def authors_links book
    book.authors.map do |author| 
      link_to author.full_name, author_path(author.slug)
    end.join(', ')
  end
end
