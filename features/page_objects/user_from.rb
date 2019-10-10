#All Page elements are defined here Page-Object-Model

# Fields
  def name
    page.find(:xpath , '//*[@id="mG61Hd"]/div/div[2]/div[2]/div[1]/div/div[2]/div/div[1]/div/div[1]/input')
  end

  def email
    page.find(:xpath , '//*[@id="mG61Hd"]/div/div[2]/div[2]/div[2]/div/div[2]/div/div[1]/div/div[1]/input')
  end

  def dateOfBirth
    page.find(:xpath , '//*[@id="mG61Hd"]/div/div[2]/div[2]/div[3]/div/div[2]/div/div[2]/div[1]/div/div[1]/input')
  end

  def phoneNumber
    page.find(:xpath , '//*[@id="mG61Hd"]/div/div[2]/div[2]/div[4]/div/div[2]/div/div[1]/div/div[1]/input')
  end

  def selectMale
    page.find(:xpath , '//*[@id="mG61Hd"]/div/div[2]/div[2]/div[5]/div/div[2]/div/span/div/div[1]/label/div/div[1]/div[3]/div')
  end

  def selectFemale
    page.find(:xpath , '//*[@id="mG61Hd"]/div/div[2]/div[2]/div[5]/div/div[2]/div/span/div/div[2]/label/div/div[1]/div[3]/div')
  end

  def countryDropDown
    page.find(:xpath , '//*[@id="mG61Hd"]/div/div[2]/div[2]/div[6]/div/div[2]')
  end

  def countryBulgaria
    page.find(:xpath , '//*[@id="mG61Hd"]/div/div[2]/div[2]/div[6]/div/div[2]/div[2]/div[3]/span')
  end

  def countryCanada
    page.find(:xpath , '//*[@id="mG61Hd"]/div/div[2]/div[2]/div[6]/div/div[2]/div[2]/div[5]/span')
  end

  def cityDropDown
    page.find(:xpath , '//*[@id="mG61Hd"]/div/div[2]/div[2]/div[7]/div/div[2]/div[1]/div[1]/div[1]')
  end

  def citySofia
    page.find(:xpath , '//*[@id="mG61Hd"]/div/div[2]/div[2]/div[7]/div/div[2]/div[2]/div[3]/span')
  end

  def cityOttowa
    page.find(:xpath , '//*[@id="mG61Hd"]/div/div[2]/div[2]/div[7]/div/div[2]/div[2]/div[5]/span')
  end

  def streetAddress
    page.find(:xpath , '//*[@id="mG61Hd"]/div/div[2]/div[2]/div[8]/div/div[2]/div/div[1]/div/div[1]/input')
  end

  def selectBulgaria
    page.find(:xpath , '//*[@id="mG61Hd"]/div/div[2]/div[2]/div[6]/div/div[2]').click
    page.find(:xpath , '//*[@id="mG61Hd"]/div/div[2]/div[2]/div[6]/div/div[2]/div[2]/div[3]/span').click
    waitListGetSelected
  end

  def selectSofia
    page.find(:xpath , '//*[@id="mG61Hd"]/div/div[2]/div[2]/div[7]/div/div[2]/div[1]/div[1]/div[1]').click
    page.find(:xpath , '//*[@id="mG61Hd"]/div/div[2]/div[2]/div[7]/div/div[2]/div[2]/div[3]/span').click
    waitListGetSelected
  end

  def cityAlert

  end

  # Buttons
  def submitButton
    page.find('.quantumWizButtonPaperbuttonLabel.exportLabel')
  end


  def waitListGetSelected
    sleep 0.1
  end