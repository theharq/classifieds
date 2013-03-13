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

end