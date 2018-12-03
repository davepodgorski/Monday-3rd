def translate
  digits = ['1','2','3','4','5','6','7','8','9']
  en = ['one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine']
  fr = ['un','deux','trois','quatre','cinq','six','sept','huit','neuf']
output = {}
counter = 0
digits.each do |digits|
 output[digits] = {french: fr[counter], english: en[counter]}
counter += 1
end
return output

end

puts translate
