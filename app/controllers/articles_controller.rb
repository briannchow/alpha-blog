class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end
  
  def new
    @article = Article.new
    
  end
  def edit
    @article = Article.find(params[:id])
  end
  
  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      flash[:notice] = "Article was edited succesfully"
      redirect_to article_path(@article)
    else
      render "edit"
    end
  end
  def create
    #render plain: params[:article].inspect
    @article = Article.new(article_params)
    #@article.save
    if @article.save
      flash[:notice] = "Article was created succesfully"
      redirect_to article_path(@article)
    else
      render "new"
    end
    #redirect_to articles_path(@article)  #you however need to define the show method first or this will not work
  end
  
  def show
    @article = Article.find(params[:id])
    
  end
  
  private
    def article_params
      params.require(:article).permit(:title, :description)
    
    
    end
  
  
  
end
