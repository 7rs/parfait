MoreMaths = {
}

function MoreMaths.DecodeDecToFloat(input)
	if input == nil or input == "" then
        return 0
    end
    return string.unpack("f",string.pack("i8",input))
end

function MoreMaths.Round(num, numDecimalPlaces)
  local mult = 10^(numDecimalPlaces or 0)
  return math.floor(num * mult + 0.5) / mult
end

function MoreMaths.Remap(value, from1, to1, from2, to2)
    return (value - from1) / (to1 - from1) * (to2 - from2) + from2
end