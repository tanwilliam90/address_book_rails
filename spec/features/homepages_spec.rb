require 'rails_helper'

RSpec.feature 'Homepages', type: :feature do
  context 'we are on the homepage' do
    Steps 'you will be on the home page' do
      Given 'i am on the landing page' do
        visit '/'
      end
      Then 'i see a welcome message' do
        expect(page).to have_content 'Welcome'
      end
    end
  end #end of context
  context 'I can create a Contact and save it' do
    Steps 'you can fill out a form' do
      Given 'I am on the landing page' do
        visit '/'
      end
      Then 'i can fill out a form' do
        fill_in 'first_name', with: 'Gerard'
        fill_in 'last_name', with: 'Way'
        fill_in 'email', with: 'gway@mcr.com'
        fill_in 'address', with: '123 Jersey Way'
        click_button 'Add Contact'
      end
      Then 'i am taken to a contact page' do
        expect(page).to have_content 'Gerard successfully added'
      end
    end
  end
  context 'i want to view my contact list' do
    Steps 'add contacts and then view them' do
      Given 'I am on the landing page' do
        visit '/'
      end
      Then 'i can fill out a form' do
        fill_in 'first_name', with: 'Gerard'
        fill_in 'last_name', with: 'Way'
        fill_in 'email', with: 'gway@mcr.com'
        fill_in 'address', with: '123 Jersey Way'
        click_button 'Add Contact'
      end
      Then 'i am taken to a contact page' do
        expect(page).to have_content 'Gerard successfully added'
        click_button 'View Contacts'
      end
      Then 'i can see all my contacts' do
        expect(page).to have_content 'Gerard'
        expect(page).to have_content 'Way'
        expect(page).to have_content 'gway@mcr.com'
        expect(page).to have_content '123 Jersey Way'
      end
    end
  end
  context 'I can  edit a contact that I just created' do
    Steps 'I create a contact, get confirmation then edit the contact' do
      Given 'I start on the landing page' do
        visit '/'
      end
      Then 'i can fill out a form' do
        fill_in 'first_name', with: 'Gerard'
        fill_in 'last_name', with: 'Way'
        fill_in 'email', with: 'gway@mcr.com'
        fill_in 'address', with: '123 Jersey Way'
        click_button 'Add Contact'
      end
      Then 'i am taken to a contact page' do
        expect(page).to have_content 'Gerard successfully added'
        click_button 'Edit Contact'
      end
      Then 'i can edit the contact' do
        fill_in 'address', with: '456 Main Street, Hoboken, NJ'
        click_button 'Update Contact'
      end
      Then 'I am taken to a confirmation page' do
        expect(page).to have_content '456 Main Street, Hoboken, NJ'
      end
    end
  end

end
