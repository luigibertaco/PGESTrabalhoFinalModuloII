class AddFuncionariosToDivergencia < ActiveRecord::Migration
  def change
    add_reference :divergencia, :funcionario, index: true
  end
end
