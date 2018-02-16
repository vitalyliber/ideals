require 'active_support/concern'

module CommonValidation
  extend ActiveSupport::Concern

  included do
    validates_presence_of :name
    validates_length_of :name, :in => 3..32
    validates_uniqueness_of :name
  end
end