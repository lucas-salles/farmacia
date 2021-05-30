require 'rails_helper'

RSpec.describe "Sales", type: :request do
  describe "GET /sales" do
    it "Listar compra com usuário logado" do
      post "/login", :params => { :username => 'admin', :password => 'admin' }
      get sales_path
      expect(response).to have_http_status(200)
    end

    it "Listar compra sem usuário logado" do
      get sales_path
      expect(response).to have_http_status(302)
    end
  end
end
