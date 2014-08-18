Rails.application.routes.draw do
  match "/javascripts/green_light" => "assets#green_light", via: [:get, :post]
  match "/javascripts/check_for_uniqueness" => "javascripts#check_for_uniqueness", via: [:get, :post]
end
