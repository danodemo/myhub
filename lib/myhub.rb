require "sinatra/base"
require "httparty"
require "pry"

require "myhub/version"
require "myhub/github"

module Myhub
  class App < Sinatra::Base
    set :logging, true

    # Your code here ...

    get "/" do
      api = Github.new
      #get stuff from Github
      erb :index, locals: { issues: stuff }      
    end

    put "/issue/:id" do
      api = Github.new
      api.reopen_issue(params["id"].to_i)
      "Opened and ready"
    end

    delete "/issue/:id" do


    put "/issue/:id" do
      api = Github.new
      if params["state"] == "reopen"
        api.reopen_issue(params["id"].to_i)
      elsif params["state"] == "close"
        api.close_issue(params["id"].to_i)
      else
        status 400
        "You fucked up."
      end

    run! if app_file == $0
  end
end
