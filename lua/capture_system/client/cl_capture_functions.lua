CAPTURESYSTEMFUNCTIONS = CAPTURESYSTEMFUNCTIONS || {}

function CAPTURESYSTEMFUNCTIONS.RespX(x)
	return x / 1920 * ScrW()end
function CAPTURESYSTEMFUNCTIONS.RespY(y)
	return y / 1080 * ScrH()end

function CAPTURESYSTEMFUNCTIONS.LerpColor(colorA, colorB, fraction)
	return Color(Lerp(fraction, colorA.r, colorB.r), Lerp(fraction, colorA.g, colorB.g), Lerp(fraction, colorA.b, colorB.b), Lerp(fraction, colorA.a, colorB.a))
end

function CAPTURESYSTEMFUNCTIONS.BrightColor(color, brightness)
	return Color(math.Clamp(color.r + brightness, 0, 255), math.Clamp(color.g + brightness, 0, 255), math.Clamp(color.b + brightness, 0, 255))
end

function CAPTURESYSTEMFUNCTIONS.DrawCircle(x, y, radius, angle_start, angle_end, color)
	local poly = {}
	angle_start = angle_start or 0
	angle_end = angle_end or 360

	poly[1] = {
		x = x,
		y = y
	}
	for i = math.min(angle_start, angle_end), math.max(angle_start, angle_end) do
		local a = math.rad(i)
		if angle_start < 0 then
			poly[#poly + 1] = {
				x = x + math.cos(a) * radius,
				y = y + math.sin(a) * radius
			}
		else
			poly[#poly + 1] = {
				x = x - math.cos(a) * radius,
				y = y - math.sin(a) * radius
			}
		end
	end
	poly[#poly + 1] = {
		x = x,
		y = y
	}

	draw.NoTexture()
	surface.SetDrawColor(color or color_white)
	surface.DrawPoly(poly)

	return poly
end
