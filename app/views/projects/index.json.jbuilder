json.array!(@projects) do |project|
  json.extract! project, :id, :pi, :projectnumber, :sampleid, :totalreads, :averageqscore, :percent5xcoverage, :percent10xcoverage, :percent20xcoverage, :percent30xcoverage
  json.url project_url(project, format: :json)
end
