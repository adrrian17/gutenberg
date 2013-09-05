class HomeController < ApplicationController
  skip_before_filter :authenticate_user!

  def index
    unless user_signed_in?
      redirect_to '/login'
    end
    @books = Book.all
    @magazines = Magazine.all
  end
end
