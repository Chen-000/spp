class Backend::AboutsController < ApplicationController
	layout 'spp'
        
  def index
    if 
    @about = About.first
    if params[:item] == 3
     @cotent = About.first.contact
   elsif params[:item] == 2
    @cotent = About.first.recruit
   else 
    @cotent = About.first.synopsis
   end
   @item = params[:item]
 else
    @about ||= About.new
  end
end

  def edit_detail
    @about = About.first
    @item = params[:item]
  end

    def create
     
    end

  def update
    @about = About.first
    @about.update_attributes(about_params)
    redirect_to :action => :index
  end

   private			
  def about_params
     params.require(:about).permit(:synopsis, :recruit, :contact, :id)
  end
end