class Programme < ActiveRecord::Base
has_many :avatars, :as => :avatarable,dependent: :destroy
end