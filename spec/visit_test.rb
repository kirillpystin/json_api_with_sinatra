require_relative 'acceptance/acceptance_helper.rb'

feature "Visits" do

  scenario "home page" do
    visit "/"
    expect(page).to have_content("Rick Sunchez","Dr.Evil")
    puts "All genius found"
  end

  scenario "genius: id 2" do
    visit "/crazy/2"
    expect(page).to have_content("Rick Sunchez")
    puts "Genius(id:2) found"
  end

  scenario "genius: id 3" do
    visit "/crazy/3"
    expect(page).to have_content("Dr.Evil")
    puts "Genius(id:3) found"
  end

  scenario "full array inventions genius: id 2" do
    visit "/crazy/2/invents"
    expect(page).to have_content("Turbo car","Robots-Solgers")
    puts "Array inventions genius(id:2) found"
  end

  scenario "full array inventions genius: id 3" do
    visit "/crazy/3/invents"
    expect(page).to have_content("Telescop","Space Bomb")
    puts "Array inventions genius(id:3) found"
  end


  scenario "invention(id:3) from the genius(id 2)" do
    visit "/crazy/2/invents/3"
    expect(page).to have_content("Turbo car")
    puts "Invention(id:3) from genius(id:2) found"
  end

  scenario "invention(id:6) from the genius(id 2)" do
    visit "/crazy/2/invents/6"
    expect(page).to have_content("Robots-Solgers")
    puts "Invention(id:5) from genius(id:2) found"
  end

end