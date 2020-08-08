# == Schema Information
#
# Table name: meal_records
#
#  id         :bigint           not null, primary key
#  meal_time  :datetime         not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  food_id    :bigint           not null
#
# Indexes
#
#  index_meal_records_on_food_id  (food_id)
#
# Foreign Keys
#
#  fk_rails_...  (food_id => foods.id)
#
FactoryBot.define do
  factory :meal_record do
    meal_time { DateTime.current }

    trait :yesterday do
      meal_time { DateTime.current.ago(1.day) }
    end
  end
end
