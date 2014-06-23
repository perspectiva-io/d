class DebatesController < ApplicationController
 
  class NotFound < StandardError; end
  class DebateNotFound < NotFound; end

  rescue_from NotFound, with: :not_found
 
  def not_found
    raise ActionController::RoutingError.new('Not Found')
  end

  def index
    @debates = Debate.all
  end

  def show
    @debate = Debate[params[:id]] or raise DebateNotFound
  end
end
