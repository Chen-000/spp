class Backend::ContactsController < Backend::BaseController

  def index
    @contacts = Contact.all.order('id desc').page(params[:page]).per(20)    
  end

  def new
    @contact = Contact.new
  end

  def create
    @contact= Contact.new(contact_params)
    if @contact.save
      @contact.avatars.create(:photo => params[:photo])
      redirect_to backend_contacts_path
    else
      render 'new'
    end 
  end

  def edit
    @contact = Contact.find(params[:id])  
  end

 def  update
      @contact = Contact.find(params[:id])  
      @contact.update_attributes(contact_params)
     if params[:photo]
         @contact.avatars.each do |ta|
          ta.update(:photo => params[:photo])
         end
     end  
    redirect_to backend_contacts_path  
  end


  def destroy
    @contact = Contact.find(params[:id])
    @contact.destroy
    redirect_to backend_contacts_path  	
  end

  private			
    def contact_params
      params.require(:contact).permit(:title, :address, :poste, :email, :phone)
    end
end