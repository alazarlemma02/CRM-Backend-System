module Api
  module V1
    class TokenAuthServices
      AUTH_SECRET = Rails.application.credentials.secret_key_base
      INVALID_TOKENS = Set.new

      def self.issue(payload, exp = 24.hours.from_now)
        payload[:exp] = exp.to_i
        JWT.encode(payload, auth_secret, 'HS256')
      end

      def self.decode(token)
        JWT.decode(token, auth_secret, true, { algorithm: 'HS256' }).first
      end

      def self.invalidate(token)
        INVALID_TOKENS.add(token)
      end

      def self.valid?(token)
        !INVALID_TOKENS.include?(token)
      end

      def self.auth_secret
        AUTH_SECRET
      end
    end
  end
end
