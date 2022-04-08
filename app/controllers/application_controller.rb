class ApplicationController < ActionController::Base
include ApplicationHelper
    before_action :initialize_session
    before_action :load_cart
    private
      def initialize_session
        session[:cart] ||= []
      end

      def load_cart
        @cart = Product.find(session[:cart])
      end
end
