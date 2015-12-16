class Api::ProductsController < Api::BaseController
    before_action :authenticate_user!, only: :buy
    
    def index
        respond_with @products = Product.all
    end

    def show
    	respond_with @product= Product.find(params[:id])
    end
    
    def buy
        @product = Product.find(params[:id])
        @product.buy_by(current_user)
        
        respond_with @product
    end
    
end