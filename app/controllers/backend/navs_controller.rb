class Backend::NavsController < Backend::BaseController
     before_filter :find_nav
  def index
    @navs = Nav.all.order('kind desc').page(params[:page]).per(20)		
  end

  def new
    @nav = Nav.new	
  end

  def create
    @nav = Nav.new(nav_params)
    if @nav.save
      @nav.avatars.create(:photo => params[:photo])
      redirect_to backend_navs_path
    else
      render 'new'
    end 
  end

  def edit
  	@nav = Nav.find(params[:id])
  end

  def update
     @nav = Nav.find(params[:id])  
      @nav.update_attributes(nav_params)
     if params[:photo]
         @nav.avatars.each do |ta|
          ta.update(:photo => params[:photo])
         end
     end  
    redirect_to backend_navs_path 
  end

  def destroy
    @nav.destroy
    redirect_to backend_navs_path
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
    def nav_params
      params.require(:nav).permit(:name, :kind, :introduction, :detail, :link)	
    end

    def find_nav
      @nav = Nav.find(params[:id]) if params[:id]
    end
end
