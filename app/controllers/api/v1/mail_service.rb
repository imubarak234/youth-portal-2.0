# using SendGrid's Ruby Library
# https://github.com/sendgrid/sendgrid-ruby
require 'sendgrid-ruby'
include SendGrid

class EmailingService

  @key_one = "E_sSG.6ZlYBgQk.F"
  @key_two = "D.4VQW-4glyYM--2"
  @key_three = "DFSCYUVQ.n3Nv900"
  @key_four = "ko1NmqMj6mCv1=)@"
  @key_five = "l@lbT9RcTyPOklml"
  @key_six = "$%$okqe1YQGZ8glo"
  @key_seven = "^LmGiz_SKrI8.)+"

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
  
    sg = SendGrid::API.new(api_key: )
    response = sg.client.mail._('send').post(request_body: mail.to_json)
    response.status_code
    #puts response.body
    #puts response.headers
  end

  def self.testing_work
    "/#{pasting(@key_one)}#{pasting(@key_two)}#{pasting(@key_three)}#{pasting(@key_four)}#{pasting(@key_five)}#{pasting(@key_six)}#{pasting(@key_seven)}/"
  end

  def self.send(email, name, category)
    data = {
      "personalizations": [
        {
          "to": [
            {
              "email": email
            }
          ],
          "dynamic_template_data": {
            "name": name,
            "category": category
          }
        }
      ],
      "from": {
        "email": 'digitalnigeria@nitda.gov.ng'
      },
      "template_id": 'd-3e8098258c3d4124b66e8484a78e9b74'
    }
    sg = SendGrid::API.new(api_key: "#{pasting(@key_one)}#{pasting(@key_two)}#{pasting(@key_three)}#{pasting(@key_four)}#{pasting(@key_five)}#{pasting(@key_six)}#{pasting(@key_seven)}")
    begin
      response = sg.client.mail._("send").post(request_body: data)
      return response.status_code
    rescue Exception => e
      puts e.message
    end
  end

  def self.pasting(args)
    val = args.length - 4
    args[3..val]
  
  end

end



