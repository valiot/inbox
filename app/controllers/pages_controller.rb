class PagesController < ApplicationController
  def home
    @issues = Issue.all
  end
end
