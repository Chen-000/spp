class Fileupload < ActiveRecord::Base
  belongs_to :fileuploadable, :polymorphic => true
  mount_uploader :filename, FileUploader
end
