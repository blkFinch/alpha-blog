require 'rails_helper'

RSpec.describe Category, :type => :model do
  it "is not valid without a name" do
    category = Category.new(name: " ")
    expect(category).to_not be_valid
  end

  it "is must have unique name" do
    category = Category.create(name: "sports")
    category2 = Category.new(name: "sports")
    expect(category2).to_not be_valid
  end

  it "is valid with valid attributes" do
    category = Category.new(name: "sports")
    expect(category).to be_valid
  end
end