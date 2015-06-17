class ToDosController < ApplicationController
  def create
    list = List.find_by_id(params[:list_id])
    if list
      @to_do = list.to_dos.create(title: params[:title])
      render json: @to_do, serializer: ToDoSerializer, root: nil
    else
      api_response_unprocessable_entity
    end
  end

  def update
    to_do_params = {}
    to_do_params[:title] = params[:title] if params[:title].present?
    to_do_params[:checked] = params[:checked] if params[:checked].present?

    @to_do = ToDo.find_by_id(params[:id])
    if @to_do
      @to_do.update_attributes(to_do_params)
      render json: @to_do, serializer: ToDoSerializer, root: nil
    else
      api_response_unprocessable_entity
    end
  end

  def destroy
    @to_do = ToDo.find_by_id(params[:id])
    if @to_do
      @to_do.destroy
      render json: @to_do, serializer: ToDoSerializer, root: nil
    else
      api_response_unprocessable_entity
    end
  end
end
