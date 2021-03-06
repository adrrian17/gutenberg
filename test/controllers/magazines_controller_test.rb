require 'test_helper'

class MagazinesControllerTest < ActionController::TestCase
  include Devise::TestHelpers
  setup do
    @magazine = magazines(:one)
    request.env["devise.mapping"] = Devise.mappings[:user]
    sign_in users(:ana)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:magazines)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create magazine" do
    assert_difference('Magazine.count', 1, @magazine.to_yaml) do
      post :create, magazine: { copies: @magazine.copies, published_date: @magazine.published_date, title: @magazine.title, volume: @magazine.volume, item_types_id: 1, slug: @magazine.title.parameterize }
    end
    

    assert_redirected_to magazine_path(assigns(:magazine))
  end

  test "should show magazine" do
    get :show, id: @magazine
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @magazine
    assert_response :success
  end

  test "should update magazine" do
    patch :update, id: @magazine, magazine: { copies: @magazine.copies, published_date: @magazine.published_date, title: @magazine.title, volume: @magazine.volume, slug: @magazine.title.parameterize }
    assert_redirected_to magazine_path(assigns(:magazine))
  end

  test "should destroy magazine" do
    assert_difference('Magazine.count', -1) do
      delete :destroy, id: @magazine
    end

    assert_redirected_to magazines_path
  end
end
