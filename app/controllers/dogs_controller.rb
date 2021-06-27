class DogsController < ApplicationController
  def create
    if current_user
      dog = Dog.new(
        name: params[:name],
        age: params[:age],
        breed: params[:breed],
        user_id: params[:user_id],
      )
      dog.save
      render json: dog.as_json
    else
      render json: { message: "user must be logged in to create new dogs" }
    end
  end
end
