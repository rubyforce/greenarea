FacebookShare.default_facebook_share_options = {
  :framework => :jquery,
  :jquery_function => "$",

  :app_id => Rails.configuration.facebook.id,
  :status => "true",
  :cookie => "false",
  :xfbml => "true",

  :selector => '.facebook',
  :locale => "en_US"
}