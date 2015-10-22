module Myhub
  class Github
    include HTTParty
    base_uri "https://api.github.com"

    # Your code here too!
    def initialize
      @headers = {
        "Authorization"  => "token #{ENV["AUTH_TOKEN"]}",
        "User-Agent"     => "HTTParty"
      }
    end

    #get the issues assigned to you in the TIY organization ONLY!!!
    def getorgissues
      self.class.get("/orgs/TIY-ATL-ROR-2015-Sep/issues", headers: @headers, 
                                                          query: { state: "all" })
    end

    #take {issue: "number"} = is and open it
    def openissue(id)
      self.class.patch("/repos/TIY-ATL-ROR-2015-Sep/assignments/issues/#{id}", headers: @headers, 
                                                                              body: { state: "open" }.to_json)
    end

    #take {issue: "number"} = is and close it
    def closeissue(id)
      self.class.patch("/repos/TIY-ATL-ROR-2015-Sep/assignments/issues/#{id}"), headers: @headers,
                                                                                body: { state: "closed"}.to_json)
    end

  end
end

# AUTH_TOKEN=<your token here> bundle exec ruby lib/myhub.rb
# Use this to get your token apparently?