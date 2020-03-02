class BooksController < ApplicationController
  def index
  	@books = Book.all
  	@users = {}
    @books.each do |book|
    	@users.store(book.user_id,User.find(book.user_id))
    end

    @user = User.find(current_user.id)
  	@book = Book.new
  end

  def show
  	@book = Book.find(params[:id])
    @book_new = Book.new
    @user = User.find(@book.user.id)
    @user_info = User.find(current_user.id)
  end

  def new
  	@book = Book.new
  end
  def create
    book = Book.new(book_params)
    if book.save
      flash[:notice] = "successfully"
      redirect_to book_path(book.id)
    else
      flash[:notice] = "error"
      redirect_to books_path
    end
  end
  def edit
    @book = Book.find(params[:id])
    if @book.user_id.to_s != current_user.id.to_s
      redirect_to books_path
    end
    @user = User.find(current_user.id)
  	@book = Book.find(params[:id])
  end
  def update
    book = Book.find(params[:id])
    if book.update(book_params)
      flash[:notice] = "successfully"
    else
      flash[:error] = "error"
    end
      redirect_to book_path(book.id)
  end
  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end
  private
  def book_params
    params.require(:book).permit(:user_id, :title, :body)
  end
end
