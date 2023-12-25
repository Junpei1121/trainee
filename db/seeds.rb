# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Admin.create!(
   email: 'admin@admin',
   password: '123456'
)

徳川家康 = User.find_or_create_by!(email: "tokugawa@example.com") do |user|
  user.name = "徳川家康"
  user.password = "password"
  user.profile_image.attach(io: File.open("#{Rails.root}/db/fixtures/徳川家康.jpg"), filename: "徳川家康.jpg")
end

豊臣秀吉 = User.find_or_create_by!(email: "toyotomi@example.com") do |user|
  user.name = "豊臣秀吉"
  user.password = "password"
  user.profile_image.attach(io: File.open("#{Rails.root}/db/fixtures/豊臣秀吉.jpg"), filename: "豊臣秀吉.jpg")
end

織田信長 = User.find_or_create_by!(email: "oda@example.com") do |user|
  user.name = "織田信長"
  user.password = "password"
  user.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/織田信長.jpg"), filename:"織田信長.jpg")
end

坂本龍馬 = User.find_or_create_by!(email: "sakamoto@example.com") do |user|
  user.name = "坂本龍馬"
  user.password = "password"
  user.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/坂本龍馬.jpg"), filename:"坂本龍馬.jpg")
end

山田花子 = User.find_or_create_by!(email: "yamada@example.com") do |user|
  user.name = "山田花子"
  user.password = "password"
  user.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/れかみえjulia-rekamie-2aHSA17X17c-unsplash.jpg"), filename:"れかみえjulia-rekamie-2aHSA17X17c-unsplash.jpg")
end

佐藤裕子 = User.find_or_create_by!(email: "sato@example.com") do |user|
  user.name = "佐藤裕子"
  user.password = "password"
  user.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/女性toni-frost-46SemKMK-so-unsplash.jpg"), filename:"女性toni-frost-46SemKMK-so-unsplash.jpg")
end

井上ひろ子 = User.find_or_create_by!(email: "inoue@example.com") do |user|
  user.name = "井上ひろ子"
  user.password = "password"
  user.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/女性ilona-panych-ertDIOPtWjc-unsplash.jpg"), filename:"女性ilona-panych-ertDIOPtWjc-unsplash.jpg")
end

近藤祐樹 = User.find_or_create_by!(email: "kondou@example.com") do |user|
  user.name = "近藤祐樹"
  user.password = "password"
  user.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/男性alina-bordunova-60jUq2tQRoU-unsplash.jpg"), filename:"男性alina-bordunova-60jUq2tQRoU-unsplash.jpg")
end

石田太郎 = User.find_or_create_by!(email: "ishida@example.com") do |user|
  user.name = "石田太郎"
  user.password = "password"
  user.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/男性nora-hutton-26dA_eay64M-unsplash.jpg"), filename:"男性nora-hutton-26dA_eay64M-unsplash.jpg")
end

木村太郎 = User.find_or_create_by!(email: "kimura@example.com") do |user|
  user.name = "木村太郎"
  user.password = "password"
  user.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/男性yves-cedric-schulze-K_ZerZxgMjI-unsplash.jpg"), filename:"男性yves-cedric-schulze-K_ZerZxgMjI-unsplash.jpg")
end

上田花子 = User.find_or_create_by!(email: "ueda@example.com") do |user|
  user.name = "上田花子"
  user.password = "password"
  user.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/女性frank-flores--JPsv53Ur8c-unsplash.jpg"), filename:"女性frank-flores--JPsv53Ur8c-unsplash.jpg")
end

Post.find_or_create_by!(body: "筋トレ楽しい") do |post|
  post.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/arm-workout.jpg"), filename:"arm-workout.jpg")
  post.user = 徳川家康
end

Post.find_or_create_by!(body: "今日は胸トレの日") do |post|
  post.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/one-arm-push-up.jpg"), filename:"one-arm-push-up.jpg")
  post.user = 豊臣秀吉
end

Post.find_or_create_by!(body: "今日は脚トレday") do |post|
  post.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/woman-lifts-free-weights.jpg"), filename:"woman-lifts-free-weights.jpg")
  post.user = 織田信長
end

Post.find_or_create_by!(body: "今日は筋トレせないかん") do |post|
  post.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/weight-lifting-man.jpg"), filename:"weight-lifting-man.jpg")
  post.user = 坂本龍馬
end

Post.find_or_create_by!(body: "今日は腕トレモチベ高め") do |post|
  post.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/腕トレlogan-weaver-lgnwvr-84wpg664k_4-unsplash.jpg"), filename:"腕トレlogan-weaver-lgnwvr-84wpg664k_4-unsplash.jpg")
  post.user = 山田花子
end

Post.find_or_create_by!(body: "今日はジムで逆立ちして追い込み！") do |post|
  post.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/逆立ち.jpg"), filename:"逆立ち.jpg")
  post.user = 木村太郎
end

Post.find_or_create_by!(body: "今日はラットプルで背中を追い込みました") do |post|
  post.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/ラットプル.jpg"), filename:"ラットプル.jpg")
  post.user = 石田太郎
end

Post.find_or_create_by!(body: "ジムにこもって筋トレ") do |post|
  post.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/ジムトレ.jpg"), filename:"ジムトレ.jpg")
  post.user = 近藤祐樹
end

Post.find_or_create_by!(body: "脚トレ頑張って基礎代謝UP！") do |post|
  post.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/脚トレ.jpg"), filename:"脚トレ.jpg")
  post.user = 佐藤裕子
end

Post.find_or_create_by!(body: "ダイエットにいい筋トレなにかありませんかー？") do |post|
  post.user = 井上ひろ子
end

Post.find_or_create_by!(body: "筋トレやってる自分ってストイック") do |post|
  post.user = 織田信長
end

Post.find_or_create_by!(body: "今日こそは妥協せずに筋トレがんばる！") do |post|
  post.user = 徳川家康
end

Post.find_or_create_by!(body: "明日は筋トレモチベ高いかな？") do |post|
  post.user = 豊臣秀吉
end

Post.find_or_create_by!(body: "胸トレで何かいい方法募集") do |post|
  post.user = 坂本龍馬
end

Post.find_or_create_by!(body: "最近脚トレおろそかだな") do |post|
  post.user = 徳川家康
end

Post.find_or_create_by!(body: "腕トレ頑張りたい今日この頃") do |post|
  post.user = 織田信長
end

Post.find_or_create_by!(body: "ここ最近筋トレモチベが高くて") do |post|
  post.user = 井上ひろ子
end