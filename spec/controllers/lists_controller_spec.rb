require 'rails_helper'

RSpec.describe ListsController, type: :controller do
  describe "POST create" do
    it "responds with 200" do
      post :create, {title: 'test', format: :json}
      expect(response.status).to eq 200
    end

    it "responds with correct keys" do
      post :create, {title: 'test', format: :json}
      expect(JSON.parse(response.body).keys).to eq ['id', 'title', 'to_dos']
    end

    it "creates a list with a title" do
      post :create, {title: 'test', format: :json}
      expect(List.last.title).to eq 'test'
    end

    it "creates a list without a title" do
      post :create, {format: :json}
      expect(List.last.title).to eq nil
    end
  end

  describe "PUT update" do
    before(:each) do
      @list = List.create(title: 'test')
    end

    it "responds with 200" do
      put :update, {id: @list.id, title: 'test123', format: :json}
      expect(response.status).to eq 200
    end

    it "responds with correct keys" do
      put :update, {id: @list.id, title: 'test123', format: :json}
      expect(JSON.parse(response.body).keys).to eq ['id', 'title', 'to_dos']
    end

    it "updates list's title" do
      put :update, {id: @list.id, title: 'test123', format: :json}
      expect(@list.reload.title).to eq 'test123'
    end

    it "responds with 422 if id is invalid" do
      put :update, {id: (@list.id + 999999), title: 'test123', format: :json}
      expect(response.status).to eq 422
    end
  end

  describe "DELETE destroy" do
    before(:each) do
      @list = List.create(title: 'test')
    end

    it "responds with 200" do
      delete :destroy, {id: @list.id, format: :json}
      expect(response.status).to eq 200
    end

    it "responds with correct keys" do
      delete :destroy, {id: @list.id, format: :json}
      expect(JSON.parse(response.body).keys).to eq ['id', 'title', 'to_dos']
    end

    it "deletes the list" do
      delete :destroy, {id: @list.id, format: :json}
      expect(List.find_by_id(@list.id)).to eq nil
    end

    it "responds with 422 if id is invalid" do
      delete :destroy, {id: (@list.id + 99999), format: :json}
      expect(response.status).to eq 422
    end
  end
end
