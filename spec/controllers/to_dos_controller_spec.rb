require 'rails_helper'

RSpec.describe ToDosController, type: :controller do
  describe "POST create" do
    before(:each) do
      @list = List.create(title: 'test')
    end

    it "responds with 200" do
      post :create, {list_id: @list.id, title: 'test', format: :json}
      expect(response.status).to eq 200
    end

    it "responds with correct keys" do
      post :create, {list_id: @list.id, title: 'test', format: :json}
      expect(JSON.parse(response.body).keys).to eq ["id", "title", "checked"]
    end

    it "creates a to do with a title" do
      post :create, {list_id: @list.id, title: 'test', format: :json}
      expect(ToDo.last.title).to eq 'test'
    end

    it "creates a to do without a title" do
      post :create, {list_id: @list.id, format: :json}
      expect(ToDo.last.title).to eq nil
    end

    it "responds with 422 is list id is invalid" do
      post :create, {list_id: (@list.id + 9999), title: 'test', format: :json}
      expect(response.status).to eq 422
    end
  end

  describe "PUT update" do
    before(:each) do
      @list = List.create(title: 'test')
      @to_do = @list.to_dos.create(title: 'to do test')
    end

    it "responds with 200" do
      put :update, {id: @to_do.id, title: 'test123', format: :json}
      expect(response.status).to eq 200
    end

    it "responds with correct keys" do
      put :update, {id: @to_do.id, title: 'test123', format: :json}
      expect(JSON.parse(response.body).keys).to eq ["id", "title", "checked"]
    end

    it "updates to_do's title" do
      put :update, {id: @to_do.id, title: 'test123', format: :json}
      expect(@to_do.reload.title).to eq 'test123'
    end

    it "updates to_do's checked" do
      put :update, {id: @to_do.id, checked: true, format: :json}
      expect(@to_do.reload.checked).to eq true
    end

    it "responds with 422 if id is invalid" do
      put :update, {id: (@to_do.id + 999999), title: 'test123', format: :json}
      expect(response.status).to eq 422
    end
  end

  describe "DELETE destroy" do
    before(:each) do
      @list = List.create(title: 'test')
      @to_do = @list.to_dos.create(title: 'to do test')
    end

    it "responds with 200" do
      delete :destroy, {id: @to_do.id, format: :json}
      expect(response.status).to eq 200
    end

    it "responds with correct keys" do
      delete :destroy, {id: @to_do.id, format: :json}
      expect(JSON.parse(response.body).keys).to eq ["id", "title", "checked"]
    end

    it "deletes the to_do" do
      delete :destroy, {id: @to_do.id, format: :json}
      expect(ToDo.find_by_id(@to_do.id)).to eq nil
    end

    it "responds with 422 if id is invalid" do
      delete :destroy, {id: (@to_do.id + 99999), format: :json}
      expect(response.status).to eq 422
    end
  end
end
