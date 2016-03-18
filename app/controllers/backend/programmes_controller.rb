class Backend::ProgrammesController < Backend::BaseController

    before_filter :authenticate_user!

  def index	 
    @programmes = Programme.all.order("id desc").page(params[:page]).per(20)
  end

  def new
    @programme = Programme.new
  end

   def show
    @programme = Programme.find(params[:id])
  end

  def create
    @programme = Programme.new(programme_params)
      if @programme.save
        @programme.avatars.create(:photo => params[:photo])
        redirect_to backend_programmes_path(:back => request.fullpath)
      else
        render 'new'   	
    end
  end

  def edit
    @programme = Programme.find(params[:id])
  end

  def update
    @programme = Programme.find(params[:id])  	
    @programme.update_attributes(programme_params)
      if params[:photo]
        @programme.avatars.each do |ta|   
        ta.update(:photo => params[:photo])
        end
      end  	
    redirect_to backend_programmes_path(:back => request.fullpath)
  end

  def destroy
    @programme = Programme.find(params[:id])
    @programme.destroy
    redirect_to backend_programmes_path
  end

  private


  def programme_params
    params.require(:programme).permit(:name, :content, :id)
  end

end
