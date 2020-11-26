require_relative '../handler.rb'
require 'test/unit'

class TestHandler < Test::Unit::TestCase
    def test_hello()
        response = hello(event: {"body": "Hello, World!"}, context: {})
        assert_equal 200, response[:statusCode]
        assert_match /hello/, response[:body]
    end
end