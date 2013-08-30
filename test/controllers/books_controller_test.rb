require 'test_helper'

class BooksControllerTest < ActionController::TestCase
  setup do
    @book = books(:xkcd)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:books)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create book" do
    assert_difference('Book.count', 1) do
      post :create, book: { category_id: @book.category_id, copies: @book.copies, pages: @book.pages, published_date: @book.published_date, publishing_house_id: @book.publishing_house_id, title: "#{@book.title} II" }
    end
    @current = assigns(:book)

    assert_equal 0, @current.item_types_id
    assert_redirected_to book_path(@current)
  end

  test "should show book" do
    get :show, id: @book
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @book
    assert_response :success
  end

  test "should update book" do
    patch :update, id: @book, book: { category_id: @book.category_id, copies: @book.copies, pages: @book.pages, published_date: @book.published_date, publishing_house_id: @book.publishing_house_id, title: @book.title }
    assert_redirected_to book_path(assigns(:book))
  end

  test "should destroy book" do
    assert_difference('Book.count', -1) do
      delete :destroy, id: @book
    end

    assert_redirected_to books_path
  end
end
