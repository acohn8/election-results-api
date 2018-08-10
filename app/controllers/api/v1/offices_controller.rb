module Api
  module V1
    class OfficesController < ApplicationController
      def index
        @state = State.find(params['state_id'])
        render json: @state.offices.distinct
      end

      def show
        @office = Office.find(params['id'])
        render json: @office
      end
    end
  end
end
