require 'test_helper'

class TypecomentariosControllerTest < ActionController::TestCase
  setup do
    @typecomentario = typecomentarios(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:typecomentarios)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create typecomentario" do
    assert_difference('Typecomentario.count') do
      post :create, :typecomentario => @typecomentario.attributes
    end

    assert_redirected_to typecomentario_path(assigns(:typecomentario))
  end

  test "should show typecomentario" do
    get :show, :id => @typecomentario.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @typecomentario.to_param
    assert_response :success
  end

  test "should update typecomentario" do
    put :update, :id => @typecomentario.to_param, :typecomentario => @typecomentario.attributes
    assert_redirected_to typecomentario_path(assigns(:typecomentario))
  end

  test "should destroy typecomentario" do
    assert_difference('Typecomentario.count', -1) do
      delete :destroy, :id => @typecomentario.to_param
    end

    assert_redirected_to typecomentarios_path
  end
end
