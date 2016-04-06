class Backend::ProductManagesController < Backend::BaseController
  def index
      @products = Product.all.order('id desc').page(params[:page]).per(20)	
  end
end