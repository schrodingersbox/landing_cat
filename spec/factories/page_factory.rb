FactoryGirl.define do

  factory :page, :class => LandingCat::Page do
    experiment_type 'a'
    weight 50
    heading 'This is a test'
    prompt 'Email'
    call_to_action 'Submit'
    body 'Lorem ipsum'
  end

end