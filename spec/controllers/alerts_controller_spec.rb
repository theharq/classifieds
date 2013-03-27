require 'spec_helper'

describe AlertsController, "Routing" do
 it { {get: "/alerts"}.should route_to(controller: "alerts", action: "index") }
 it { {get: "/alerts/new"}.should route_to(controller: "alerts", action: "new") }
 it { {post: "/alerts"}.should route_to(controller: "alerts", action: "create") }
 it { {get: "/alerts/1/edit"}.should route_to(controller: "alerts", action: "edit", id: "1") }
 it { {put: "/alerts/1"}.should route_to(controller: "alerts", action: "update", id: "1") }
 it { {delete: "/alerts/1"}.should route_to(controller: "alerts", action: "destroy", id: "1") }
end

describe AlertsController, "Actions" do
  render_views

  describe "on GET #index" do
    it "should render index template" do
      get :index
      response.should render_template("index")
    end
  end

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
        xhr :post, :create, alert: @valid_params
        }.to change(Alert, :count).by(1)
    end

    it "assigns a newly created alert as @alert" do
      xhr :post, :create, alert: @valid_params
      assigns(:alert).should be_a(Alert)
    end

    it "should display a flash with the success message" do
      xhr :post, :create, alert: @valid_params
      flash.now[:notice].should == "Alerta creada exitosamente"
    end

    it "should display a flash with the error" do
      xhr :post, :create
      flash.now[:error].should_not be_nil
    end
  end

  describe "on GET to #edit" do
    before(:each) do
      @alert =  FactoryGirl.create(:alert)
    end

    it "should render edit template" do
      get :edit, id: @alert.id
      response.should render_template("edit")
    end

    it "should assing the alert variable" do
      get :edit, id: @alert.id
      assigns(:alert).should == @alert
    end

    it "should raise 404 if the alert is not found" do
      expect{
        get :edit, id: '0'
      }.to raise_error(ActiveRecord::RecordNotFound)
    end
  end

  describe "on PUT to #update" do
    before do
      @alert =  FactoryGirl.create(:alert)
      @valid_params = { keywords: "new_stuff"  }
    end

    it "should raise 404 if the alert is not found" do
      expect{
        xhr :put, :update, id: '0'
      }.to raise_error(ActiveRecord::RecordNotFound)
    end

    it "should update the keywords after success" do
      xhr :put, :update, id: @alert.id, alert: @valid_params
      assigns(:alert).keywords.should == "new_stuff"
    end

    it "should display a flash with the success message" do
      xhr :put, :update, id: @alert.id, alert: @valid_params
      flash.now[:notice].should == "Alerta actualizada exitosamente"
    end

    it "should display a flash error on failure" do
      xhr :put, :update, id: @alert.id, alert: {keywords: ""}
      flash.now[:error].should_not be_nil
    end
  end


  describe "on DELETE to #destroy" do
    before do
      @alert =  FactoryGirl.create(:alert)
    end

    it "should assing the alert variable" do
      xhr :delete, :destroy, id: @alert.id
      assigns(:alert).should == @alert
    end

    it "should remove the record" do
      expect {
        xhr :delete, :destroy, id: @alert.id
      }.to change(Alert, :count).by(-1)
    end

    it "should display a flash with the success message" do
      xhr :delete, :destroy, id: @alert.id
      flash.now[:error].should == "Alerta Eliminada"
    end

    it "should display a flash error on failure" do
      Alert.any_instance.stub(:destroy).and_return(false)
      xhr :delete, :destroy, id: @alert.id
      flash.now[:error].should_not be_nil
    end
  end

  describe "on POST #search" do
    before(:each) do
      @alert =  FactoryGirl.create(:alert)
      @valid_params =  FactoryGirl.attributes_for(:alert)
    end

    it "assigns @alert if mail exists" do
      xhr :post, :search, email: @alert.email
      assigns(:alert).should be_a(Alert)
    end

    it "should display a flash with the error if email does not exists" do
      xhr :post, :search, email: "example@example.com"
      flash.now[:error].should_not be_nil
    end
  end

end