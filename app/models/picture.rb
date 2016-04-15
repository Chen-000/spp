class Picture < ActiveRecord::Base
  has_many :avatars, :as => :avatarable,dependent: :destroy
  KIND = {1=>"轮播图",0=>"普通图片", 2=>"选择", 3=>"方案产品banner", 4=>"资讯动态banner" , 5=>"关于我们banner", 6=>"联系我们banner"}
end
