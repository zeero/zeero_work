puts "�Œ�̃t�@�C��������͂��Ă�������"
print "�t�@�C�����F"
prefix = gets
10.times do |i|
	s = File.dirname(__FILE__) + "/" + prefix.strip + i.to_s + ".rb"
	out_file = open(s, "a+")
	out_file.close
end
