# frozen_string_literal: true

class User
  include ActiveModel::Model

  attr_accessor :identity, :id, :name

  validates :identity, guatemala_identity: true
  validates :id, guatemala_identity: true
end
