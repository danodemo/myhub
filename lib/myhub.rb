require "sinatra/base"
require "httparty"
require "pry"

require "myhub/version"
require "myhub/github"

module Myhub
  class App < Sinatra::Base
    set :logging, true

    
    get "/" do
      api = Github.new #github.rb starts here
      issues = api.getissues
      @issuelist = []
      issues.each do |issue|
        item = { 
                  title: issue["title"], 
                  url: issue["url"],
                  number: issue["number"],
                  state: issue["state"],
                }
        @issuelist.push(item)
        # binding.pry
      end
      erb :index, locals: { issues: @issuelist }
    end

    post "/issue/reopen/:id" do
      api = Github.new
      api.reopen_issue(params["id"].to_i)
      "Cool cool cool"
    end

    post "/issue/close/:id" do
      api = Github.new
      api.close_issue(params["id"].to_i)
      "Cool cool cool"
    end

    run! if app_file == $0
  end
end
