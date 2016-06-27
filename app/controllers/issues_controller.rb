class IssuesController < ApplicationController
  def index
    @issues = Issue.all
  end

  def show
    @issue = Issue.find(params[:id])
  end

  def latest
    @issue = Issue.find_by("issued_at = ?", Date.current.beginning_of_week + 3)

    respond_to do |format|
      format.html { render 'show' }
      format.rss
    end
  end
end
