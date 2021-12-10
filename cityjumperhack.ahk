#SingleInstance, force
Gui, Add, Text, x12 y12 w120 h30 , city jumper hack
Gui, Add, Edit, v_doubleJumpDelay x122 y52 w100 h20 , 250
Gui, Add, Text, x232 y52 w130 h20 , doppel sprung delay (ms)
Gui, Show, w479 h379, gaming hack

_doubleJump := false

Loop:
_grounded := false
while(true)
{
	OutputDebug, Activated
	_pixel := 0x000000
	
	SetMouseDelay, 0
	MouseGetPos, xpos, ypos
	PixelGetColor, _pixel, %xpos%, %ypos%, RGB

	colors_buildings := [0xDC5742, 0xEFA57D, 0xF5BD4E, 0xA38D67, 0x99A867]
	colors_air := [0x85978D, 0x99AEA2, 0xCAE5D5, 0xC2E8D5, 0xB2C9BB, 0x9BAFA3]

	; Ground check
	for index, element in colors_building
	{
		if _pixel == element
			_grounded := true
	}
	
	; Jumping
	for index, element in colors_air
	{
		if _pixel == element && _grounded 
		{
			MouseClick, Left

			; Double jump is needed for achieving scores over ~350
			if _doubleJump 
			{
				Sleep, _doubleJumpDelay
				MouseClick, Left
			}

			_grounded := false
		}
	}

	; Toggle double jump
	d::
	_doubleJump := !_doubleJump
	OutputDebug, %_doubleJump%
	Goto, Loop
}
return

GuiClose:
ExitApp