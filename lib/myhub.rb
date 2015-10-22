require "sinatra/base"
require "httparty"
require "json"
require "pry"

require "myhub/version"
require "myhub/github"

module Myhub
  class App < Sinatra::Base
    set :logging, true

    
    get "/" do
      api = Github.new #github.rb starts here
      issues = api.getorgissues
      @issuelist = []
      issues.each do |issue|
        issue = { 
                  title: issue["title"], 
                  url: issue["url"],
                  number: issue["number"],
                  state: issue["state"],
                }
        @issuelist.push(issue)
        # binding.pry
      end
      erb :index, locals: { issues: @issuelist }
    end

    post "/issue/reopen/:id" do
      api = Github.new
      api.openissue(params["id"].to_i)
      "Good job, you opened it."
    end

    post "/issue/close/:id" do
      api = Github.new
      api.closeissue(params["id"].to_i)
      "Cool cool cool, we closed that one."
    end

    run! if app_file == $0
  end
end
