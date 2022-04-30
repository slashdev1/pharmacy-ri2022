FactoryBot.define do
  factory :prescription, class: Prescription do
    number  { 'РЛ000001' }
    is_used { false }
    #doctor_id { 3 }
    association :doctor_id, factory: :user
    for_adult_children { 0 }
  end
end