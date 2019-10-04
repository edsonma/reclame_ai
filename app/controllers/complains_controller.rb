class ComplainsController < ApplicationController
  def new
    @complain = Complain.new
    @locale = Locale.new
  end

  def show
    @complain = Complain.find(params[:id])
  end

  def index
    @commplains = Complain.all
  end
end
