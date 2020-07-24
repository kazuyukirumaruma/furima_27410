FactoryBot.define do
   
  factory :user do
    nickname               {"kkk"}
    email                  {"kkk@gmail.com"}
    password               {"Wk0000"}
    encrypted_password     {"Wk0000"}
    firstname              {"田中"}
    lastname               {"太郎"}
    kana_first             {"タナカ"}
    kana_last              {"タロウ"}
    birthday               {'2000-01-01'}
  end

end