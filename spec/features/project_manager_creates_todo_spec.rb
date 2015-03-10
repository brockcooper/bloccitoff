require 'rails_helper'

##
# PM goes to the TODO creation page
# PM submits new TODO description
# PM sees confirmation message
# PM sees newly saved TODO
##

feature 'Project manager creates TODO' do 
  scenario 'Successfully' do
    visit new_todo_path
    fill_in 'Description', with: 'Meet up with the team'
    click_button 'Save'
    expect( page ).to have_content('Your new TODO was saved')
    expect( page ).to have_content('Meet up with the team')
  end

  scenario 'With description missing' do
    visit new_todo_path
    click_button 'Save'
    expect( page ).to have_content('There was an error saving your TODO')
    expect(current_path).to eq(new_todo_path)
  end

  scenario 'With description less than 5 characters' do
    visit new_todo_path
    fill_in 'Description', with: '123'
    click_button 'Save'
    expect( page ).to have_content('There was an error saving your TODO')
    expect(current_path).to eq(new_todo_path)
  end
end