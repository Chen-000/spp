class Backend::AboutsController < Backend::BaseController
	
  #before_filter :create
        
  def index 
    @about = About.find(params[:id]) if About.pluck(:id).include?(params[:id].to_i)
    @about = About.first if !About.all.blank? && params[:id].blank? 
  end
   
   def new
    @picture = Picture.new  
  end

  def save_about_picture
    @picture = Picture.new(picture_params)
     if @picture.save
      @picture.avatars.create(:photo => params[:photo])
      redirect_to countrys_backend_abouts_path(:back => request.fullpath)
    else
      render 'new'    
    end    
  end

  def create
    @about= About.new(about_params)
    @about.save
    redirect_to backend_abouts_path   
  end

  def countrys
    @about_pictures = Picture.all.where(kind: 8)   
  end
   
  def edit
    @picture = Picture.find(params[:id])
  end

  def up_picture
    @picture = Picture.find(params[:id])
    @picture.update_attributes(picture_params)
     if params[:photo]
         @picture.avatars.each do |ta|
          ta.update(:photo => params[:photo])
         end
     end  
    redirect_to countrys_backend_abouts_path(:back => request.fullpath) 
  end

  def destroy
    @picture = Picture.find(params[:id])
    @picture.destroy
    redirect_to countrys_backend_abouts_path(:back => request.fullpath)
  end

  private			
    def about_params
      params.require(:about).permit(:item, :content, :id)
    end
    def picture_params
      params.require(:picture).permit(:name, :link, :kind)
    end 
end