# encoding: utf-8
class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name, :comment => '产品名称'
      t.text :introduction, :comment => '产品简介'
      t.text :programme, :comment => '产品方案'
      t.text :detail, :comment => '产品详情'

      t.timestamps
    end
  end
end
