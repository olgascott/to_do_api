class ListsController < ApplicationController
  def create
    @list = List.create(title: params[:title])
    render json: @list, serializer: ListSerializer, root: nil
  end
end
