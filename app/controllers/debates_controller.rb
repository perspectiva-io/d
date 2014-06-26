class DebatesController < ApplicationController
 
  class NotFound < StandardError; end
  class DebateNotFound < NotFound; end

  respond_to :json

  rescue_from NotFound, with: :not_found

  def new
    redirect_to edit_debate_path(Debate.create)
  end

  def edit
    @debate = Debate[params[:id]]
  end

  def not_found
    raise ActionController::RoutingError.new('Not Found')
  end

  def index
    @debates = Debate.all
  end

  def show
    @debate = Debate[params[:id]] or raise DebateNotFound
  end

  def update
    respond_with Debate[params[:id]].update params[:field] => params[:value]
  end
end
