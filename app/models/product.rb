class Product < ActiveRecord::Base
  has_many :avatars, :as => :avatarable,dependent: :destroy
  has_many :fileuploads, :as => :fileuploadable, dependent: :destroy
  KIND = {1 =>"请选择....", 2 =>"解决方案", 3 =>"资讯动态", 4 =>"其他应用" }
end
