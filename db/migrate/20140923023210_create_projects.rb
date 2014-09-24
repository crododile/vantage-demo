class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :pi
      t.string :projectnumber
      t.string :sampleid
      t.string :totalreads
      t.string :averageqscore
      t.string :percent5xcoverage
      t.string :percent10xcoverage
      t.string :percent20xcoverage
      t.string :percent30xcoverage

      t.timestamps
    end
  end
end
