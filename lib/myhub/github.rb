module Myhub
  class Github
    include HTTParty
    base_uri "https://api.github.com"

    # Your code here too!
    def initialize
      @headers = {
        "Authorization" => "token #{ENV["AUTH_TOKEN"]}",
        "User-Agent" => "HTTParty"
      }
    end

    #get the issues assigned to you
    def getissues
      get ("/")
    end

    def open_issue
    end

    def close_issues
    end

      #take issue id and open it
      #take issue id and close it

  end
end

# AUTH_TOKEN=<your token here> bundle exec ruby lib/myhub.rb
# Use this to get your token apparently?