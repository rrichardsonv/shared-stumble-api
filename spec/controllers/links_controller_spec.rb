require 'rails_helper'

RSpec.describe LinksController, type: :controller do

  describe "GET #create" do
    it "returns http create" do
      get :create
      expect(response).to have_http_status(:created)
    end
  end

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

end
