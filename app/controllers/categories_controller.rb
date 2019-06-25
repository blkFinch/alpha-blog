class CategoriesController < ApplicationController
  before_action :require_admin, except: [:index, :show]
  def index
    @categories = Category.paginate(page: params[:page], per_page: 6)
  end

  def show
    @category = Category.find(params[:id])
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      render 'show'
    else
      render 'new'
    end
  end

  private

  def require_admin
    if !logged_in? || !current_user.admin?
      flash[:danger] = "You must be a logged in as Admin to perform that action"
      redirect_to categories_path
    end
  end

  def category_params
    params.require(:category).permit(:name)
  end
end