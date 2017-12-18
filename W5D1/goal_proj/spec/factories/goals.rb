FactoryGirl.define do
  factory :goal do
    body "MyText"
    user_id 1
    public false
    completed false
  end
end
