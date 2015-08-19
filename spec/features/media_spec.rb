require "rails_helper"

feature 'Media' do
  given!(:media) { (1..5).each { |i| FactoryGirl.create(:media, url: "http://brocknunn.com/untame/bootstrap-gallery/img/pics/#{i}.jpg", user_id: 1) } }

  scenario 'gives media index overview' do
    visit media_index_path
    expect(page).to have_selector(".row a img", count: 5)
  end
end