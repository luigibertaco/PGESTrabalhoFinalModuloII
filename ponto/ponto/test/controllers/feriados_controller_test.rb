require 'test_helper'

class FeriadosControllerTest < ActionController::TestCase
  setup do
    @feriado = feriados(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:feriados)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create feriado" do
    assert_difference('Feriado.count') do
      post :create, feriado: { data: @feriado.data, descricao: @feriado.descricao }
    end

    assert_redirected_to feriado_path(assigns(:feriado))
  end

  test "should show feriado" do
    get :show, id: @feriado
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @feriado
    assert_response :success
  end

  test "should update feriado" do
    patch :update, id: @feriado, feriado: { data: @feriado.data, descricao: @feriado.descricao }
    assert_redirected_to feriado_path(assigns(:feriado))
  end

  test "should destroy feriado" do
    assert_difference('Feriado.count', -1) do
      delete :destroy, id: @feriado
    end

    assert_redirected_to feriados_path
  end
end
