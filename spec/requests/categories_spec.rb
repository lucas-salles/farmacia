require 'rails_helper'

RSpec.describe "Categories", type: :request do
  describe "GET /categories" do
    it "Listar categorias com usuário logado" do
      post "/login", :params => { :username => 'admin', :password => 'admin' }
      get categories_path
      expect(response).to have_http_status(200)
    end

    it "Listar categorias sem usuário logado" do
      get categories_path
      expect(response).to have_http_status(302)
    end
  end
end
