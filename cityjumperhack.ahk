#SingleInstance, force
Gui, Add, Text, x12 y12 w120 h30 , city jumper hack
Gui, Add, Edit, x122 y52 w100 h20 , 250
Gui, Add, Text, v_doubleJumpDelay x232 y52 w130 h20 , doppel sprung delay (ms)
Gui, Add, CheckBox, v_doubleJumpActivated x12 y52 w100 h20 , doppel sprung
Gui, Add, CheckBox, v_activated x12 y32 w100 h20 , hack aktiviert
Gui, Show, w479 h379, gaming hack

if _doubleJumpActivated
	SetTimer, ActivateDoubleJump, 60000

Loop:
_doubleJump := false
_grounded := false

while(_activated)
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
}
return

ActivateDoubleJump:
_doubleJump := true
SetTimer, ActivateDoubleJump, off
Goto, Loop

GuiClose:
ExitApp