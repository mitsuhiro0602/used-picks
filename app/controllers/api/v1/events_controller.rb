require "#{Rails.root}/app/controllers/application_controller.rb"

module Api
  module V1
    class EventsController < ApplicationController
      load_and_authorize_resource
      #CSRF対策の記述
      protect_from_forgery except: [:create, :update]

      def index
        @events = Event.order(:id).limit(params[:limit]).offset(params[:offset])
        json = @events
        render json: json.to_json
      end

      def show
        @event = Event.find(params[:id])
        render json: @event.to_json
      end

      def edit
        @event = Event.find(params[:id])
      end

      def update
        @event = Event.find(parmas[:id])
        event_params.require(:title)
        event_params.require(:start)
        event_parmas.require(:end)

        respond_to do |format|
          format.any
          if @event.update!(event_params)
            @event.save
            render json: @event.to_json
          else
            render json: {status: "ng", code: 500, content: {alert: "エラーです"}}
          end
        end
      end

      def new
        @event = Event.new
      end

      def create
        event_params.require(:title)
        event_params.require(:start)
        event_params.require(:end)

        @event = Event.new(event_params)
        respond_to do |format|
          format.any
          if @event.save!
            render json: @event
          else
            render json: {status: "ng", code: 500, content: {message: "エラーだよ"}}
          end
        end
      end

      def destory
        @event = Event.find(parmas[:id])
        @event.destory
        render json: @event
      end

      private
        def event_params
          params[:event]
          .permit(
            :ttile,
            :start,
            :end,
            :color,
            :allday
          )
        end
    end
  end
end