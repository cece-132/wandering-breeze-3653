require 'rails_helper'

RSpec.describe Contestant do
  describe 'User Story 2' do
    it 'shows all the contestants and the projects theyve been on' do
      recycled_material_challenge = Challenge.create(theme: "Recycled Material", project_budget: 1000)

      news_chic = recycled_material_challenge.projects.create(name: "News Chic", material: "Newspaper")

      jay = Contestant.create(name: "Jay McCarroll", age: 40, hometown: "LA", years_of_experience: 13)
      gretchen = Contestant.create(name: "Gretchen Jones", age: 36, hometown: "NYC", years_of_experience: 12)

      ContestantProject.create(contestant_id: jay.id, project_id: news_chic.id)
      ContestantProject.create(contestant_id: gretchen.id, project_id: news_chic.id)

      visit contestants_path

      within ".contestants" do
        within "#contestant-#{jay.id}" do
          expect(page).to have_content("Name: #{jay.name}")
          expect(page).to have_content("Projects: #{jay.project.name}")
        end
      end

    end
  end
end