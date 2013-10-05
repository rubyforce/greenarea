FactoryGirl.define do
  factory :investment do
    address_line_1  "Address1"
    address_line_2  "Address2"
    city            "Moscow"
    zip_code        "12345"
    phone_area_code "134"
    phone_prefix    "134"
    phone_last_four "1234"
    quantity        "1"
  end
end
