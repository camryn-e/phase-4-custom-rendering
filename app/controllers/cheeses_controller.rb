class CheesesController < ApplicationController

  # GET /cheeses
  def index
    cheeses = Cheese.all

    render json: cheeses

    # second option: using "only"
    # render json: cheeses, only: [:id, :name, :price, :is_best_seller]

    # third option: using "except"
    # render json: cheeses, except: [:created_at, :updated_at]
  end

  # GET /cheeses/:id
  def show
    cheese = Cheese.find_by(id: params[:id])
    # first option: manual rendering
    # render json: {
    #   id: cheese.id,
    #   name: cheese.name,
    #   price: cheese.price,
    #   is_best_seller: cheese.is_best_seller
    # }

    # using "except" with methods
    if cheese
      render json: cheese, except: [:created_at, :updated_at], methods: [:summary]
    else
      render json: { error: 'Cheese not found' }, status: :not_found
    end
  end

end
