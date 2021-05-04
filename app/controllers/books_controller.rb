class BooksController < ApplicationController

  def show
    @book = Book.find(params[:id])
    @book_new = Book.new
    @books = Book.all
    @user = @book.user
    @post_comment = PostComment.new
    @post_comments = @book.post_comments
    @favorite = Favorite.new



  end

  def index
    @book = Book.new
    @books = Book.all
    @user = @book.user
    @favorite = Favorite.find_by(book_id: params[:book_id], user_id: current_user.id)
    @favorites = Favorite.all

  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      redirect_to book_path(@book.id), notice: "You have created book successfully."
    else
      @books = Book.all
      render 'index'
    end
  end

  def edit
    @book = Book.find(params[:id])
     if @book.user==current_user
     render "edit"
     else
     redirect_to books_path
     end
  end



  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to book_path(@book), notice: "You have updated book successfully."
    else
      render "edit"
    end
  end

  def destroy
    @book = Book.find(params[:id])
    if @book.user==current_user
      @book.destroy
      redirect_to books_path
    end
  end

  private

  def book_params
    params.require(:book).permit(:title, :body )
  end

end
