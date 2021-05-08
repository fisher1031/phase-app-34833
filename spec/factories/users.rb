FactoryBot.define do
  factory :user do
    nickname              {'test'}
    email                 {'test@example.jp'}
    password              {'000abc'}
    password_confirmation {password}
  end
end