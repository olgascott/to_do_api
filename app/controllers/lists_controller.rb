class ListsController < ApplicationController
  def create
    @list = List.create(title: params[:title])
    render json: @list, serializer: ListSerializer, root: nil
  end

  def index
    @lists = List.all
    render json: @lists, each_serializer: ListSerializer, root: nil
  end

  def update
    @list = List.find_by_id(params[:id])
    if @list
      @list.update_attributes(title: params[:title])
      render json: @list, serializer: ListSerializer, root: nil
    else
      #error
    end
  end

  def destroy
    @list = List.find_by_id(params[:id])
    if @list
      @list.destroy
      render json: @list, serializer: ListSerializer, root: nil
    else
      #error
    end
  end
end
