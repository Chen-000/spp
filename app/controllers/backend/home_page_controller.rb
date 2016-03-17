class Backend::HomePageController <Backend::BaseController
  before_filter :authenticate_user!
  def index
  	
  end
end