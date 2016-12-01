class CartController < ApplicationController
#before_action :authenticate_user!, except:[:index]
helper_method :add, :clearCart

def add
  id = params[:id]
  if session[:cart] == nil
    @lista =[]
  else 
    @lista = session[:cart] 
  end
  # busca en la BD en la tabla producto el ID que recibimos por ajax
  @miId = Product.find(id)

  producto_encontrado = @lista.select {|product| product['id'] == @miId.id }

  if producto_encontrado.empty?
    @lista << CarritoCompraModel.new(@miId.id,@miId.title,@miId.price,@miId.image,1)
  else
    index = @lista.index {|product| product['id'] == @miId.id }
    @lista[index]['quantity'] += 1
    @lista[index]['price'] += @miId.price
  end
  # if @lista.empty?
  #   @lista << CarritoCompraModel.new(@miId.id,@miId.title,@miId.price,@miId.image,1)
  # else
  #   nuevo_producto = nil
  #   @lista.each do |product|
  #     if product['id'] == @miId.id
  #       product['quantity'] += 1
  #       product['price'] += @miId.price
  #
  #       nuevo_producto = nil
  #       break
  #     else
  #       # Creamos una lista de objetos
  #       nuevo_producto = CarritoCompraModel.new(@miId.id,@miId.title,@miId.price,@miId.image,1)
  #     end
  #   end
  #   @lista << nuevo_producto unless nuevo_producto.nil?
  # end

  session[:cart] = @lista 
  
  #Respuesta
  respond_to do |format|
    msg = {:carrito => @lista}
    format.json{render :json =>msg}
  end
  
end

  def delete

    id = params[:id]
    if session[:cart] == nil
      @lista =[]
    else
      @lista = session[:cart]
    end
    # busca en la BD en la tabla producto el ID que recibimos por ajax
    @miId = Product.find(id)
    if @lista.empty?
      @lista = []
    else
    index = @lista.index {|product| product['id'] == @miId.id }

    @lista.delete_if { |product| product['id'] == @miId.id }
  #  if @lista[index]['quantity'].zero?
      
  #  else
  #    @lista[index]['quantity'] -= 1
  #   @lista[index]['price'] -= @miId.price
  #  end

    session[:cart] = @lista

    #Respuesta
     respond_to do |format|
       msg = {:carrito => @lista}
       format.json{render :json =>msg}
     end
   end
  end

   def index
       if session[:cart] then
        @cart = session[:cart]
       else
        @cart = {} 
      
       end
     end
end
