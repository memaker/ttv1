# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :tweet do
    created_at "MyString"
    text "MyString"
    source "MyString"
    lang "MyString"
  end
end
