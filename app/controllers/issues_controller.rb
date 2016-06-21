class IssuesController < ApplicationController
  def index
    @issues = Issue.all
    respond_to do |format|
      format.html
      format.rss { render layout: false }
    end
  end

  def show
    @issue = Issue.find(params[:id])
  end

  def feed
    @issue = Issue.find(params[:id])
  end
end
