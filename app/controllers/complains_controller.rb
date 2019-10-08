class ComplainsController < ApplicationController

  def new
    @complain = Complain.new
  end

  def create
    @complain = Complain.new(allowed_params)


    # todo: refactor to a class/method
    @complain.maybe_fraud = false;
    # Check if the complained shipping zipcode are present in any order 
    @order = Order.find_by shipping_zipcode:  @complain.shipping_zipcode

    if @order.nil?
      @complain.maybe_fraud = true
    end

    # todo: refactor to a class/method
    # Check if the complained order number exists
    @order = Order.find_by order_number: @complain.order

    if @order.nil?
      @complain.maybe_fraud = true
    end

    # Get address from shopping_zipcode
    @address = get_address

    # Get where the guy made the shit
    @complain.ip_address = request.remote_ip
    geodata = get_ip_locale @complain.ip_address

    # Create Locale
    if not geodata.nil?
      @locale = Locale.new
      @locale.latitude = geodata['latitude'].to_f
      @locale.longitude = geodata['longitude'].to_f
      @locale.country = geodata['country_name']
      @locale.city = geodata['city']
      @locale.save
      @complain.locale_id = @locale.id

      # Check if the complain are from Brazil
     if geodata['country_name'] != 'Brazil'
        complain.maybe_fraud = true
     end
    end


    # Saving all stuff
    if @complain.save
      redirect_to root_url, notice: 'Agradeço e espero podermos ajudar!'
    else
      redirect_to root_path
    end
  end

  def show
    @complain = Complain.find(params[:id])
    @address = get_address
  end

  def index
    @complains = Complain.all
  end

  private

  def allowed_params
    params.require(:complain).permit!
  end

  def get_address
    @response = Faraday.get 'http://viacep.com.br/ws/'+ @complain.shipping_zipcode.to_s + '/json'

    if @response.status == 400
      @address = 'cep inválido'
      @complain.maybe_fraud = true
    else
      if @response.status == 200
        obj =  JSON.parse(@response.body)
        if obj['erro']
          @address = 'cep inexistente'
          @complain.maybe_fraud = true
        else
          @address = obj['logradouro'] + ' ' + obj['bairro'] + ' '+ obj['complemento']
        end
      end
    end

    @address
  end

  def get_ip_locale ip
    @ip_response = Faraday.get 'https://api.ipgeolocation.io/ipgeo?apiKey=90609d68cf15435ba67e68818df5eb9e&ip='+ip.to_s

    if @ip_response.status == 400
      @ip_address = 'cannot get info'
    else
      if @ip_response.status == 200
        obj = JSON.parse(@ip_response.body)
      end
    end

    obj
  end
end 
