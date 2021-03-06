class ArticlesController < ApplicationController
  before_action :set_article, only: [:edit, :update, :show, :destroy]
  
  def index
    @articles = Article.all
  end
  
  def new
    @article = Article.new
    
  end
  def edit
    
  end
  
  def update
    if @article.update(article_params)
      flash[:success] = "Article was edited succesfully"
      redirect_to article_path(@article)
    else
      render "edit"
    end
  end
  def create
    #render plain: params[:article].inspect
    #@article.save
    @article = Article.new(article_params)
    if @article.save
      flash[:success] = "Article was created succesfully"
      redirect_to article_path(@article)
    else
      render "new"
    end
    #redirect_to articles_path(@article)  #you however need to define the show method first or this will not work
  end
  
  def show
    
  end
  
  def destroy
    @article.destroy
    flash[:danger] = "Article was destroyed bitch!"
    redirect_to articles_path
  end
  private
    def set_article
      @article = Article.find(params[:id])
    end
    def article_params
      params.require(:article).permit(:title, :description)
    
    
    end
  
  
  
end
