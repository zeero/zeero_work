file = open("N:/SHADOW/TOOL/DDL/kain/crd.ddl")

str = ""
out_file = open("C:/Jiro/tool/Ruby/test.txt","w")
while line = file.gets do
	str = str + line
	if line =~ /CREATE TABLE/
		str = line
	elsif line =~ /;/
		print str
		
		out_file.puts(str)
		
		str = ""
	end
end

file.close
out_file.close
