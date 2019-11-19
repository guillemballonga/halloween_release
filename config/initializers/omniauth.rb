Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, "431553288443-oq5p6tvfs6d7e9ub893nep48c8jq01ao.apps.googleusercontent.com", "R0Zn019kfYinDS5wlLsAdMpb"
end