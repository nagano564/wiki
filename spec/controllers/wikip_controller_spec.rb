require 'rails_helper'

RSpec.describe WikipController, type: :controller do

  let(:my_wikip) { Wikip.create!(title: "My wikip title", body: "My wikip body") }

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "assigns [my_wikip] to @wikips" do
      get :index
      expect(assigns(:wikips)).to eq([my_wikip])
    end
  end


  #  describe "GET show" do
  #    it "returns http success" do
  #      get :show
  #      expect(response).to have_http_status(:success)
  #    end
  #  end

  # describe "GET new" do
  #   it "returns http success" do
  #     get :new
  #     expect(response).to have_http_status(:success)
  #   end
  # end

  #  describe "GET edit" do
  #    it "returns http success" do
  #      get :edit
  #      expect(response).to have_http_status(:success)
  #    end
  #  end

end
