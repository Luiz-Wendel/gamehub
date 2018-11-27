# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )

Rails.application.config.assets.precompile += %w( site/profile/sales.js
                                                  site/profile/exchanges.js
                                                  site/profile/ads.js
                                                  site/profile/member_games.js.coffee
                                                  site/profile/profile_member.js
                                                  site/profile/ratings.js
                                                  site/exchange_detail.js
                                                  site/profile.js
                                                  site/home.js
                                                  site.js
                                                  backoffice.js )

Rails.application.config.assets.precompile += %w( site/profile/sales.css
                                                  site/profile/exchanges.css
                                                  site/profile/ads.css
                                                  site/profile/member_games.css
                                                  site/profile/profile_member.css
                                                  site/profile/ratings.css
                                                  site/exchange_detail.css
                                                  site/profile.css
                                                  site/home.css
                                                  site.css
                                                  backoffice.css )
