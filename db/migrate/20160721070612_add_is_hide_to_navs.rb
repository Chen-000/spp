class AddIsHideToNavs < ActiveRecord::Migration
  def change
    add_column :navs, :is_hide, :boolean, :default => true
  end
end
