require 'dotenv'
require 'httparty'

Dotenv.load

require 'bearer-agent'

puts ENV.fetch('APP_ENV')

Bearer.init_config do |config|
  config.secret_key = ENV.fetch('BEARER_SECRET_KEY')
end

# Postman-echo
puts '-- Sending API calls to Postman-Echo --'
HTTParty.get(
  'https://postman-echo.com/status/404',
  headers: {
    password: 'h4x0r',
    secret: 'secret key'
  }
)

HTTParty.get(
  'https://postman-echo.com/status/403',
  headers: {
    password: 'h4x0r',
    secret: 'secret key'
  }
)

HTTParty.get(
  'https://postman-echo.com/status/429',
  headers: {
    password: 'h4x0r',
    secret: 'secret key'
  }
)

HTTParty.get(
  'https://postman-echo.com/status/501?email=pii@example.com',
  headers: {
    password: 'h4x0r',
    secret: 'secret key'
  }
)

HTTParty.post(
  'https://postman-echo.com/post',
  headers: {
    'Content-Type': 'application/json'
  },
  body: {
    foo: 'Bar'
  }
)

HTTParty.get('https://postman-echo.com/status/200')

# NASA API
puts '-- Sending API calls to NASA API --'
HTTParty.get('https://api.nasa.gov/planetary/apod?api_key=DEMO_KEY')

# Star Wars API
puts '-- Sending API calls to SWAPI --'
HTTParty.get('https://swapi.dev/api/people/1/')
HTTParty.get('https://swapi.dev/api/people/9/')
HTTParty.get('https://swapi.dev/api/starships/9/')

# Foo Bar -> Non Existing API
puts '-- Sending API calls to non existing API --'
begin
  HTTParty.get('https://foo.bar/status/200')
rescue StandardError
end
