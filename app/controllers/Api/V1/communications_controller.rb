# frozen_string_literal: true

module Api
  module V1
    class CommunicationsController < ApplicationController
      include Common

      private

      def model_params
        params.require(:payload).permit(:communication_type, :communication_datetime, :communication_content,
                                        :user_id)
      end
    end
  end
end
