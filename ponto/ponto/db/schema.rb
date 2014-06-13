# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20140612181617) do

  create_table "batidas", force: true do |t|
    t.integer  "funcionario_id"
    t.date     "data"
    t.time     "hora"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "batidas", ["funcionario_id"], name: "index_batidas_on_funcionario_id"

  create_table "feria", force: true do |t|
    t.integer  "funcionario_id"
    t.date     "data_inicio"
    t.date     "data_fim"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "feria", ["funcionario_id"], name: "index_feria_on_funcionario_id"

  create_table "feriados", force: true do |t|
    t.string   "descricao"
    t.date     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ferias_funcionarios", force: true do |t|
    t.integer  "funcionario_id"
    t.date     "data_inicio"
    t.date     "data_fim"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ferias_funcionarios", ["funcionario_id"], name: "index_ferias_funcionarios_on_funcionario_id"

  create_table "funcionarios", force: true do |t|
    t.string   "nome"
    t.boolean  "ativo"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "setor_id"
  end

  add_index "funcionarios", ["setor_id"], name: "index_funcionarios_on_setor_id"

  create_table "setors", force: true do |t|
    t.string   "descricao"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "usuarios", force: true do |t|
    t.string   "username"
    t.string   "senha"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "tipo"
    t.integer  "setor_id"
  end

  add_index "usuarios", ["setor_id"], name: "index_usuarios_on_setor_id"

end
