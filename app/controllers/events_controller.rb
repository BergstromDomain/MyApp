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
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to person_event_path(@person, @event), notice: "The event was successfully updated to #{@event.title.upcase_first}." }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: "Event was successfully deleted." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_person
      @person = Person.find(params[:person_id])
    end
    
    def set_event
      @event = @person.events.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def event_params
      params.require(:event).permit(:title, :details, :day, :month, :year, :main_image, :thumb_image, :person_id)
    end
end
