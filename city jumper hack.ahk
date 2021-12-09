#SingleInstance, force
Gui, Add, Text, x12 y9 w270 h20 , city jumper hack lolw

Gui, Show, w304 h185, city jumper hack lolwuach

_grounded := false
while(true)
{
	_pixel := 0x000000
	
	SetMouseDelay, 0
	MouseGetPos, xpos, ypos 
	PixelGetColor, _pixel, %xpos%, %ypos%, RGB

	colors_buildings := [0xDC5742, 0xEFA57D, 0xF5BD4E, 0xA38D67, 0x99A867]
	colors_air := [0x85978D, 0x99AEA2, 0xCAE5D5, 0xC2E8D5, 0xB2C9BB, 0x9BAFA3]

	; Ground check
	for index, element in colors_building
	{
		if(_pixel == element)
			_grounded := true
	}
	
	; Jumping
	for index, element in colors_air
	{
		if(_pixel == element && _grounded)
		{
			MouseClick, Left
			_grounded := false
		}
	} 
}
return

GuiClose:
ExitApp