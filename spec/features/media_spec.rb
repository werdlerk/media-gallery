require "rails_helper"

feature 'Media' do
  given!(:user) { FactoryGirl.create(:user) }
  given!(:media) { (1..5).each { |i| FactoryGirl.create(:media, url: "http://brocknunn.com/untame/bootstrap-gallery/img/pics/#{i}.jpg", user: user) } }

  background do
    log_in_user(user)
  end

  scenario 'media index' do
    visit media_index_path

    expect(page).to have_selector(".row img", count: 5)

    # shows the user name on media items
    expect(page).to have_content(user.name)

    # shows the date/time of media items
    expect(page).to have_content(Media.first.created_at.to_s)
  end

  scenario 'shows the upload page' do
    visit media_index_path

    click_link 'Upload'

    expect(page).to have_content('Upload media')
  end

  scenario 'upload media' do
    visit new_media_path

    fill_in('Url', with: 'http://i59.tinypic.com/voo5dv.jpg')
    click_button('Save')

    expect(page).to have_content('Media uploaded')
    expect(current_path).to eq media_index_path

    expect(page).to have_xpath("//img[@src = 'http://i59.tinypic.com/voo5dv.jpg']")
  end

  scenario 'upload media without url shows validation error' do
    visit new_media_path

    click_button 'Save'

    expect(page).to have_content 'Url can\'t be blank'
    expect(page).not_to have_content 'Media uploaded'
  end
end