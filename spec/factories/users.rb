FactoryBot.define do
  factory :user do
    encrypted_password { Devise::Encryptor.digest(User, 'password') }

    trait :organisation_1 do
      email { 'email@organisation1.com' }
      organisation
    end

    trait :organisation_2 do
      email { 'email@organisation2.com' }
      organisation
    end

    trait :organisation_3 do
      email { 'email@organisation3.com' }
      organisation
    end
  end
end
