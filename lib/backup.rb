files = ['file', 'folder/']; #Files to back up
backupdir = "/backup/" #Backup directory

time = Time.new
day = time.strftime("%w")

if(!File.exists?(backupdir))
  Dir.mkdir backupdir
end

files.each { |item|
  name = item.split("/")

  system ('tar -cjf '+backupdir+day+'/'+name[-1]+'.tar.bz2 '+item)
}
