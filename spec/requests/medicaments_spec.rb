require 'rails_helper'

RSpec.describe "Medicaments", type: :request do
  describe "GET /medicaments" do
    it "Listar medicamentos com usuário logado" do
      post "/login", :params => { :username => 'admin', :password => 'admin' }
      get medicaments_path
      expect(response).to have_http_status(200)
    end

    it "Listar medicamentos sem usuário logado" do
      get medicaments_path
      expect(response).to have_http_status(302)
    end
  end
end
