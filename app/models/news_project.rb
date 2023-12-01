class NewsProject < ApplicationRecord
  belongs_to :project
  belongs_to :news
end
