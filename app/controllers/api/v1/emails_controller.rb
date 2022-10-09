module Api 
  module V1
    class EmailsController < ApplicationController

      require_relative './mail_service'
      ALLOWED_DATA = %(email, name, category).freeze

      def create

        data = json_payload.select { |k| ALLOWED_DATA.include?(k) }
        #ans = EmailingService.send(data["email"], data["name"], data["category"])

        #render json: { response_status: ans }
       
        #puts "This is the status: #{EmailingService.sending_email}"
        #render json: { response: res }
        # render json: { keys: "Working"}
      end
    end
  end
end
