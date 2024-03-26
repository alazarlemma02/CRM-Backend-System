# frozen_string_literal: true

class CommunicationsController < ApplicationController # rubocop:disable Style/Documentation
  include Common

  private

  def model_params
    params.require(:payload).permit(:communication_type, :communication_datetime, :communication_content,
                                    :user_id)
  end
end
