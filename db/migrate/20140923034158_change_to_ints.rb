class ChangeToInts < ActiveRecord::Migration
  def change
    change_table :projects do |t|
      t.change :averageqscore, 'integer USING CAST(averageqscore AS integer)'
      t.change :percent5xcoverage, 'integer USING CAST(percent5xcoverage AS integer)'
      t.change :percent10xcoverage, 'integer USING CAST(percent10xcoverage AS integer)'
      t.change :percent20xcoverage, 'integer USING CAST(percent20xcoverage AS integer)'
      t.change :percent30xcoverage, 'integer USING CAST(percent30xcoverage AS integer)'

    end
  end
end
