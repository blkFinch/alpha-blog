require 'test_helper'

class CreateCategoriesTest < ActionDispatch::IntegrationTest

  test "get new category for and create category" do
    get new_category_path
    assert_template 'categories/new'
    assert_difference 'category.count', 1 do
      post categories_path, params: { category: { name:"sports" } }
    end
    assert_template 'categories/show'
    assert_match "sports", response.body
  end
end