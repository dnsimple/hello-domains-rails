class HomeController < ApplicationController
  def index
    if signed_in?
      client = Dnsimple::Client.new(base_url: ENV['DNSIMPLE_BASE_URL'], user_agent: ENV['DNSIMPLE_USER_AGENT'], access_token: current_user.token)
      @domains = client.domains.list_domains(current_user.uid).data
    end
  end
end
