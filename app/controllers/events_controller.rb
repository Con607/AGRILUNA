class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  # GET /events
  # GET /events.json
  def index
    if params[:search]
      @current_company = Company.find(params[:search][:company_id])
      @companies = current_user.companies
      @month_start = Date.civil(params[:search]["month_start(1i)"].to_i,
                                params[:search]["month_start(2i)"].to_i,
                                params[:search]["month_start(3i)"].to_i)
      @month_end = Date.civil(params[:search]["month_end(1i)"].to_i,
                                params[:search]["month_end(2i)"].to_i,
                                params[:search]["month_end(3i)"].to_i)
      @events = Event.where(company_id: @current_company.id
                      ).where(start_time: @month_start.to_datetime..@month_end.to_datetime)
      @event = Event.new
      @show_events = true
      gon.push({
        company_id: @current_company.id,
        start_time: @month_start.to_date,
        end_time: @month_end.to_date,
        show_events: "true",
        json_search: "true"
      })
      gon.jbuilder
    elsif params[:json_search]
        @current_company = Company.find(params[:company_id])
        @month_start = params[:start] 
        @month_end = params[:end]
        @events = Event.where(company_id: @current_company.id
                                                  ).where(start_time: @month_start.to_datetime..@month_end.to_datetime)
    else
      @companies = current_user.companies
      @show_events = false
    end

    respond_to do |format|
      format.html
      format.json 
      format.js
    end
  end

  # GET /events/1
  # GET /events/1.json
  def show
  end

  # GET /events/new
  def new
    @event = Event.new
  end

  # GET /events/1/edit
  def edit
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(event_params)

    respond_to do |format|
      if @event.save
        format.js
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render action: 'show', status: :created, location: @event }
      else
        format.js
        format.html { render action: 'new' }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event.destroy
    respond_to do |format|
      format.js
      format.html { redirect_to events_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(:title, :description, :start_time, :end_time, :company_id, :greenhouse_id)
    end

end
