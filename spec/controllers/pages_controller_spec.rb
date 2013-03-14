require 'spec_helper'

describe PagesController, "Routing" do
 it { {get: "/"}.should route_to(controller: "pages", action: "index") }
end

describe PagesController, "Actions" do
  render_views

  describe "on GET #index" do
    it "should render index template" do
      get :index
      response.should render_template("index")
    end

    it "should set the classifieds variable" do
      get :index
      assigns(:classifieds).should_not be_nil
    end
  end

  describe "on POST #create" do
    before(:each) do
      @category = FactoryGirl.create(:category)
      @classified = @category.classifieds.create(FactoryGirl.attributes_for(:classified))
    end
    it "should assign classifieds is category params is sent" do
      xhr :post, :create, category: @category.id
      assigns(:classifieds).should_not be_nil
    end
    it "should assign classifieds is keyword params is sent" do
      xhr :post, :create, keyword: "classified"
      assigns(:classifieds).should_not be_nil
    end
    it "should get the classifieds from the category" do
      xhr :post, :create, category: @category.id
      assigns(:classifieds).last.content.should == @classified.content
    end
    it "should get the classifieds from the keyword" do
      xhr :post, :create, keyword: "classified"
      assigns(:classifieds).last.content.should == @classified.content
    end
  end





end