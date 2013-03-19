require 'spec_helper'

describe AlertsController, "Routing" do
 # it { {get: "/alerts"}.should route_to(controller: "alerts", action: "index") }
 it { {get: "/alerts/new"}.should route_to(controller: "alerts", action: "new") }
 it { {post: "/alerts"}.should route_to(controller: "alerts", action: "create") }
 # it { {get: "/alerts/1/edit"}.should route_to(controller: "alerts", action: "edit", id: "1") }
 # it { {put: "/alerts/1"}.should route_to(controller: "alerts", action: "update", id: "1") }
 # it { {get: "/alerts/1"}.should route_to(controller: "alerts", action: "show", id: "1") }
 # it { {delete: "/alerts/1"}.should route_to(controller: "alerts", action: "destroy", id: "1") }
end

describe AlertsController, "Actions" do
  render_views

  # describe "on GET #index" do
  #   it "should render index template" do
  #     get :index
  #     response.should render_template("index")
  #   end

  #   it "should set the alerts variable" do
  #     get :index
  #     assigns(:alerts).should_not be_nil
  #   end
  # end

  describe "on GET #new" do
    it "should render 'new' template" do
      get :new
      response.should render_template('new')
    end

    it "should set @alert with a new object" do
      get :new
      assigns(:alert).new_record?.should be(true)
    end
  end

  describe "on POST #create" do
    before(:each) do
      @valid_params =  FactoryGirl.attributes_for(:alert)
    end

    it "creates a new Alert" do
      expect {
          post :create, alert: @valid_params
        }.to change(Alert, :count).by(1)
    end

    it "assigns a newly created alert as @alert" do
      post :create, alert: @valid_params
      assigns(:alert).should be_a(Alert)
    end

    it "should redirect to index after success" do
      post :create, alert: @valid_params
      response.should redirect_to(root_path)
    end

    it "should render 'new' if there is a validation error" do
      post :create
      response.should render_template('new')
    end
  end

  # describe "on GET to #edit" do
  #   before(:each) do
  #     @alert =  FactoryGirl.create(:alert)
  #   end

  #   it "should render edit template" do
  #     get :edit, id: @alert.id
  #     response.should render_template("edit")
  #   end

  #   it "should assing the alert variable" do
  #     get :edit, id: @alert.id
  #     assigns(:alert).should == @alert
  #   end

  #   it "should raise 404 if the alert is not found" do
  #     expect{
  #       get :edit, id: '0'
  #     }.to raise_error(ActiveRecord::RecordNotFound)
  #   end
  # end

  # describe "on PUT to #update" do
  #   before do
  #     @alert =  FactoryGirl.create(:alert)
  #     valid_params = { xyz: "XYZ", alert_id: @alert.id  }
  #   end

  #   it "should raise 404 if the alert is not found" do
  #     expect{
  #       put :update, id: '0'
  #     }.to raise_error(ActiveRecord::RecordNotFound)
  #   end

  #   it "should redirecto to alert path" do
  #     put :update, id: @alert.id, alert: valid_params
  #     response.should redirect_to alert_path(@alert)
  #   end

  #   it "should update the xyz after success" do
  #     put :update, id: @alert.id, alert: valid_params
  #     assigns(:alert).xyz.should == "XYZ"
  #   end

  #   it "should render 'edit' on failure" do
  #     Alert.any_instance.stubs(:update_attributes).returns(false)
  #     put :update, id: @alert.id, alert: valid_params
  #     response.should render_template('edit')
  #   end
  # end

  # describe "on GET #show" do
  #   before do
  #     @alert =  FactoryGirl.create(:alert)
  #   end

  #   it "should render show template" do
  #     get :show, id: @alert.id
  #     response.should render_template("show")
  #   end

  #   it "should set alert from the id" do
  #     get :show, id: @alert.id
  #     assigns(:alert).should == @alert
  #   end

  #   it "should raise error for unexistant alert" do
  #     lambda {
  #       get :show, id: '0'
  #     }.should raise_error(ActiveRecord::RecordNotFound)
  #   end
  # end

  # describe "on DELETE to #destroy" do
  #   before do
  #     @alert =  FactoryGirl.create(:alert)
  #   end

  #   it "should assing the alert variable" do
  #     delete :destroy, id: @alert.id
  #     assigns(:alert).should == @alert
  #   end

  #   it "should redirect to index after destroy" do
  #     delete :destroy, id: @alert.id
  #     response.should redirect_to(alerts_path)
  #   end

  #   it "should remove the record" do
  #     expect {
  #       delete :destroy, id: @alert.id
  #     }.to change(Alert, :count).by(-1)
  #   end
  # end

end