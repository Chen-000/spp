class Backend::AboutsController < Backend::BaseController
	
  #before_filter :create
        
  def index 
    @about = About.find(params[:id]) if About.pluck(:id).include?(params[:id].to_i)
    @about = About.first if !About.all.blank? && params[:id].blank?
   
  end

  def create
    @about= About.new(about_params)
      if @about.save
    redirect_to backend_abouts_path
      end
  end

  def update
    @about = About.find(params[:id]) if params[:id]
    @about.update_attributes(about_params) 
            flash[:success] = '操作成功.'
    redirect_to  backend_abouts_path(id: params[:id])
  end

  private			
    def about_params
      params.require(:about).permit(:item, :content, :id)
  end



end