require 'rails_helper'

RSpec.describe 'As a visitor' do
  describe 'when I visit /astronauts ' do
    xit 'should show a list of astronauts and their name, age and job' do
      neil = Astronaut.create(name:"Neil Armstrong", age: 37, job: "Commander")
      lewis = Astronaut.create(name:"Lewis Smith", age: 38, job: "engineer")
      sarah = Astronaut.create(name:"Sarah Smith", age: 32, job: "officer")

      visit astronauts_path

      expect(page).to have_content(neil.name)
      expect(page).to have_content(neil.age)
      expect(page).to have_content(neil.job)
      expect(page).to have_content(lewis.name)
      expect(page).to have_content(lewis.age)
      expect(page).to have_content(lewis.job)
      expect(page).to have_content(sarah.name)
      expect(page).to have_content(sarah.age)
      expect(page).to have_content(sarah.job)
    end

    xit 'should show the average age of the astronauts' do
      neil = Astronaut.create(name:"Neil Armstrong", age: 37, job: "Commander")
      lewis = Astronaut.create(name:"Lewis Smith", age: 38, job: "engineer")
      sarah = Astronaut.create(name:"Sarah Smith", age: 32, job: "officer")

      visit astronauts_path

      within '#average_age'
      expect(page).to have_content("Average age: 35.67")


    end

    it 'should show a list of all the space missions in alphabetical order' do
      neil = Astronaut.create(name:"Neil Armstrong", age: 37, job: "Commander")
      lewis = Astronaut.create(name:"Lewis Smith", age: 38, job: "engineer")
      sarah = Astronaut.create(name:"Sarah Smith", age: 32, job: "officer")

      mission_3 = Mission.create(title:"Zollo 13", time_in_space: 49)
      mission_1 = Mission.create(title:"Apollo 13", time_in_space: 30)
      mission_2 = Mission.create(title:"Bollo 13", time_in_space: 245)
      mission_4 = Mission.create(title:"Gemini 7", time_in_space: 87)

      visit astronauts_path
      save_and_open_page

      within '#list_of_missions'
      expect(page.all('.mission')[0]).to have_content(mission_1.title)
      expect(page.all('.mission')[1]).to have_content(mission_2.title)
      expect(page.all('.mission')[2]).to have_content(mission_4.title)
      expect(page.all('.mission')[3]).to have_content(mission_3.title)
    end
  end

end
