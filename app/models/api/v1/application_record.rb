module Api
  module V1
    class ApplicationRecord < ActiveRecord::Base
      primary_abstract_class
    end
  end
end
