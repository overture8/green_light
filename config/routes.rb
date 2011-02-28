Rails.application.routes.draw do
  match "/javascripts/green_light" => "javascripts#green_light"
  match "/javascripts/check_for_uniqueness" => "javascripts#check_for_uniqueness"
end
