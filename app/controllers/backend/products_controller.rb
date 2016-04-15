class Backend::ProductsController < Backend::BaseController
   before_filter :find_product
  def index
    @products = Product.all.order('kind desc').page(params[:page]).per(20)		
  end

  def new
    @product = Product.new	
  end

  def create
    @product = Product.new(product_params)
    if @product.save
       if params[:pics]
        params[:pics].values.each do |f|
          @product.fileuploads.create('filename' => f)
        end
      end
      redirect_to backend_products_path(:back => request.fullpath)
    else
      render 'new'	
    end
  end

  def edit
  	
  end

  def update
     @product.update_attributes(product_params)
      if params[:pics]
      params[:pics].values.each do |f|
        @product.fileuploads.create('filename' => f)
      end
    end
    redirect_to backend_products_path(:back => request.fullpath) 
  end

  def destroy
    @product.destroy
    redirect_to backend_products_path
  end

  def file_delete
    @fileupload = Fileupload.find(params[:file_id])
    @fileupload.destroy
    redirect_to :back
  end

  def file_download
    @fileupload = Fileupload.find(params[:file_id])
    send_file(@fileupload.filename.path, type:'charset=utf-8')
  end

  private
    def product_params
      params.require(:product).permit(:name, :kind, :introduction, :programme, :detail)	
    end

    def find_product
      @product = Product.find(params[:id]) if params[:id]
    end
end