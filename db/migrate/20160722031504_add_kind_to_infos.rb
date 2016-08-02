class AddKindToInfos < ActiveRecord::Migration
  def change
    add_column :infos, :kind, :integer
  end
end
