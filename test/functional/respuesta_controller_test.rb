require 'test_helper'

class RespuestaControllerTest < ActionController::TestCase
  setup do
    @respuestum = respuesta(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:respuesta)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create respuestum" do
    assert_difference('Respuestum.count') do
      post :create, :respuestum => @respuestum.attributes
    end

    assert_redirected_to respuestum_path(assigns(:respuestum))
  end

  test "should show respuestum" do
    get :show, :id => @respuestum.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @respuestum.to_param
    assert_response :success
  end

  test "should update respuestum" do
    put :update, :id => @respuestum.to_param, :respuestum => @respuestum.attributes
    assert_redirected_to respuestum_path(assigns(:respuestum))
  end

  test "should destroy respuestum" do
    assert_difference('Respuestum.count', -1) do
      delete :destroy, :id => @respuestum.to_param
    end

    assert_redirected_to respuesta_path
  end
end
