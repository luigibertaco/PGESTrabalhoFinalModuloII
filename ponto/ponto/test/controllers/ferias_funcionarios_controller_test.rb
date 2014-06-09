require 'test_helper'

class FeriasFuncionariosControllerTest < ActionController::TestCase
  setup do
    @ferias_funcionario = ferias_funcionarios(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ferias_funcionarios)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ferias_funcionario" do
    assert_difference('FeriasFuncionario.count') do
      post :create, ferias_funcionario: { data_fim: @ferias_funcionario.data_fim, data_inicio: @ferias_funcionario.data_inicio, funcionario_id: @ferias_funcionario.funcionario_id }
    end

    assert_redirected_to ferias_funcionario_path(assigns(:ferias_funcionario))
  end

  test "should show ferias_funcionario" do
    get :show, id: @ferias_funcionario
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @ferias_funcionario
    assert_response :success
  end

  test "should update ferias_funcionario" do
    patch :update, id: @ferias_funcionario, ferias_funcionario: { data_fim: @ferias_funcionario.data_fim, data_inicio: @ferias_funcionario.data_inicio, funcionario_id: @ferias_funcionario.funcionario_id }
    assert_redirected_to ferias_funcionario_path(assigns(:ferias_funcionario))
  end

  test "should destroy ferias_funcionario" do
    assert_difference('FeriasFuncionario.count', -1) do
      delete :destroy, id: @ferias_funcionario
    end

    assert_redirected_to ferias_funcionarios_path
  end
end
