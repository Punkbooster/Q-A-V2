require 'rails_helper'

describe 'Event CRUD', type: :feature do
  let(:user) { create(:user) }
  let!(:event) { create(:event, user: user) }

  context 'not logged in' do
    it 'requires log in' do
      visit events_path
      expect(page).to have_current_path(new_user_session_path)
    end
  end

  context 'logged in' do
    before do
      login_as(user, scope: :user)
    end

    describe '#index' do
      before do
        visit events_path
      end

      it 'displays user events' do
        expect(page).to have_content(event.title)
        expect(page).to have_content(event.description)
      end

      it 'redirects to create new event' do
        click_link 'Create New'
        expect(page).to have_current_path(new_event_path)
      end

      it 'redirects to #show' do
        click_link 'Show'
        expect(page).to have_current_path(event_path(event))
      end

      it 'redirects to #edit' do
        click_link 'Edit'
        expect(page).to have_current_path(edit_event_path(event))
      end
    end

    describe '#show' do
      before do
        visit events_path
        click_link 'Show'
      end

      it "displays event's data" do
        expect(page).to have_content(event.title)
        expect(page).to have_content(event.description)
        expect(page).to have_content(event.starts_at)
        expect(page).to have_content(event.ends_at)
        expect(page).to have_content(event.time_zone)
        expect(page).to have_content(event.password)
        expect(page).to have_content(event.user.email)
      end
    end

    describe '#new #create' do
      before do
        visit new_event_path
        fill_in 'event[title]', with: 'Demo Event'
        fill_in 'event[description]', with: 'Demo description'
        fill_in 'event[password]', with: 'Code'
        select '(GMT-09:00) Alaska', from: 'event[time_zone]'
        click_button 'Submit'
      end

      it 'creates new event' do
        expect(page).to have_content('Successfully created')
        expect(page).to have_content('Demo Event')
        expect(page).to have_content('Code')
        expect(page).to have_content('Alaska')
      end
    end

    describe '#edit #update' do
      before do
        visit edit_event_path(event)
        fill_in 'event[title]', with: 'Brand new title'
        fill_in 'event[description]', with: 'New description'
        fill_in 'event[password]', with: 'Brand new code'
        select '2022', from: 'event_ends_at_1i'
        select '(GMT+01:00) Berlin', from: 'event[time_zone]'
        click_button 'Submit'
      end

      it 'redirects to #index' do
        expect(page).to have_current_path(events_path)
      end

      it 'edits existing event' do
        visit event_path(event)
        expect(page).to have_content('Brand new title')
        expect(page).to have_content('New description')
        expect(page).to have_content('Brand new code')
        expect(page).to have_content('2022')
        expect(page).to have_content('Berlin')
      end
    end

    describe '#destroy' do
      before do
        visit events_path
        click_link 'Destroy'
      end

      it 'deletes event & redirects to index' do
        expect(page).to have_current_path(events_path)
        expect(page).to have_content('Event was successfully deleted')
        expect(page).to_not have_content(event.title)
      end
    end
  end
end
