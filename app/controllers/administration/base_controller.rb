class Administration::BaseController < ApplicationController
  before_action :authenticate_administrator!

  layout 'administration'
end
