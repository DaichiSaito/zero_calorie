# == Schema Information
#
# Table name: foods
#
#  id             :bigint           not null, primary key
#  calorie        :integer          not null
#  calorie_theory :text(65535)
#  labels         :json
#  name           :string(255)      not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
class Food < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :calorie, presence: true, numericality: { only_integer: true, equal_to: 0 }

  scope :search_by_label, -> (label) { where("labels like ?", "%#{label}%") }
end
