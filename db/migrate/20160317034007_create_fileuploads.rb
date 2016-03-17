class CreateFileuploads < ActiveRecord::Migration
  def change
    create_table :fileuploads do |t|
      t.string :filename
      t.references :fileuploadable, :polymorphic => true

      t.timestamps
    end
  end
end
