class Nav < ActiveRecord::Base
  has_many :avatars, :as => :avatarable,dependent: :destroy
  has_many :fileuploads, :as => :fileuploadable, dependent: :destroy
  KIND = {1 =>"请选择....", 2 =>"解决方案", 3 =>"成功案例", 4 =>"资讯动态" , 5 =>"关于我们", 6 =>"广纳贤才"}
end
