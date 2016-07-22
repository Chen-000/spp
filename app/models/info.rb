class Info < ActiveRecord::Base
   has_many :avatars, :as => :avatarable,dependent: :destroy
   KIND = {1 =>"请选择....", 2 =>"行业资讯", 3 =>"公司动态"}
end
