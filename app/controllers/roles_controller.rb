# frozen_string_literal: true

class RolesController < ApplicationController # rubocop:disable Style/Documentation
  include Common

  private

  def model_params
    params.require(:payload).permit(:role_name)
  end
end
