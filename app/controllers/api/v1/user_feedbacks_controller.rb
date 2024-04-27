module Api
  module V1
    class UserFeedbacksController < ApplicationController
      include Common

      private

      def model_params
        params.require(:payload).permit(:feedback_title, :feedback_content, :feedback_datetime, :user_id)
      end
    end
  end
end
