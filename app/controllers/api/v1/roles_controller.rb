module Api
  module V1
    class RolesController < ApplicationController
      include Common
      skip_before_action :authenticate, only: %i[create index show]

      private

      def model_params
        params.require(:payload).permit(:role_name)
      end
    end
  end
end
