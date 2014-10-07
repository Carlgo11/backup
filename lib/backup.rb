ary = ['/home/hubserver/HUB_SERVER', '/home/hubserver/mod'];
backupdir = "/backup/"

time = Time.new
day = time.strftime("%w")

if(!File.exists?(backupdir))
  Dir.mkdir backupdir
end

ary.each { |item|
  name = item.split("/")

  system ('tar -cjf '+backupdir+day+'/'+name[-1]+'.tar.bz2 '+item)
}
