class DestinationsController < ApplicationController
    def index
        @destinations = Destination.all
    end

    def show
        @destination = Destination.find(params[:id])
    end

    def new

    end

    def create

    end

    def edit

    end

    def update

    end

    def destroy

    end

    private

    def destinations_params

    end

    def find_destination

    end
        
end