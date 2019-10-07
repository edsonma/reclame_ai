#require 'rest-client '
class ComplainsController < ApplicationController

  def new
    @complain = Complain.new
  end

  def create
    @complain = Complain.new(allowed_params)
    @complain.maybe_fraud = false;

    # Check if the order supplied by a Complaining person exists on the order table
    check_existence_of_order

    @complain.ip_address = request.remote_ip

    if @complain.save
      redirect_to root_url, notice: 'Agradeço e espero podermos ajudar!'
    else
      redirect_to root_path
    end
  end

  def show
    @complain = Complain.find(params[:id])
  end

  def index
    @complains = Complain.all
  end

  private

  def allowed_params
    params.require(:complain).permit!
  end

  def check_existence_of_order
    order = Order.find_by(shipping_zipcode: @complain.shipping_zipcode)
    if order == nil
      puts "heyyyyyyyY"
      @complain.maybe_fraud=true
    end
  end
end
