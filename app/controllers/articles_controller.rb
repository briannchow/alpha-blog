class ArticlesController < ApplicationController
  def new
    @article = Article.new
    
  end
  
  def create
    #render plain: params[:article].inspect
    @article = Article.new(article_params)
    @article.save
    redirect_to articles_show(@article)  #you however need to define the show method first or this will not work
  end
  
  private
    def article_params
      params.require(:article).permit(:title, :description)
    
    
    end
  
    
  
end
