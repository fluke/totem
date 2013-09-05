require "spec_helper"

describe EngagementsController do
  describe "routing" do

    it "routes to #index" do
      get("/engagements").should route_to("engagements#index")
    end

    it "routes to #new" do
      get("/engagements/new").should route_to("engagements#new")
    end

    it "routes to #show" do
      get("/engagements/1").should route_to("engagements#show", :id => "1")
    end

    it "routes to #edit" do
      get("/engagements/1/edit").should route_to("engagements#edit", :id => "1")
    end

    it "routes to #create" do
      post("/engagements").should route_to("engagements#create")
    end

    it "routes to #update" do
      put("/engagements/1").should route_to("engagements#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/engagements/1").should route_to("engagements#destroy", :id => "1")
    end

  end
end
