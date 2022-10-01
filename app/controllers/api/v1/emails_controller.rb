module Api 
  module V1
    class EmailsController < ApplicationController

      require_relative './mail_service'

      def create
        render json: { 
          status: EmailingService.sending_email,
          status2: EmailingService.send,
          testing: ENV['SENDGRID_API_KEY']
         } 

        #puts "This is the status: #{EmailingService.sending_email}"
        #render json: { response: res }
        # render json: { keys: "Working"}
      end
    end
  end
end