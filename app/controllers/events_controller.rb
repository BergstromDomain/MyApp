class EventsController < ApplicationController
  before_action :set_person, only: %i[ show new edit create update destroy ]
  before_action :set_event, only: %i[ show edit update destroy ]

  def index
    @events = Event.all
  end

  def show
  end

  def new
    @event = Event.new
  end

  def edit
  end

  def create
    @event = @person.events.new(event_params)

    respond_to do |format|
      if @event.save
        format.html { redirect_to person_event_path(@person, @event), notice: "#{@event.title.upcase_first} was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to person_event_path(@person, @event), notice: "The event was successfully updated to #{@event.title.upcase_first}." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to person_path(@person), notice: "Event was successfully deleted." }
    end
  end

  private
    def set_person
      @person = Person.find(params[:person_id])
    end
    
    def set_event
      @event = @person.events.find(params[:id])
    end

    def event_params
      params.require(:event).permit(:title, :details, :day, :month, :year, :main_image, :thumb_image, :person_id)
    end
end
