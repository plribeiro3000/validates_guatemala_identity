# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Shoulda::Matchers::ActiveModel::RequireAValidGuatemalaIdentityMatcher do
  subject { User.new }

  it { is_expected.to require_a_valid_guatemala_identity }
  it { is_expected.to require_a_valid_guatemala_identity(:id) }
  it { is_expected.not_to require_a_valid_guatemala_identity(:name) }
end
