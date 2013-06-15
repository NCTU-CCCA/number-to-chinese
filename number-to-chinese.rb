map = %w(零 一 二 三 四 五 六 七 八 九)
ARGV[0].each_char{|c|
  print c == '.' ? '點' : map[c.to_i]
}
puts