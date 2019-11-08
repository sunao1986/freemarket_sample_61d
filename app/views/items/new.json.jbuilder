json.array! @children do |child|
  json.id child.id
  json.id child.name
  json.ancestry child.ancestry
end