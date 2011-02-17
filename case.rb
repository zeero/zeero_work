case "hoge"
  when "HOGE"
    puts "文字比較"
  when /HOGEHOGE/i
    puts "正規表現も使える"
  when Array
    puts "クラスタイプで判別もできる"
  else
    puts "デフォルトの挙動"
end
