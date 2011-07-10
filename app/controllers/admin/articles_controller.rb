class Admin::ArticlesController < AdminController
  
  def index
    @articles = Article.order('id desc').page params[:page]
  end
  
  def new
    @article = Article.new
  end
  
  def create
    @article = Article.create(params[:article])
    if @article.save
      flash[:notice] = "You successfully created a new article."
      redirect_to admin_articles_path
    else
      render 'new'
    end
  end
  
  def show
    @article = Article.find(params[:id])
  end
  
  def edit
    @article = Article.find(params[:id])
  end
  
  def update
    @article = Article.find(params[:id])
    if @article.update_attributes(params[:article])
      flash[:notice] = "You successfully updated the article"
      redirect_to admin_article_path
    else
      render 'edit'
    end
  end
  
  def destroy
    @article = Article.find(params[:id])
    if @article.destroy
      flash[:notice] = "You successfully removed the article"
    else
      flash[:error] = "The event could not be removed, please try again."
    end
    redirect_to admin_articles_path    
  end
end