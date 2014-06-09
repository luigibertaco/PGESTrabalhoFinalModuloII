require 'test_helper'

class FeriaControllerTest < ActionController::TestCase
  setup do
    @ferium = feria(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:feria)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ferium" do
    assert_difference('Ferium.count') do
      post :create, ferium: { data_fim: @ferium.data_fim, data_inicio: @ferium.data_inicio, funcionario_id: @ferium.funcionario_id }
    end

    assert_redirected_to ferium_path(assigns(:ferium))
  end

  test "should show ferium" do
    get :show, id: @ferium
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @ferium
    assert_response :success
  end

  test "should update ferium" do
    patch :update, id: @ferium, ferium: { data_fim: @ferium.data_fim, data_inicio: @ferium.data_inicio, funcionario_id: @ferium.funcionario_id }
    assert_redirected_to ferium_path(assigns(:ferium))
  end

  test "should destroy ferium" do
    assert_difference('Ferium.count', -1) do
      delete :destroy, id: @ferium
    end

    assert_redirected_to feria_path
  end
end
