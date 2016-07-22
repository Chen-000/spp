class Backend::InfosController <Backend::BaseController
  before_action :find_info

  def index
    @infos = Info.all.order('kind desc').page(params[:page]).per(20)    
  end

  def new
    @info = Info.new 
  end

  def create
    @info = Info.new(info_params)
    if @info.save
      @info.avatars.create(:photo => params[:photo])
      redirect_to backend_infos_path
    else
      render 'new'
    end	
  end

  def edit
    @info = Info.find(params[:id])	
  end

  def update
    @info.update_attributes(info_params)
     if params[:photo]
         @info.avatars.each do |ta|
          ta.update(:photo => params[:photo])
         end
     end  
    redirect_to backend_infos_path	
  end

  def destroy
    @info.destroy
    redirect_to backend_infos_path  	
  end

  private
    def info_params
      params.require(:info).permit(:title, :desc, :kind )  
    end

    def find_info
      @info = Info.find(params[:id]) if params[:id]  
    end
end