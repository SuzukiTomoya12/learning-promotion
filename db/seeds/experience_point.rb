# 1時間あたりの獲得経験値量
@standard_value = 120

def first_exp_calc(i)
  @result = (@standard_value * (0.15 - (i.to_f/400)).to_f * i).ceil
end

def first_total_calc(i)
  @total = 0
  @first_total = 0
  (0..(i-1)).each do |i|
    first_exp_calc(i)
    @total += @result
    if i == (30-1)
      @first_total = @total
    end
  end
end

def second_exp_calc(i)
  @result = (270 + ((i-30) **2 * (2.to_f/3)).to_f).ceil
end

def second_total_calc(i)
  @total = 0
  @total += @first_total
  @second_total = 0
  (30..(i-1)).each do |i|
    second_exp_calc(i)
    @total += @result
    if i == (50-1)
      @second_total = @total
    end
  end
end

def third_exp_calc(i)
  @result = (537 + (@standard_value * (0.16 - ((i-100).to_f/320).round(8)).round(6)).to_f * ((i-50)* 0.5).to_f).ceil
end

def third_total_calc(i)
  @total = 0
  @total += @second_total
  @third_total = 0
  (50..(i-1)).each do |i|
    third_exp_calc(i)
    @total += @result
    if i == (100-1)
      @third_total = @total
    end
  end
end

def fourth_exp_calc(i)
  @result = (1014 + ((i-90) ** 2).to_f/40).ceil
end

def fourth_total_calc(i)
  @total = 0
  @total += @third_total
  @fourth_total = 0
  (100..(i-1)).each do |i|
    fourth_exp_calc(i)
    @total += @result
    if i == (1000-1)
      @fourth_total = @total
    end
  end
end



experience_point_table = []
def register_data(experience_point_table)
  # Lv.1〜30
  (1..30).each do |i|
    record = {}
    first_exp_calc(i)
    record[:until_next_level] = @result
    first_total_calc(i)
    record[:total_required_experience] = @total
    experience_point_table << record
  end

  # Lv.31〜50
  (31..50).each do |i|
    record = {}
    second_exp_calc(i)
    record[:until_next_level] = @result
    second_total_calc(i)
    record[:total_required_experience] = @total
    experience_point_table << record
  end

  # Lv.51〜100
  (51..100).each do |i|
    record = {}
    third_exp_calc(i)
    record[:until_next_level] = @result
    third_total_calc(i)
    record[:total_required_experience] = @total
    experience_point_table << record
  end

  # Lv.101〜1000
  (101..1000).each do |i|
    record = {}
    fourth_exp_calc(i)
    record[:until_next_level] = @result
    fourth_total_calc(i)
    record[:total_required_experience] = @total
    experience_point_table << record
  end
end

register_data(experience_point_table)
ExperiencePoint.create!(experience_point_table)
# 読み込みの空振りを防ぐために、create!メソッドを使っている↑

# 設定後、下記コマンドを実行
# bundle exec rake db:seed:experience_point

#コマンド実行前確認用
# puts experience_point_table