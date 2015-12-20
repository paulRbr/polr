Rails.application.routes.draw do
  get '/shorten' => "application#shorten"
  get '/:id' => "shortener/shortened_urls#show"
end
