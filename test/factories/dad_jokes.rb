FactoryBot.define do
  factory :dad_joke do
    cringe_level { 50 }
    sequence(:joke_text) {|i| "some text #{i}"}
    sequence(:question) {|i| "some question #{i}"}
  end
end
