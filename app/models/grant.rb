class Grant < ActiveRecord::Base
  COMPONENTS = [:people]
  # Descriptors
  has_and_belongs_to_many :reason_types
  has_and_belongs_to_many :coverage_types

  belongs_to :subsidy_type
  belongs_to(
    :status,
    class_name: "GrantStatus",
    foreign_key: :grant_status_id
  )

  # Components
  has_many :people, autosave: true
  has_many :other_payments
  has_many :payees

  belongs_to :residence
  belongs_to(
    :previous_residence,
    class_name: "Residence",
    foreign_key: :previous_residence_id
  )

  accepts_nested_attributes_for *COMPONENTS, reject_if: :all_blank, allow_destroy: true
end
