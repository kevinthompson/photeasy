class Api::V1::BaseController < ApplicationController
  before_filter :authenticate_user!
end