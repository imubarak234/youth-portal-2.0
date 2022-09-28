module Api 
  module V1
    class EmailsController < ApplicationController
      def create
        render json: { success: "It's working" }
      end
    end
  end
end