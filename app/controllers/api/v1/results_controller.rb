require 'csv'

module Api
  module V1
    class ResultsController < ApplicationController

      def office_candidates
        @state = State.find(params['state_id'])
        @office = Office.find(params['office_id'])
        render json: @state.candidates.distinct.where(candidates: { office_id: @office.id })
      end

      def state_results
        @state = State.find(params['state_id'])
        @office = Office.find(params['office_id'])
        render json: @state.render_state_results(@office)
      end

      def county_results
        @state = State.find(params['state_id'])
        @office = Office.find(params['office_id'])
        render json: @state.render_state_county_results(@office)
      end

      def precinct_results
        @county = County.find(params['county_id'])
        @office = Office.find(params['office_id'])
        render json: @county.render_county_precint_results(@office)
      end
      # def index
      #   @state = State.find(params['state_id'])
      #   render json: @state.render_state_results
      # end

      # def show
      #   @state = State.find(params['state_id'])
      #   if params[:id].split(' ').length == 1 && params[:id] =='county'
      #     render json: @state.render_state_county_results
      #   elsif params[:id].split(' ').length == 2 && params[:id].split(' ')[0] =='county'
      #     byebug
      #     county_id =  params[:id].split(' ')[1].to_i
      #     @county = County.find(county_id)
      #     render json: @county.render_county_precint_results
      #   elsif params[:id].split(' ').length == 1 && params[:id] =='precinct'
      #     render json: @state.render_state_precint_results
      #   end
      # end

      # def county_export
      #   @state = State.find(params[:state_id])
      #   respond_to do |format|
      #     format.csv { send_data @state.county_results_export, filename: "#{@state.name.downcase}-county-results-2016.csv" }
      #   end
      # end

      # def precinct_export
      #   @state = State.find(params[:state_id])
      #   respond_to do |format|
      #     format.csv { send_data @state.precinct_results_export, filename: "#{@state.name.downcase}-precinct-results-2016.csv" }
      #   end
      # end
    end
  end
end
