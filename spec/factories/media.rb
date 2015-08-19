FactoryGirl.define do
  factory :media do
    url Faker::Internet.url

    trait :with_image_info do
      media_info image_info
    end

    trait :with_audio_info do
      media_info audio_info
    end

    trait :with_video_info do
      media_info video_info
    end
  end
end