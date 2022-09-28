module Api 
  module V1
    class EmailsController < ApplicationController

      require 'sendgrid-ruby'
      include SendGrid

      def create

        from = Email.new(email: 'imubarak2424@gmail.com')
        to = Email.new(email: 'shithappens242@gmail.com')
        subject = 'Testing the api'
        content = Content.new(type: 'text/plain', value: 'Testing the api if it works')
        mail = Mail.new(from, subject, to, content)

        sg = SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY'])
        response = sg.client.mail._('send').post(request_body: mail.to_json)


        render json: response.status_code
        render json: { keys: "#{ENV['SENDGRID_API_KEY']}",
        
       }
      end
    end
  end
end