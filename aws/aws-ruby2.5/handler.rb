require 'json'

def hello(event:, context:)
  begin
    { statusCode: 200, body: "hello" }
  end
end