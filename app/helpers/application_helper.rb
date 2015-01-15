module ApplicationHelper
require 'rubygems'
require 'httparty'

  def self.githubapi
    headers = {:headers => {
      "Authorization" => "token #{ENV['ZENAPI']}",
      "User-Agent" => "StephenClem72"
    }}
    response = HTTParty.get('https://api.github.com/zen')
    return response.body
  end
end
