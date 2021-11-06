words = {"Uno ", "Dos ", "Tres ", "Cuatro ", "Cinco ", "Seis ", "Siete ", "Ocho ", "Nueve "}
levels = {"MIL ", "MILLONES ", "MIL MILLONES ", "TRILLÓN ", "cuatrillón ", "quintillones ", "SEXTILLION ", "SEPTILLION ", "OCTILLION ", [0] = ""}
iwords = {"Diez ", "Veinte ", "Treinta ", "Cuarenta ", "Cincuenta ", "Sesenta ", "Setenta ", "Ochenta ", "Noventa "}
twords = {"Once ", "Doce ", "Trece ", "Catorce ", "Quince ", "Dieciseis", "diecisiete ", "Dieciocho ", "Diecinueve "}

function digits(n)
  local i, ret = -1
  return function()
    i, ret = i + 1, n % 10
    if n > 0 then
      n = math.floor(n / 10)
      return i, ret
    end
  end
end

level = false
function getname(pos, dig)
  level = level or pos % 3 == 0
  if(dig == 0) then return "" end
  local name = (pos % 3 == 1 and iwords[dig] or words[dig]) .. (pos % 3 == 2 and "HUNDRED " or "")
  if(level) then name, level = name .. levels[math.floor(pos / 3)], false end
  return name
end

function numberToWord(number)
    if(number == 0) then return "Cero" end
    vword = ""
    for i, v in digits(number) do
      vword = getname(i, v) .. vword
    end

    for i, v in ipairs(words) do
      vword = vword:gsub("TY " .. v, "TY-" .. v)
      vword = vword:gsub("Diez " .. v, twords[i])
    end
    return vword
end

function conky_Hour()
    return numberToWord(os.date("%I") + 0)
end

function conky_Minute()
    return numberToWord(os.date("%M") + 0)
end

function conky_Date()
    return numberToWord(os.date("%d") + 0)
end
