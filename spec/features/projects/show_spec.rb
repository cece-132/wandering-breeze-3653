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
end

# recycled_material_challenge = Challenge.create(theme: "Recycled Material", project_budget: 1000)
# furniture_challenge = Challenge.create(theme: "Apartment Furnishings", project_budget: 1000)

# news_chic = recycled_material_challenge.projects.create(name: "News Chic", material: "Newspaper")
# boardfit = recycled_material_challenge.projects.create(name: "Boardfit", material: "Cardboard Boxes")

# upholstery_tux = furniture_challenge.projects.create(name: "Upholstery Tuxedo", material: "Couch")
# lit_fit = furniture_challenge.projects.create(name: "Litfit", material: "Lamp")

# jay = Contestant.create(name: "Jay McCarroll", age: 40, hometown: "LA", years_of_experience: 13)
# gretchen = Contestant.create(name: "Gretchen Jones", age: 36, hometown: "NYC", years_of_experience: 12)
# kentaro = Contestant.create(name: "Kentaro Kameyama", age: 30, hometown: "Boston", years_of_experience: 8)
# erin = Contestant.create(name: "Erin Robertson", age: 44, hometown: "Denver", years_of_experience: 15)


# ContestantProject.create(contestant_id: jay.id, project_id: news_chic.id)
# ContestantProject.create(contestant_id: gretchen.id, project_id: news_chic.id)
# ContestantProject.create(contestant_id: gretchen.id, project_id: upholstery_tux.id)
# ContestantProject.create(contestant_id: kentaro.id, project_id: upholstery_tux.id)
# ContestantProject.create(contestant_id: kentaro.id, project_id: boardfit.id)
# ContestantProject.create(contestant_id: erin.id, project_id: boardfit.id)