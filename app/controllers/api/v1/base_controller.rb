class API::V1::BaseController < ApplicationController

  rescue_from(ActionController::ParameterMissing) do |parameter_missing_exception|
    @errors ||= []
    @errors << { "#{parameter_missing_exception.param}" => ['parameter is required'] }
    respond_to_api
  end

  private

  def respond_to_api(object = nil, success_code = :ok, options = {})
    @errors ||= []
    @errors << object.errors if errors_present?(object)
    object ||= { data: {}, errors: @errors}

    status_code = @errors.any? ? :unprocessable_entity : success_code
    response = { json: object, meta: @errors, meta_key: :errors, status: status_code }
    response.merge! options

    respond_to do |format|
      format.json { render response }
    end
  end

  def errors_present?(object)
    object.kind_of?(ActiveModel::Serializers::JSON) &&
    object.respond_to?(:errors) &&
    object.errors.present?
  end

end