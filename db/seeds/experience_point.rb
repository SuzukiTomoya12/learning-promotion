# 1時間あたりの獲得経験値量
@standard_value = 120
# Lv.21〜50時の計算用(0.24)
@second_value = @standard_value.to_f / 500

experience_point_table = []
def register_data(experience_point_table)
  # Lv.1〜20
  (1..20).each do |i|
    record = {}
    until_next = (@standard_value * (0.15 - (i.to_f/400)).to_f * i).ceil
    record[:until_next_level] = until_next
    record[:total_required_experience] = experience_point_table[:total_required_experience][i-1] + until_next
    experience_point_table << record
  end

  # Lv.21〜50
  total_so_far = (1..20).sum * @standard_value / 5
  (21..50).each do |i|
    record = {}
    record[:until_next_level] = ((@standard_value * (@second_value - (i/500).to_f)).to_f * i).floor(0).to_i
    record[:total_required_experience] = total_so_far + (1..(i-1)).sum * 24
    experience_point_table << record
  end
end

register_data(experience_point_table)
# ExperiencePoint.create!(experience_point_table)
# 読み込みの空振りを防ぐために、create!メソッドを使っている↑

# 設定後、下記コマンドを実行
# bundle exec rake db:seed:experience_point

#コマンド実行前確認用
puts experience_point_table
