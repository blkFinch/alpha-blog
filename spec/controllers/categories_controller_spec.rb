require 'rails_helper'

RSpec.describe CategoriesController do
  before :each do
    @category = Category.create(name: "sports")
    @user = User.create(username:'admin', email:'email@email.com', password:'password', admin: true)
  end

  describe "GET index" do
    it "it renders index template" do
      session[:user_id] = @user.id
      get :index
      expect(response).to render_template("index")
    end
  end

  describe "GET new" do
    it "it renders new template" do
      session[:user_id] = @user.id
      get :new
      expect(response).to render_template("new")
    end
  end

  describe "GET show" do
    it "it renders show template" do
      get :show, params:{id: @category.id}
      expect(response).to render_template("show")
    end
  end

  describe "POST create" do
    it "should redirect when admin user not logged in" do
      post :create, params: { category: {name: "sports"}}
      expect(response).to redirect_to :action => :index
    end
  end
end