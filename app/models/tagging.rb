class Tagging < ApplicationRecord
  belongs_to :post, optional: false
  belongs_to :tag
end
