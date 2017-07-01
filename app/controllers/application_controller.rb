require 'will_paginate/array'

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
end
