require 'test_helper'

class BatidasControllerTest < ActionController::TestCase
  setup do
    @batida = batidas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:batidas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create batida" do
    assert_difference('Batida.count') do
      post :create, batida: { data: @batida.data, funcionario_id: @batida.funcionario_id, hora: @batida.hora }
    end

    assert_redirected_to batida_path(assigns(:batida))
  end

  test "should show batida" do
    get :show, id: @batida
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @batida
    assert_response :success
  end

  test "should update batida" do
    patch :update, id: @batida, batida: { data: @batida.data, funcionario_id: @batida.funcionario_id, hora: @batida.hora }
    assert_redirected_to batida_path(assigns(:batida))
  end

  test "should destroy batida" do
    assert_difference('Batida.count', -1) do
      delete :destroy, id: @batida
    end

    assert_redirected_to batidas_path
  end
end
