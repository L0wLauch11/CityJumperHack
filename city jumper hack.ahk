#SingleInstance, force
Gui, Add, Text, x12 y9 w270 h20 , city jumper hack lolw
; Generated using SmartGUI Creator for SciTE
Gui, Show, w304 h185, city jumper hack lolwuach

_grounded := false
while(true)
{
	_pixel := 0x000000
	
	SetMouseDelay, 0
	MouseGetPos, xpos, ypos 
	PixelGetColor, _pixel, %xpos%, %ypos%, RGB

	; Ground check
	if(_pixel == 0xDC5742 or _pixel == 0xEFA57D or _pixel == 0xF5BD4E or _pixel == 0xA38D67 or _pixel == 0x99A867)
		_grounded := true

	; Jumping
	if(_pixel == 0x85978D or _pixel == 0x99AEA2 or _pixel == 0xCAE5D5 or _pixel == 0xC2E8D5 or _pixel == 0xB2C9BB or _pixel == 0x9BAFA3)
	{
		if(_grounded)
		{
			MouseClick, Left
			_grounded := false
		}
	} 
}
return


GuiClose:
ExitApp