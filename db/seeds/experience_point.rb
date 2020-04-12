# 1時間あたりの獲得経験値量
@standard_value = 120
# Lv.20〜50時の計算用(0.24)
@second_value = @standard_value.to_f / 500

experience_point_table = []
def register_data(experience_point_table)
  # Lv.1〜19
  (1..19).each do |i|
    record = {}
    record[:until_next_level] = @standard_value / 5 * i
    record[:total_required_experience] = (0..(i-1)).sum * @standard_value / 5
    experience_point_table << record
  end

  # Lv.20〜49
  total_so_far = (0..19).sum * @standard_value / 5
  (20..49).each do |i|
    record = {}
    record[:until_next_level] = ((@standard_value * (@second_value - (i/500).to_f)).to_f * i).floor(0).to_i
    record[:total_required_experience] = total_so_far + (1..(i-1)).sum * 24
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
