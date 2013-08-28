class HomeController < ApplicationController
  def index
    @books = Book.all
    @magazines = Magazine.all
  end
end
