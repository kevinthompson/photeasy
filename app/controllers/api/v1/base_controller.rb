class API::V1::BaseController < ApplicationController
  rescue_from(ActionController::ParameterMissing) do |parameter_missing_exception|
    @errors ||= []
    @errors << [parameter_missing_exception.param, 'parameter is required']
    render json: { data: {}, errors: @errors }, :status => :unprocessable_entity
  end
end