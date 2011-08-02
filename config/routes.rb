Rails.application.routes.draw do
  match "/assets/green_light" => "assets#green_light"
  match "/javascripts/check_for_uniqueness" => "javascripts#check_for_uniqueness"
end
