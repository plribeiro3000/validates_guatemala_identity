# frozen_string_literal: true

require 'shoulda-matchers'

module Shoulda
  module Matchers
    module ActiveModel
      def require_a_valid_guatemala_identity(attr = :identity)
        RequireAValidGuatemalaIdentityMatcher.new(attr)
      end

      class RequireAValidGuatemalaIdentityMatcher < ValidationMatcher
        def description
          'requires a valid Guatemala Identity'
        end

        def failure_message
          'does not require a valid Guatemala Identity'
        end

        def matches?(subject)
          super(subject)

          allows_value_of('1234567891507') &&
            allows_value_of('2345678990102') &&
            disallows_value_of('1234567881507') && # invalid checksum
            disallows_value_of('1234567892307') && # invalid state code
            disallows_value_of('1234567891618') # invalid city code
        end
      end
    end
  end
end
