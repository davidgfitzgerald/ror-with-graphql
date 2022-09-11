# frozen_string_literal: true

module Visible
  extend ActiveSupport::Concern

  VALID_STATUSES = %w[public private archived].freeze

  included do
    validates :status, inclusion: { in: VALID_STATUSES }
  end

  class_methods do
    #
    # Gets the number of public records of an instance type.
    #
    # @return [Integer] number of public records
    #
    def public_count
      where(status: 'public').count
    end
  end

  #
  # Determine whether the status of the record is archived.
  #
  # @return [Boolean] if the status is archived
  #
  def archived?
    status == 'archived'
  end
end
