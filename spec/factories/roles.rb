FactoryGirl.define do
  factory :role do
    factory :user_role do
      role_type 'user'
    end

    factory :moderator_role do
      role_type 'moderator'
    end

    factory :admin_role do
      role_type 'admin'
    end
  end

end
