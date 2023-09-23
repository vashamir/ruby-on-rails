require "json"
require "selenium-webdriver"
require 'spec_helper'
include RSpec::Expectations

describe "EnterSuccess" do

  before(:each) do
    @driver = Selenium::WebDriver.for :firefox
    @base_url = "https://www.google.com/"
    @accept_next_alert = true
    @driver.manage.timeouts.implicit_wait = 30
    @verification_errors = []
  end
  
  after(:each) do
    @driver.quit
    @verification_errors.should == []
  end
  
  it "test_enter_success" do
    @driver.get "http://localhost:3000/"
    @driver.find_element(:link, "Cooker").click
    @driver.find_element(:link, "Войти").click
    @driver.find_element(:id, "user_email").click
    @driver.find_element(:id, "user_email").clear
    @driver.find_element(:id, "user_email").send_keys "1@mail.ru"
    @driver.find_element(:id, "user_password").click
    @driver.find_element(:id, "user_password").clear
    @driver.find_element(:id, "user_password").send_keys "111111"
    @driver.find_element(:xpath, "//form[@id='new_user']/div[4]/input").click
    @driver.find_element(:xpath, "(.//*[normalize-space(text()) and normalize-space(.)='Выйти'])[1]/following::p[1]").click
    @driver.find_element(:id, "navbarDropdown").click
    @driver.find_element(:link, "Выйти").click
  end

  it "test_find_with_enter" do
    @driver.get "http://localhost:3000/recipes/1"
    @driver.find_element(:link, "Cooker").click
    @driver.find_element(:link, "Войти").click
    @driver.find_element(:id, "user_email").clear
    @driver.find_element(:id, "user_email").send_keys "1@mail.ru"
    @driver.find_element(:id, "user_password").click
    @driver.find_element(:id, "user_password").clear
    @driver.find_element(:id, "user_password").send_keys "111111"
    @driver.find_element(:xpath, "//form[@id='new_user']/div[4]/input").click
    @driver.find_element(:xpath, "(.//*[normalize-space(text()) and normalize-space(.)='Выйти'])[1]/following::p[1]").click
    @driver.find_element(:id, "title").click
    @driver.find_element(:id, "title").clear
    @driver.find_element(:id, "title").send_keys "кекс"
    @driver.find_element(:name, "commit").click
    @driver.find_element(:xpath, "//img").click
    @driver.find_element(:xpath, "(.//*[normalize-space(text()) and normalize-space(.)='Выйти'])[1]/following::h1[1]").click
    @driver.find_element(:id, "navbarDropdown").click
    @driver.find_element(:link, "Выйти").click
    @driver.find_element(:xpath, "(.//*[normalize-space(text()) and normalize-space(.)='Войти'])[1]/following::p[1]").click
  end


  it "test_edit_profile" do
    @driver.get "http://localhost:3000/"
    @driver.find_element(:link, "Cooker").click
    @driver.find_element(:link, "Войти").click
    @driver.find_element(:id, "user_email").clear
    @driver.find_element(:id, "user_email").send_keys "2@mail.ru"
    @driver.find_element(:id, "user_password").click
    @driver.find_element(:id, "user_password").clear
    @driver.find_element(:id, "user_password").send_keys "111111"
    @driver.find_element(:xpath, "//form[@id='new_user']/div[4]/input").click
    @driver.find_element(:xpath, "(.//*[normalize-space(text()) and normalize-space(.)='Выйти'])[1]/following::p[1]").click
    @driver.find_element(:id, "navbarDropdown").click
    @driver.find_element(:link, "Профиль").click
    @driver.find_element(:link, "Редактировать профиль").click
    @driver.find_element(:id, "nickname").click
    @driver.find_element(:id, "nickname").clear
    @driver.find_element(:id, "nickname").send_keys "I am second"
    @driver.find_element(:id, "about_me").click
    @driver.find_element(:id, "about_me").clear
    @driver.find_element(:id, "about_me").send_keys "All about me"
    @driver.find_element(:xpath, "//input[3]").click
    @driver.find_element(:xpath, "(.//*[normalize-space(text()) and normalize-space(.)='Выйти'])[1]/following::h4[2]").click
    @driver.find_element(:id, "navbarDropdown").click
    @driver.find_element(:link, "Выйти").click
    @driver.find_element(:xpath, "(.//*[normalize-space(text()) and normalize-space(.)='Войти'])[1]/following::p[1]").click
  end

  it "test_wrong_add_recipe_with_enter" do
    @driver.get "http://localhost:3000/"
    @driver.find_element(:link, "Cooker").click
    @driver.find_element(:link, "Войти").click
    @driver.find_element(:id, "user_email").click
    @driver.find_element(:id, "user_email").clear
    @driver.find_element(:id, "user_email").send_keys "1@mail.ru"
    @driver.find_element(:id, "user_password").click
    @driver.find_element(:id, "user_password").clear
    @driver.find_element(:id, "user_password").send_keys "111111"
    @driver.find_element(:xpath, "//form[@id='new_user']/div[4]/input").click
    @driver.find_element(:xpath, "(.//*[normalize-space(text()) and normalize-space(.)='Выйти'])[1]/following::p[1]").click
    @driver.find_element(:link, "Создать рецепт").click
    @driver.find_element(:xpath, "//div/input").click
    @driver.find_element(:xpath, "//div/input").clear
    @driver.find_element(:xpath, "//div/input").send_keys "heyhey"
    @driver.find_element(:id, "recipe").click
    @driver.find_element(:id, "recipe").clear
    @driver.find_element(:id, "recipe").send_keys "hey"
    @driver.find_element(:xpath, "//input[3]").click
    @driver.find_element(:xpath, "(.//*[normalize-space(text()) and normalize-space(.)='Добавить рецепт'])[1]/following::div[3]").click
    @driver.find_element(:id, "navbarDropdown").click
    @driver.find_element(:link, "Выйти").click
    @driver.find_element(:xpath, "(.//*[normalize-space(text()) and normalize-space(.)='Войти'])[1]/following::p[1]").click
  end

  it "test_find_without_enter" do
    @driver.get "http://localhost:3000/recipes/1"
    @driver.find_element(:link, "Cooker").click
    @driver.find_element(:id, "title").click
    @driver.find_element(:id, "title").clear
    @driver.find_element(:id, "title").send_keys "кекс"
    @driver.find_element(:name, "commit").click
    @driver.find_element(:xpath, "//img").click
  end

  it "test_sucess_add_recipe_with_enter" do
    @driver.get "http://localhost:3000/"
    @driver.find_element(:link, "Cooker").click
    @driver.find_element(:link, "Войти").click
    @driver.find_element(:id, "user_email").click
    @driver.find_element(:id, "user_email").clear
    @driver.find_element(:id, "user_email").send_keys "1@mail.ru"
    @driver.find_element(:id, "user_password").click
    @driver.find_element(:id, "user_password").clear
    @driver.find_element(:id, "user_password").send_keys "111111"
    @driver.find_element(:xpath, "//form[@id='new_user']/div[4]/input").click
    @driver.find_element(:link, "Создать рецепт").click
    @driver.find_element(:xpath, "//div/input").click
    @driver.find_element(:xpath, "//div/input").clear
    @driver.find_element(:xpath, "//div/input").send_keys "example"
    @driver.find_element(:id, "recipe").click
    @driver.find_element(:id, "recipe").clear
    @driver.find_element(:id, "recipe").send_keys "exampleexampleexampleexampleexampleexampleexampleexampleexampleexampleexampleexampleexampleexampleexampleexample"
    @driver.find_element(:xpath, "//input[3]").click
    @driver.find_element(:xpath, "//button[@type='submit']").click
    @driver.find_element(:id, "navbarDropdown").click
    @driver.find_element(:link, "Выйти").click
  end

  it "test_wrong_add_recipe_with_enter" do
    @driver.get "http://localhost:3000/"
    @driver.find_element(:link, "Cooker").click
    @driver.find_element(:link, "Войти").click
    @driver.find_element(:id, "user_email").clear
    @driver.find_element(:id, "user_email").send_keys "1@mail.ru"
    @driver.find_element(:id, "user_password").click
    @driver.find_element(:id, "user_password").clear
    @driver.find_element(:id, "user_password").send_keys "111111"
    @driver.find_element(:xpath, "//form[@id='new_user']/div[4]/input").click
    @driver.find_element(:xpath, "(.//*[normalize-space(text()) and normalize-space(.)='Выйти'])[1]/following::p[1]").click
    @driver.find_element(:link, "Создать рецепт").click
    @driver.find_element(:xpath, "//div/input").click
    @driver.find_element(:xpath, "//div/input").clear
    @driver.find_element(:xpath, "//div/input").send_keys "hey"
    @driver.find_element(:id, "recipe").click
    @driver.find_element(:id, "recipe").clear
    @driver.find_element(:id, "recipe").send_keys "hey hey hey"
    @driver.find_element(:xpath, "//input[3]").click
    @driver.find_element(:xpath, "(.//*[normalize-space(text()) and normalize-space(.)='Добавить рецепт'])[1]/following::div[3]").click
    @driver.find_element(:id, "navbarDropdown").click
    @driver.find_element(:link, "Выйти").click
    @driver.find_element(:xpath, "(.//*[normalize-space(text()) and normalize-space(.)='Войти'])[1]/following::p[1]").click
  end

  it "test_wrong_enter3" do
    @driver.get "http://localhost:3000/"
    @driver.find_element(:link, "Cooker").click
    @driver.find_element(:link, "Войти").click
    @driver.find_element(:id, "user_email").clear
    @driver.find_element(:id, "user_email").send_keys "1@mail.ru"
    @driver.find_element(:id, "user_password").click
    @driver.find_element(:id, "user_password").clear
    @driver.find_element(:id, "user_password").send_keys "1111111"
    @driver.find_element(:xpath, "//form[@id='new_user']/div[4]/input").click
    @driver.find_element(:xpath, "(.//*[normalize-space(text()) and normalize-space(.)='Войти'])[1]/following::p[2]").click
    @driver.find_element(:link, "Cooker").click
  end

  it "test_wrong_enter2" do
    @driver.get "http://localhost:3000/"
    @driver.find_element(:link, "Cooker").click
    @driver.find_element(:link, "Войти").click
    @driver.find_element(:id, "user_email").clear
    @driver.find_element(:id, "user_email").send_keys "wegwgw"
    @driver.find_element(:id, "user_password").click
    @driver.find_element(:id, "user_password").clear
    @driver.find_element(:id, "user_password").send_keys "wgwgwg"
    @driver.find_element(:xpath, "//form[@id='new_user']/div[4]/input").click
    @driver.find_element(:xpath, "(.//*[normalize-space(text()) and normalize-space(.)='Войти'])[1]/following::h2[1]").click
    @driver.find_element(:link, "Cooker").click
  end

  it "test_wrong_enter" do
    @driver.get "http://localhost:3000/"
    @driver.find_element(:link, "Cooker").click
    @driver.find_element(:link, "Войти").click
    @driver.find_element(:id, "user_password").click
    @driver.find_element(:id, "user_password").clear
    @driver.find_element(:id, "user_password").send_keys ""
    @driver.find_element(:xpath, "//form[@id='new_user']/div[4]/input").click
    @driver.find_element(:id, "user_email").clear
    @driver.find_element(:id, "user_email").send_keys "1@mail.ru"
    @driver.find_element(:xpath, "(.//*[normalize-space(text()) and normalize-space(.)='Войти'])[1]/following::p[2]").click
  end

  it "test_cant_add_comment_without_enter" do
    @driver.get "http://localhost:3000/recipes/1"
    @driver.find_element(:link, "Cooker").click
    @driver.find_element(:xpath, "//img").click
  end

  def element_present?(how, what)
    @driver.find_element(how, what)
    true
  rescue Selenium::WebDriver::Error::NoSuchElementError
    false
  end
  
  def alert_present?()
    @driver.switch_to.alert
    true
  rescue Selenium::WebDriver::Error::NoAlertPresentError
    false
  end
  
  def verify(&blk)
    yield
  rescue ExpectationNotMetError => ex
    @verification_errors << ex
  end
  
  def close_alert_and_get_its_text(how, what)
    alert = @driver.switch_to().alert()
    alert_text = alert.text
    if (@accept_next_alert) then
      alert.accept()
    else
      alert.dismiss()
    end
    alert_text
  ensure
    @accept_next_alert = true
  end
end
