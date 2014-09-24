require 'csv'
require 'active_record'

#creates dtable and seeds it from a csv
#use:
# save seed data in lib/assets
#rake csv_to_pg filename=#{filename} modelname=#{name #of your rails model to associate with this table}

task :tsv_to_pg => :environment do
  @db_info = ActiveRecord::Base.configurations[Rails.env]
  relative_path = "../../assets/"<<ENV['filename']
  full_path = File.expand_path(relative_path, __FILE__)
    
  def create_model_from_csv filename, model_name
    c = CSV.open(filename, {col_sep: "\t"})
    columns = c.readline
    command = "rails generate scaffold " << model_name.to_s.capitalize
  
    columns.each do |header|
      command << " " << header.to_s.downcase << ":string"
    end
    p "generating migration"
    system command
  end

  def copy_table_from_csv filename, modelname 
    columns = CSV.open(filename, {col_sep: "\t"}).readline
    
    cols = "("
    columns.each do |col|
      cols << "#{col.downcase},"
    end
    cols.chop!
    cols << ")"
    # command = "COPY #{modelname.pluralize} #{cols} FROM '#{filename}' DELIMITER ',' CSV HEADER;"

    # connection = ActiveRecord::Base.establish_connection( @db_info )
   #  connection.connection.execute(command)
    
    conn = ActiveRecord::Base.connection

    rc = conn.raw_connection

    rc.exec("COPY #{modelname.pluralize} #{cols} FROM STDIN")

    file = File.open(filename, 'r')
    file.readline
    while !file.eof?
      # Add row to copy data
      rc.put_copy_data(file.readline)
    end
    rc.put_copy_end 
 
    # Display any error messages
    while res = rc.get_result
      if e_message = res.error_message
        p e_message
      end
    end
    
  end
  
  # create_model_from_csv full_path, ENV['modelname']
 #  p "migrating"
 #  system "rake db:migrate"
  p "copying"
  copy_table_from_csv full_path, ENV['modelname']
  p "done, now go write your model!"
end