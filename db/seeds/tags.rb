#親カテゴリー
parent_array = [
  {name: "開発", description: "近頃ブームにもなっている、プログラミングやデータサイエンス分野を扱うカテゴリーです。", image: ""},
  {name: "ビジネススキル", description: "仕事でよく使われるExcelやWordをはじめ、財務やマーケティングなどを扱うカテゴリーです。", image: ""},
  {name: "デザイン", description: "グラフィックやゲーム、ウェブ、建築などあらゆるものに精通するデザインに関するカテゴリーです。", image: ""},
  {name: "教育・教養", description: "教育現場で扱う教科をはじめ、教育者としてのスキルなども扱うカテゴリーです。", image: ""},
  {name: "宿題", description: "学校に通う全ての人に共通する「宿題」。どうせやるなら楽しく宿題をこなしませんか？", image: ""},
  {name: "読書", description: "本はあなたに新しい世界を与えてくれます。スキルを手に入れるも良いですし、ファンタジーの世界に飛び込むの良いでしょう。", image: ""},
  {name: "自己啓発", description: "あなたの人生をより良くすることがたくさん詰まっています。また、あなたに関わる人に幸福を与える可能性も秘めています。", image: ""}
]

development_child_array = [
  {name: "プログラミング", description: "", image: ""},
  {name: "開発ツール", description: "", image: ""},
  {name: "データベース", description: "", image: ""},
  {name: "データサイエンス", description: "", image: ""},
  {name: "ゲーム開発", description: "", image: ""}
]

development_grandchild_array = [
  [ # 開発 >> プログラミング
  {name: "HTML/CSS", description: "", image: ""},
  {name: "Ruby", description: "", image: ""},
  {name: "Ruby on Rails", description: "", image: ""},
  {name: "Java Script", description: "", image: ""},
  {name: "jQuery", description: "", image: ""},
  {name: "PHP", description: "", image: ""},
  {name: "Laravel", description: "PHPの開発用フレームワークです。", image: "tags/development/Laravel.png"},
  {name: "Java", description: "", image: ""},
  {name: "C", description: "", image: ""},
  {name: "C++", description: "", image: ""},
  {name: "C#", description: "", image: ""},
  {name: "React", description: "", image: ""},
  {name: "Swift", description: "", image: ""},
  {name: "Go", description: "", image: ""}
  ],[ # 開発 >> 開発ツール
  {name: "Git", description: "", image: ""}
  ],[ # 開発 >> データベース
    {name: "MySQL", description: "", image: ""}
  ],[ # 開発 >> データサイエンス
  {name: "機械学習", description: "", image: ""}
  ],[ # 開発 >> ゲーム開発
  {name: "Unity", description: "", image: ""}
  ]
]

parent = Tag.create(name: "開発")
development_child_array.each_with_index do |child, i|
  child = parent.children.create(name: child)
  development_grandchild_array[i].each do |grandchild|
    child.children.create(name: grandchild)
  end
end


business_skill_child_array = [
  {name: "Microsoft", description: "Microsoft社のoffice製品を主としたカテゴリー", image: ""},
  {name: "マネジメント", description: "", image: ""}
]

business_skill_grandchild_array = [
  [ # ビジネススキル >> Microsoft
  {name: "Excel", description: "簡単な表作成から財務管理、マクロなど利用者に幅広く愛されるビジネスツールです", image: ""},
  {name: "Word", description: "", image: ""},
  {name: "Power Point", description: "", image: ""}
 ],[ # ビジネススキル >> マネジメント
  {name: "スクラム", description: "", image: ""},
  {name: "品質管理", description: "", image: ""},
  {name: "アジャイル", description: "", image: ""},
  {name: "リスク管理", description: "", image: ""},
  {name: "リーダーシップ", description: "", image: ""}
 ]
]

parent = Tag.create(name: "ビジネススキル")
business_skill_child_array.each_with_index do |child, i|
  child = parent.children.create(name: child)
  business_skill_grandchild_array[i].each do |grandchild|
    child.children.create(name: grandchild)
  end
end


# プログラミングとビジネススキルだけ仕上げる！

# design_array = [
#   {name: "", description: "", image: ""},
#   {name: "", description: "", image: ""},
#   {name: "", description: "", image: ""},
#   {name: "", description: "", image: ""},
#   {name: "", description: "", image: ""},
# ]

# design_array = [
#   {name: "", description: "", image: ""},
#   {name: "", description: "", image: ""},
#   {name: "", description: "", image: ""},
#   {name: "", description: "", image: ""},
#   {name: "", description: "", image: ""},
# ]