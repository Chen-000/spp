class CreateNavs < ActiveRecord::Migration
  def change
    create_table :navs do |t|
      t.string :name, :comment => '导航名称'
      t.integer :kind
      t.text :detail, :comment => '导航详情'

      t.timestamps
    end
  end
end
