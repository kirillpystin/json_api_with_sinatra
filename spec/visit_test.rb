require_relative 'acceptance/acceptance_helper.rb'

feature "Visits" do

  scenario "home page" do
    visit "/"
    expect(page).to have_content("Rick Sunchez","Dr.Evil")
    puts "All genius found"
  end

  scenario "Genius(id: 2)" do
    visit "/crazy/2"
    expect(page).to have_content("Rick Sunchez")
    puts "Genius(id: 2) found"
  end

  scenario "Genius(id: 3)" do
    visit "/crazy/3"
    expect(page).to have_content("Dr.Evil")
    puts "Genius(id: 3) found"
  end

  scenario "Genius(id:5)" do
    visit "/crazy/5"
    expect(page).to have_content("Запись не найдена")
    puts "Genius(id: 5) not found"
  end

  scenario "full array inventions genius: id: 5" do
    visit "/crazy/5/invents"
    expect(page).to have_content("Записей не найдено")
    puts "Array inventions genius(id:5) not found"
  end


  scenario "full array inventions genius: id: 2" do
    visit "/crazy/2/invents"
    expect(page).to have_content("Turbo car","Robots-Solgers")
    puts "Array inventions genius(id:2) found"
  end

  scenario "full array inventions genius: id: 3" do
    visit "/crazy/3/invents"
    expect(page).to have_content("Telescop","Space Bomb")
    puts "Array inventions genius(id:3) found"
  end


  scenario "invention(id:3) from the genius(id: 2)" do
    visit "/crazy/2/invents/3"
    expect(page).to have_content("Turbo car")
    puts "Invention(id:3) from genius(id:2) found"
  end

  scenario "invention(id:6) from the genius(id: 2)" do
    visit "/crazy/2/invents/6"
    expect(page).to have_content("Robots-Solgers")
    puts "Invention(id:6) from genius(id:2) found"
  end

  scenario "invention(id:2) from the genius(id: 3)" do
    visit "/crazy/3/invents/2"
    expect(page).to have_content("Telescop")
    puts "Invention(id:3) from genius(id:2) found"
  end

  scenario "invention(id:4) from the genius(id 3)" do
    visit "/crazy/3/invents/4"
    expect(page).to have_content("Space Bomb")
    puts "Invention(id:4) from genius(id:2) found"
  end

  scenario "invention(id:7) from the genius(id 3)" do
    visit "/crazy/3/invents/7"
    expect(page).to have_content("Запись не найдена")
    puts "Invention(id:7) from genius(id:3) not found"
  end

end