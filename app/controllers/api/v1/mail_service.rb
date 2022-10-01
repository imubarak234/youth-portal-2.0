# using SendGrid's Ruby Library
# https://github.com/sendgrid/sendgrid-ruby
require 'sendgrid-ruby'
include SendGrid

class EmailingService

  def self.sending_email
    from = Email.new(email: 'imubarak2424@gmail.com')
    to = Email.new(email: 'm.bthedon@yahoo.com')
    subject = 'Sending with SendGrid is Fun'
    content = Content.new(type: 'text/plain', value: 'and easy to do anywhere, even with Ruby')
    mail = Mail.new(from, subject, to, content)

    # data = {
    #   "personalizations": [
    #     {
    #       "to": [
    #         {
    #           "email": too
    #         }
    #       ],
    #       "dynamic_template_data": {
    #         "name": name,
    #         "body": body
    #       }
    #     }
    #   ],
    #   "from": {
    #     "email": 'imubarak2424@gmail.com'
    #   },
    #   "template_id": 'd-444d4838b6b8473bb5c4f982263a769a'
    # }
  
    sg = SendGrid::API.new(api_key: "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")
    response = sg.client.mail._('send').post(request_body: mail.to_json)
    response.status_code
    #puts response.body
    #puts response.headers
  end

  def testing_work(somes)
    puts "#{somes}testers"
  end

  def self.send
    data = {
      "personalizations": [
        {
          "to": [
            {
              "email": "m.bthedon@yahoo.com"
            }
          ],
          "dynamic_template_data": {
            "name": "Mike Jones",
            "body": "Testing body"
          }
        }
      ],
      "from": {
        "email": 'imubarak2424@gmail.com'
      },
      "template_id": 'd-444d4838b6b8473bb5c4f982263a769a'
    }
    sg = SendGrid::API.new(api_key: "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")
    begin
      response = sg.client.mail._("send").post(request_body: data)
      return response.status_code
    rescue Exception => e
      puts e.message
    end
  end
end



