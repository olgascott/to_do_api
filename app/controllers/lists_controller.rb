class ListsController < ApplicationController
  def create
    @list = List.create(title: params[:title])
    render json: @list, serializer: ListSerializer, root: nil
  end

  def index
    @lists = List.all
    render json: @lists, each_serializer: ListSerializer, root: nil
  end
end
