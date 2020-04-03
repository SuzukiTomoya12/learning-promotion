#親カテゴリー
parent_array = [
  {name: "開発", description: "近頃ブームにもなっている、プログラミングやデータサイエンス分野を扱うカテゴリーです。", image: "tags/development/development.jpg"},
  {name: "ビジネススキル", description: "仕事でよく使われるExcelやWordをはじめ、財務やマーケティングなどを扱うカテゴリーです。", image: "tags/business-skill/business-skill.jpg"},
  {name: "デザイン", description: "グラフィックやゲーム、ウェブ、建築などあらゆるものに精通するデザインに関するカテゴリーです。", image: "tags/design/design.jpg"},
  {name: "教育・教養", description: "教育現場で扱う教科をはじめ、教育者としてのスキルなども扱うカテゴリーです。", image: "tags/education/education.jpg"},
  {name: "宿題", description: "学校に通う全ての人に共通する「宿題」。どうせやるなら楽しく宿題をこなしませんか？", image: "tags/homework/homework.jpg"},
  {name: "読書", description: "本はあなたに新しい世界を与えてくれます。スキルを手に入れるも良いですし、ファンタジーの世界に飛び込むの良いでしょう。", image: "tags/reading/reading.jpg"},
  {name: "自己啓発", description: "あなたの人生をより良くすることがたくさん詰まっています。また、あなたに関わる人に幸福を与える可能性も秘めています。", image: "tags/self-enlightenment/self-enlightenment.jpg"}
]


# 開発
development_child_array = [
  {name: "プログラミング", description: "アプリケーションやソフトウェア開発に関わるプログラミングを学びます。", image: "tags/development/programing.jpg")},
  {name: "開発ツール", description: "開発に便利なツールの使い方を学びます。", image: "tags/development/development-tool.jpg"},
  {name: "データベース", description: "SQLなどを学ぶことができます。", image: "tags/development/database.jpg"},
  {name: "データサイエンス", description: "ビッグデータの活用方法などを学ぶことができます。", image: "tags/development/data-science.jpg"},
  {name: "ゲーム開発", description: "ゲームの開発に関する知識を学ぶことができます。", image: "tags/development/game-development.jpg"}
]

development_grandchild_array = [
  [ # 開発 >> プログラミング
  {name: "HTML/CSS", description: "Web上の見た目を作るマークアップ言語の1つ", image: ""},
  {name: "Ruby", description: "直感的に理解しやすいサーバーサイド言語", image: ""},
  {name: "Ruby on Rails", description: "Webサービスの開発に用いるRubyのフレームワーク", image: ""},
  {name: "Java Script", description: "Webに動きを付与することができるフロントエンド言語", image: ""},
  {name: "jQuery", description: "様々なアニメーションが実行できるJava Scriptのライブラリ", image: ""},
  {name: "PHP", description: "Web開発に適した日本でも人気の高いサーバーサイド言語", image: ""},
  {name: "Laravel", description: "PHPの開発用フレームワーク", image: "tags/development/Laravel.png"},
  {name: "Java", description: "大規模な開発にも適している汎用的なプログラミング言語", image: ""},
  {name: "C", description: "モダンなプログラミング言語", image: ""},
  {name: "C++", description: "モダンなプログラミング言語", image: ""},
  {name: "C#", description: "モダンなプログラミング言語", image: ""},
  {name: "React", description: "サイトの見た目や動きを作る、世界的に人気上昇中のJava Scriptのライブラリ", image: ""},
  {name: "Swift", description: "iOSのアプリ開発に適したプログラミング言語", image: ""},
  {name: "Go", description: "Googleによって開発された人気上昇中のプログラミング言語", image: ""}
  ],[ # 開発 >> 開発ツール
  {name: "Git", description: "コードの管理やチームでの共同開発を可能にするツール", image: ""}
  ],[ # 開発 >> データベース
    {name: "MySQL", description: "データの操作や分析に利用できるデータベース言語", image: ""}
  ],[ # 開発 >> データサイエンス
  {name: "機械学習", description: "アルゴリズムを用いてデータ分析を行う分野", image: ""}
  ],[ # 開発 >> ゲーム開発
  {name: "Unity", description: "ゲームの開発に用いられるプログラミング言語", image: ""}
  ]
]

parent = Tag.create(parent_array[0])
development_child_array.each_with_index do |child,i|
  child = parent.children.create(name: child[:name], description: child[:description], image: child[:image])
  development_grandchild_array[i].each do |grandchild|
    child.children.create(name: grandchild[:name], description: grandchild[:description], image: grandchild[:image])
  end
end



business_skill_child_array = [
  {name: "Microsoft", description: "Microsoft社のoffice製品を主としたカテゴリー", image: ""},
  {name: "マネジメント", description: "組織の運営・管理・統制など", image: ""}
]

business_skill_grandchild_array = [
  [ # ビジネススキル >> Microsoft
  {name: "Excel", description: "簡単な表作成から財務管理、マクロなど利用者に幅広く愛されるビジネスツールです", image: ""},
  {name: "Word", description: "文書の作成に適したツール", image: ""},
  {name: "Power Point", description: "プレゼンテーションの作成が可能なツール", image: ""}
  ],[ # ビジネススキル >> マネジメント
  {name: "スクラム", description: "「上下関係」ではなく「チーム」を重視したマネジメントスタイル", image: ""},
  {name: "品質管理", description: "顧客に提供する商品やサービスの品質を向上するためのメソッド", image: ""},
  {name: "アジャイル", description: "スプリントを重ねて短い周期で改良していく開発スタイル", image: ""},
  {name: "リスク管理", description: "ビジネスに欠かせない、リスクヘッジや分散に関する知識", image: ""},
  {name: "リーダーシップ", description: "組織を率いるポジションの人材に求められるスキル", image: ""}
  ]
]

parent = Tag.create(parent_array[1])
business_skill_child_array.each_with_index do |child,i|
  child = parent.children.create(name: child[:name], description: child[:description], image: child[:image])
  business_skill_grandchild_array[i].each do |grandchild|
    child.children.create(name: grandchild[:name], description: grandchild[:description], image: grandchild[:image])
  end
end


# デザイン
# design_child_array = [
#   {name: "", description: "", image: ""},
#   {name: "", description: "", image: ""},
#   {name: "", description: "", image: ""},
#   {name: "", description: "", image: ""},
#   {name: "", description: "", image: ""},
# ]

# design_grandchild_array = [
#   {name: "", description: "", image: ""},
#   {name: "", description: "", image: ""},
#   {name: "", description: "", image: ""},
#   {name: "", description: "", image: ""},
#   {name: "", description: "", image: ""},
# ]

parent = Tag.create(parent_array[2])
design_child_array.each_with_index do |child,i|
  child = parent.children.create(name: child[:name], description: child[:description], image: child[:image])
  design_grandchild_array[i].each do |grandchild|
    child.children.create(name: grandchild[:name], description: grandchild[:description], image: grandchild[:image])
  end
end


# 教育・教養
education_child_array = [
  {name: "言語", description: "", image: ""},
  {name: "資格", description: "", image: ""},
  {name: "エンジニアリング", description: "", image: ""}
]

education_grandchild_array = [
  [ # 教育・教養 >> 言語
  {name: "英語", description: "世界で最も主要な言語", image: ""},
  {name: "日本語", description: "日本人の母国語言語", image: ""},
  {name: "中国語", description: "中国の発展と共に修学価値が高まる言語", image: ""},
  {name: "イタリア語", description: "", image: ""},
  {name: "フランス語", description: "", image: ""},
  {name: "ドイツ語", description: "", image: ""},
  {name: "スペイン語", description: "", image: ""},
  {name: "その他の言語", description: "主要な言語以外のその他のもの", image: ""}
  ],[ # 教育・教養 >> 資格・検定
  {name: "簿記", description: "", image: ""},
  {name: "宅地建物取引士", description: "", image: ""},
  {name: "建築士", description: "", image: ""},
  {name: "施工管理技士", description: "", image: ""},
  {name: "色彩検定", description: "", image: ""},
  {name: "カラーコーディネーター", description: "", image: ""},
  {name: "インテリアコーディネーター", description: "", image: ""}
  ],[ # 教育・教養 >> エンジニアリング
  {name: "機械工学", description: "", image: ""},
  {name: "ロボット工学", description: "", image: ""},
  {name: "電気工学", description: "", image: ""},
  {name: "電子工学", description: "", image: ""},
  {name: "土木工学", description: "", image: ""},
  {name: "航空宇宙工学", description: "", image: ""}
  ]
]

parent = Tag.create(parent_array[3])
education_child_array.each_with_index do |child,i|
  child = parent.children.create(name: child[:name], description: child[:description], image: child[:image])
  education_grandchild_array[i].each do |grandchild|
    child.children.create(name: grandchild[:name], description: grandchild[:description], image: grandchild[:image])
  end
end

# 宿題
parent = Tag.create(parent_array[4])

# 読書
reading_child_array = [
  {name: "専門書", description: "専門分野の関連書籍", image: ""},
  {name: "ビジネス書籍", description: "仕事に役立つスキルの本", image: ""}
]

parent = Tag.create(parent_array[5])
reading_child_array.each_with_index do |child,i|
  child = parent.children.create(name: child[:name], description: child[:description], image: child[:image])
  # reading_grandchild_array[i].each do |grandchild|
  #   child.children.create(name: grandchild[:name], description: grandchild[:description], image: grandchild[:image])
  # end
end

# 自己啓発
self_enlightenment_child_array = [
  {name: "キャリア", description: "社会人としてのキャリア形成", image: ""},
  {name: "モチベーション", description: "仕事やスキルアップのモチベーション維持", image: ""}
]

self_enlightenment_grandchild_array = [
  [ # 自己啓発 >> キャリア
  {name: "就職・転職活動", description: "社会人としてのキャリアを決める活動", image: ""},
  {name: "面接", description: "入社に大手をかける面接の対策・練習", image: ""},
  {name: "履歴書", description: "就職・転職に必須のあなたの取扱説明書", image: ""},
  {name: "職務経歴書", description: "転職で自分のスキルをアピールするための書類", image: ""},
  {name: "人脈の形成", description: "ビジネスに繋がる良好な人脈形成", image: ""}
 ],[ # 自己啓発 >> モチベーション
  {name: "新たな刺激", description: "モチベーションの保持・向上に導く外部からの刺激と出会い", image: ""}
  ]
]

parent = Tag.create(parent_array[6])
self_enlightenment_child_array.each_with_index do |child,i|
  child = parent.children.create(name: child[:name], description: child[:description], image: child[:image])
  self_enlightenment_grandchild_array[i].each do |grandchild|
    child.children.create(name: grandchild[:name], description: grandchild[:description], image: grandchild[:image])
  end
end

