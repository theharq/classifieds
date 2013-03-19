# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  sequence :content do |n|
    "This is the classified content number #{n}"
  end
  sequence :email do |n|
    "example#{n}@example.com"
  end
end
