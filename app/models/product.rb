class Product < ActiveRecord::Base
  has_many :avatars, :as => :avatarable,dependent: :destroy
  has_many :fileuploads, :as => :fileuploadable, dependent: :destroy
end
