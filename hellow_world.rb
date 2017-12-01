
words = "henderson hood is my name born in the island of Barbados"

1.times  do
  pat = words.scan(/i/)
  p pat
end
