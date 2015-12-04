FactoryGirl.define do
  factory :item do
    name "Some Item"
    state :active
    user
  end
end
