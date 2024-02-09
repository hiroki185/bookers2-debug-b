class BooksController < ApplicationController
before_action :is_matching_login_user, only: [:edit, :update]

  def show
    @book = Book.find(params[:id])
    @user = @book.user
    @book_comment = BookComment.new
    @books = Book.all
    @newbook = Book.new
    @book.increment!(:view_count)
  end

  def index
  to = Time.current.at_end_of_day
  from = (to - 6.day).at_beginning_of_day
  
  
  if params[:latest]
     @books = Book.latest
  elsif params[:old]
     @books = Book.old
  elsif params[:star_count]
     @books = Book.star_count
  else
     @books = Book.includes(:favorites).sort_by { |book| -book.favorites.where(created_at: from...to).count }
  end
  
    @user = current_user
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      redirect_to book_path(@book), notice: "You have created book successfully."
    else
      @books = Book.all
      @user = current_user
      render :index
    end
  end

  def edit
    @book = Book.find(params[:id])
    @user = current_user
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to book_path(@book), notice: "You have updated book successfully."
    else
      render :edit
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(:title, :body, :star, :category)
  end

  def is_matching_login_user
    book = Book.find(params[:id])
    user = book.user
    unless user.id == current_user.id
      redirect_to books_path
    end
  end

end
