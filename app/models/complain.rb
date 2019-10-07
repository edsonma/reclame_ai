class Complain < ApplicationRecord
  belongs_to :locale, required: false
end
