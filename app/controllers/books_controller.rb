class BooksController < ApplicationController
  def index
    @books = Book.all()
  end
  def author 
     @author = Author.find_by(alias: params[:author])
     @books = @author.books
     render 'index'
  end

  def topic
   # page_token = params.has_key?(:older) ? params[:older] : params[:newer]
    
    @topic = Topic.find_by(alias: params[:topic])
   # paginate(page_token, @topic.id)
    @books = @topic.books
    render 'index'
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    @topics = Topic.all()
    @authors = Author.all()
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
  #  if @book.save
  #      redirect_to '/books/' + @book.id.to_s
  #    else  
  #      @authors = Author.all()
  #      @topics = Topic.all()
  #     # render 'new'
  #     @book.save
  #  end
  #  @book = Book.new(params.require(:book).permit(:title, :topic_id, :cover_url, :author_id))
    @book.save
     redirect_to '/books/' + @book.id.to_s
  end
 # def book_params
 #   params.require(:book).permit(:title, :topic_id, :cover_url, :author_id)
 # end
# private
  def book_params
    params[:book][:author_id] = params[:book][:author]
    params[:book][:topic_id] = params[:book][:topic]
    
    params.require(:book).permit(:title, :cover_url,  :author_id, :topic_id)
  end
end