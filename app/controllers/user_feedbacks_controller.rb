# frozen_string_literal: true

class UserFeedbacksController < ApplicationController # rubocop:disable Style/Documentation
  include Common

  private

  def model_params
    params.require(:payload).permit(:feedback_title, :feedback_content, :feedback_datetime, :user_id)
  end
end
