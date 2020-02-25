class Api::V1::FactsController < ApplicationController
  before_action :find_fact, only: [:show, :update, :destroy]

    # GET /facts
    def index
      @facts = Fact.all
      render json: @facts
    end

    #GET fact/:id
    def show
      render json: @fact
    end

    # POST /facts
    def create
      @fact = Fact.new(fact_params)
      if @fact.save
        render json: @fact
      else
        render error: { error: 'unable to create fact' }, status: 400
      end
    end

    #PUT /facts/:id
    def update
        if @fact
            @fact.update(fact_params)
            render json: { message: 'Fact succesfully updated.' }, status: 200
        else
            render json: { error: 'Unable to update fact' }, status: 400
        end
    end

      #DELETE /fact/:id
    def destroy
        if @fact
            @fact.destroy
            render json: { message: 'Fact succesfully deleted.' }, status: 200
        else
            render json: { error: 'Unable to delete fact' }, status: 400
        end
    end

    private

    def user_params
      params.require(:fact).permit(:fact, :likes, :user_id)
    end

  def find_fact
    @fact = Fact.find(params[:id])
  end

end
