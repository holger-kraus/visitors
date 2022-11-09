class RedirectController < ApplicationController
  skip_before_action :verify_authenticity_token

  def redirect
    @week=Week.where("? between firstday and lastday", Time.now )
    id = @week.first.id;
    redirect_to "/weeks/#{id}";
  end
end