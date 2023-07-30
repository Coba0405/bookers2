class BooksController < ApplicationController
  def new
    @book = Book.new
  end
  
  def index
    @books = Book.all
    @user = current_user
    # 「@user = current_user」でサインインしているユーザーを取得する
    @book = Book.new
    
  end
  
  def create
    @book = Book.new(book_params)
    # @book = Book.find(params[:id])
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] = "You have created book successfully."
      redirect_to book_path(@book.id)
    else
      @books = Book.all
      @user = current_user
      render :index
    end
  end
  
  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  def update
    @book = Book.find(params[:id])
    # @book.user_id = current_user.id
    flash[:notice] = "You have updated book successfully."
    if @book.update(book_params)
      redirect_to book_path(@book.id)
    else
      render :edit
    end
  end
  
  def show
    @book = Book.find(params[:id])
    @user = @book.user
  end

  def edit
    @book = Book.find(params[:id])
    @user = @book.user
      if @user != current_user 
        redirect_to books_path
      end
    # if @book.update(book_params)
      # redirect_to book_path(@book.id)
    # else
      # render :edit
    # end
  end

  
  private
  def book_params
    params.require(:book).permit(:title, :body, :image)
  end
end
