class ArticlesController < ApplicationController
  #http basic autheication
  http_basic_authenticate_with name: "tomwerewolf", 
                              password: "123",
                              except: [:index, :show]
  
  #Action "index", view all articles                            
  def index
    @articles = Article.all
  end

  #Action "show", show a specific article with given id
  def show
    @article = Article.find(params[:id])
  end

  #Initialize a new object of article
  def new
    @article = Article.new
  end

  #Add to database by ActionRecord
  def create
    @article = Article.new(article_params) 

    if @article.save
      #ALWAYS redirect after mutating database
      redirect_to @article
    else
      #Show message
      render :new, status: :unprocessable_entity 
    end
  end

  #Action "edit" to fetch article id
  def edit
    @article = Article.find(params[:id])
  end

  #Action "update" to update table with params
  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render :edit, status: :unprocessable_entity
    end
  end

  #Action "destroy" to delete a record in database with params
  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to root_path, status: :see_other
  end

  #Strong parameter to control and secure the values to be changed
  private
    def article_params
      params.require(:article).permit(:title, :body, :status)
    end

end
