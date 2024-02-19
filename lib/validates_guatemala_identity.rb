# frozen_string_literal: true

require 'active_model'
require 'validates_guatemala_identity/guatemala_identity_validator'
require 'validates_guatemala_identity/require_a_valid_guatemala_identity_matcher' if defined?(Shoulda)

module ValidatesGuatemalaIdentity
  autoload :GuatemalaIdentity, 'validates_guatemala_identity/guatemala_identity'
end
