class Backend::ArticlesController < Backend::BaseController
  before_filter :find_article

  def index
    @articles = Article.all.order("id desc").page(params[:page]).per(20)
  end

  def new
    @article = Article.new	
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to backend_articles_path
    else
      render 'new'
    end	
  end

  def edit
   
  end

  def update
    @article.update_attributes(article_params)
    redirect_to backend_articles_path	
  end

  def destroy
    @article.destroy
    redirect_to backend_articles_path	
  end

  private
    def article_params
      params.require(:article).permit(:title, :desc, :catalog_id)	
    end

    def find_article
       @article = Article.find(params[:id]) if params[:id]		
    end

end