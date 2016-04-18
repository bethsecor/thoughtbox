FactoryGirl.define do
  factory :link do
    title "Brain Pickings"
    url "https://www.brainpickings.org/"
    read false
    user

    factory :read_link do
      read true
    end
  end
end
