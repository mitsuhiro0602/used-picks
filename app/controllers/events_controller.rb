class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  
  def index
    @events = Event.all

    respond_to do |format|
      format.html
      format.xml { render :xml => @events}
      format.json { render :json => @events}
    end
  end

  def show
  end

  def new
    @event = Event.new
  end

  def edit
  end

  def create
    @event = Event.new(event_params)

    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: '予定を作成しました'}
        format.json { render :show, status: :created, location: @event}
      else
        format.html{ render :new}
        format.json{ render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @event.html { redirect_to @event, notice: '予定を更新しました'}
        format.html { render :show, status: :ok, location: @event}
      else
        format.html { render :edit}
        format.json { render json: @event.errors, status: :unprocessable_entity}
      end
    end
  end

  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: '予定を削除しました'}
      format.json { head :no_content}
    end
  end

  private
  def set_event
    @event = Event.find(parmas[:id])
  end

  def event_params
    params.require(:event).permit(
      :title,
      :start,
      :end,
      :color,
      :allday
    )
  end
end
