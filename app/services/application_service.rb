# frozen_string_literal: true

require "dry/monads/result"
require "dry/monads/do/all"

class ApplicationService
  include Dry::Monads::Result::Mixin
  include Dry::Monads::Do::All

  def self.call(...)
    new.call(...)
  end
end
