module ApplicationHelper
require 'rubygems'
require 'httparty'

  def self.githubapi
    headers = {:headers => {
      "Authorization" => "token 33ca3b42155456845eb9f97faaad52a210d1591e",
      "User-Agent" => "StephenClem72"
    }}
    response = HTTParty.get('https://api.github.com/zen')
    return response.parsed_response
  end
end
