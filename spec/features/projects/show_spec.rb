require 'rails_helper'

RSpec.describe Project do
  describe 'User Story 1' do
    it 'shows projects name and material' do
      recycled_material_challenge = Challenge.create(theme: "Recycled Material", project_budget: 1000)

      news_chic = recycled_material_challenge.projects.create(name: "News Chic", material: "Newspaper")

      visit project_path(news_chic)

      within "#project-#{news_chic.id}" do
        expect(page).to have_content("Material: Newspaper")
        expect(page).to have_content("Challenge Theme: Recycled Material")
      end
    end
  end

  describe 'User Story 3' do
    it 'counts the numeber of contestants on a project' do
      recycled_material_challenge = Challenge.create(theme: "Recycled Material", project_budget: 1000)

      news_chic = recycled_material_challenge.projects.create(name: "News Chic", material: "Newspaper")

      jay = Contestant.create(name: "Jay McCarroll", age: 40, hometown: "LA", years_of_experience: 13)
      gretchen = Contestant.create(name: "Gretchen Jones", age: 36, hometown: "NYC", years_of_experience: 12)
      kentaro = Contestant.create(name: "Kentaro Kameyama", age: 30, hometown: "Boston", years_of_experience: 8)

      ContestantProject.create(contestant_id: jay.id, project_id: news_chic.id)
      ContestantProject.create(contestant_id: gretchen.id, project_id: news_chic.id)
      ContestantProject.create(contestant_id: kentaro.id, project_id: news_chic.id)

      visit project_path(news_chic)

      within "#project-#{news_chic.id}" do
        expect(page).to have_content("Number of Contestants: 3")
      end
    end
  end

  describe "EXTENSION 1" do
    it 'can calulate the average years of experience for total contestants' do
      recycled_material_challenge = Challenge.create(theme: "Recycled Material", project_budget: 1000)

      news_chic = recycled_material_challenge.projects.create(name: "News Chic", material: "Newspaper")

      jay = Contestant.create(name: "Jay McCarroll", age: 40, hometown: "LA", years_of_experience: 13)
      gretchen = Contestant.create(name: "Gretchen Jones", age: 36, hometown: "NYC", years_of_experience: 12)
      kentaro = Contestant.create(name: "Kentaro Kameyama", age: 30, hometown: "Boston", years_of_experience: 8)

      ContestantProject.create(contestant_id: jay.id, project_id: news_chic.id)
      ContestantProject.create(contestant_id: gretchen.id, project_id: news_chic.id)
      ContestantProject.create(contestant_id: kentaro.id, project_id: news_chic.id)

      visit project_path(news_chic)

      within "#project-#{news_chic.id}" do
        expect(page).to have_content("Average Contestant Experience: 11.00 years")
      end
    end
  end

  describe 'EXTENSION 2' do
    it 'can add a contestant to a project' do
      recycled_material_challenge = Challenge.create(theme: "Recycled Material", project_budget: 1000)

      news_chic = recycled_material_challenge.projects.create(name: "News Chic", material: "Newspaper")

      jay = Contestant.create(name: "Jay McCarroll", age: 40, hometown: "LA", years_of_experience: 13)
      gretchen = Contestant.create(name: "Gretchen Jones", age: 36, hometown: "NYC", years_of_experience: 12)
      kentaro = Contestant.create(name: "Kentaro Kameyama", age: 30, hometown: "Boston", years_of_experience: 8)

      jay_nc = ContestantProject.create(contestant_id: jay.id, project_id: news_chic.id)
      gretchen_nc = ContestantProject.create(contestant_id: gretchen.id, project_id: news_chic.id)
  #     ContestantProject.create(contestant_id: kentaro.id, project_id: news_chic.id)

      visit project_path(news_chic)

      within "#project-#{news_chic.id}" do
        expect(page).to have_content("Number of Contestants: 2")
      end

      within ".add_contestant" do
        select kentaro.id, from: :contestant_id
        click_on "Add Contestant"
      end

      within "#project-#{news_chic.id}" do
        expect(page).to have_content("Number of Contestants: 3")
      end

      visit contestants_path

      within ".contestants" do
        expect(page).to have_content(kentaro.name)
      end

      within ".contestants" do
        within "#contestant-#{kentaro.id}" do
          expect(page).to have_content("Projects: #{news_chic.name}")
        end
      end

    end
  end

end