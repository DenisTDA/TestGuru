class BadgesController < ApplicationController
  include Rules

  def index
    @badges = Badge.all
    @rules = set_all_rules
  end
end
