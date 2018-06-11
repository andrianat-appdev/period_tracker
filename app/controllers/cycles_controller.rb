class CyclesController < ApplicationController
  before_action :current_user_must_be_cycle_user, :only => [:edit, :update, :destroy]

  def current_user_must_be_cycle_user
    cycle = Cycle.find(params[:id])

    unless current_user == cycle.user
      redirect_to :back, :alert => "You are not authorized for that."
    end
  end

  def index
    @cycles = current_user.cycles.page(params[:page]).per(10)

    render("cycles/index.html.erb")
  end

  def show
    @cycle = Cycle.find(params[:id])

    render("cycles/show.html.erb")
  end

  def new
    @cycle = Cycle.new

    render("cycles/new.html.erb")
  end

  def create
    @cycle = Cycle.new

    @cycle.user_id = params[:user_id]
    @cycle.begin = params[:begin]
    @cycle.end = params[:end]
    @cycle.length = params[:length]
    @cycle.notes = params[:notes]

    save_status = @cycle.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/cycles/new", "/create_cycle"
        redirect_to("/cycles")
      else
        redirect_back(:fallback_location => "/", :notice => "Cycle created successfully.")
      end
    else
      render("cycles/new.html.erb")
    end
  end

  def edit
    @cycle = Cycle.find(params[:id])

    render("cycles/edit.html.erb")
  end

  def update
    @cycle = Cycle.find(params[:id])
    @cycle.begin = params[:begin]
    @cycle.end = params[:end]
    @cycle.length = params[:length]
    @cycle.notes = params[:notes]

    save_status = @cycle.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/cycles/#{@cycle.id}/edit", "/update_cycle"
        redirect_to("/cycles/#{@cycle.id}", :notice => "Cycle updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Cycle updated successfully.")
      end
    else
      render("cycles/edit.html.erb")
    end
  end

  def destroy
    @cycle = Cycle.find(params[:id])

    @cycle.destroy

    if URI(request.referer).path == "/cycles/#{@cycle.id}"
      redirect_to("/", :notice => "Cycle deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Cycle deleted.")
    end
  end
end
