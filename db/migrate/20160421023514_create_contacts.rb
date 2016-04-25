class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :title
      t.string :address
      t.integer :poste
      t.string :email
      t.string :phone
      t.timestamps
    end
  end
end
