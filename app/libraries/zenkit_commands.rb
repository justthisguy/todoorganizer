class ZenkitCommands

  Root_folder_path = "../Zenkit"
  Root_folder_name = "Zenkit"

  def process_folder folder_path, folder_name
    puts "process_folder #{folder_name}s with path #{folder_path}"

    folder = Zenkitfolder.find_or_create_by title: folder_name

    files = Dir.glob("*.csv", base: folder_path)
    files.each { |file_name| process_csv folder, "#{folder_path}/#{file_name}", file_name }

    all = Dir.glob("*", base: folder_path)
    folders = all - files
    folders.each { |sub_folder_name| process_folder "#{folder_path}/#{sub_folder_name}", sub_folder_name }
  end

  def process_csv folder, file_path, file_name
    list_name = file_name.gsub('.csv', '')
    puts "process_csv -- folder title <#{folder.title}> file_path <#{file_path}> list_name <#{list_name}>"

    source = SmarterCSV.process(file_path, {:col_sep => ",", :row_sep => "\n"})

    Zenkitlist.create_from folder, list_name, source
  end



  def self.setup
    zenkit = ZenkitCommands.new
    zenkit.process_folder Root_folder_path, Root_folder_name
  end

  def self.counts # needs to be done in reverse order of dependancy
    puts Zenkitsubtask.count
    puts Zenkittask.count
    puts Zenkitlist.count
    puts Zenkitfolder.count
  end

  def self.delete_all # needs to be done in reverse order of dependancy
    Zenkitsubtask.delete_all ; puts Zenkitsubtask.count
    Zenkittask.delete_all    ; puts Zenkittask.count
    Zenkitlist.delete_all    ; puts Zenkitlist.count
    Zenkitfolder.delete_all  ; puts Zenkitfolder.count
  end
end


# zentask "title;stage;due_date;notes;files;assigned_to;created;created_by;checklists;comments"



# file = File.open( "../Zenkit/people/SF.csv" ); foo = file.first; bar = foo.split('').map { |c| c.ord }; bar.first
# file = File.open( "../to_sort.csv" ); foo = file.first; bar = foo.split('').map { |c| c.ord }; bar.first

# file   = File.open( "../TODO.json" )

#     o = SmarterCSV.process("../out.csv", {:col_sep => ";", :row_sep => "\n"})

