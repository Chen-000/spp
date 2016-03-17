class Backend::ArticlesController < Backend::BaseController

  def index
    @articles = Article.all.order("id desc").page(params[:page]).per(20)
  end

end