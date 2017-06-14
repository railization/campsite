class ChildrenCheck < ActiveRecord::Base

	CATEGORY_IN = :in
  CATEGORY_OUT = :out
  CATEGORIES = [CATEGORY_IN.to_s, CATEGORY_OUT.to_s]

  belongs_to :child
	belongs_to :activity

  scope :check_in, -> { where(category: CATEGORY_IN) }
  scope :check_out, -> { where(category: CATEGORY_OUT) }


end
