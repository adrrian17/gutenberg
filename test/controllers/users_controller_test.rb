require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  include Devise::TestHelpers
  tests Devise::RegistrationsController

  setup do
    @user = users(:ana)
    @user.password = 'foo' * 5

    request.env["devise.mapping"] = Devise.mappings[:user]
    sign_in users(:ana)
  end

  # test "should get index" do
  #   get :index
  #   assert_response :success
  #   assert_not_nil assigns(:users)
  # end

  # test "should get new" do
  #   get :new, id: @user
  #   assert_response :success
  # end

  # test "should create user" do
  #   assert_difference('User.count') do
  #     post :create, user: { email: "another-#{@user.email}", first_name: @user.first_name, last_name: @user.last_name, password: @user.password, password_confirmation: @user.password }
  #   end

  #   assert_redirected_to user_path(assigns(:user))
  # end

  # test "should show user" do
  #   get :show, id: @user
  #   assert_response :success
  # end

  # test "should get edit" do
  #   get :edit, id: @user
  #   assert_response :success
  # end

  # test "should update user" do
  #   patch :update, id: @user, user: { email: "another.#{@user.email}", first_name: @user.first_name, last_name: @user.last_name }
  #   assert_redirected_to user_path(assigns(:user))
  # end

  # test "should destroy user" do
  #   assert_difference('User.count', -1) do
  #     delete :destroy, id: @user
  #   end

  #   assert_redirected_to users_path
  # end
end
