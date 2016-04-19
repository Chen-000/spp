class Product < ActiveRecord::Base
  has_many :avatars, :as => :avatarable,dependent: :destroy
  has_many :fileuploads, :as => :fileuploadable, dependent: :destroy
  KIND = {1 =>"请选择....", 2 =>"网上商城", 3 =>"电子交易化", 4 =>"其他应用" }
end
