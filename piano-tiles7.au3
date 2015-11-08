#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.14.2
 Author:         myName

 Script Function:
	Template AutoIt script.

#ce ----------------------------------------------------------------------------
#include "AutoItConstants.au3"


; Script Start - Add your code below here
HotKeySet("{ESC}", "Terminate")
HotKeySet("!a", "musicLoop")
HotKeySet("!s", "setupButtons")


Global $point


MsgBox(0, "Starting Up", "Starting, first set up color locations.")

Func Terminate()
   Exit 1
EndFunc


Func setupButtons()
   MsgBox(0, "Setup", "Setup button A location.")
   $point = MouseGetPos()

EndFunc


Func musicLoop()
   MsgBox(0, "Music Loop", "Playing piano music")

   $i = 0
   $j = 0
   $wait = 150


   While 1
	  ;	find black button.
	  if PixelGetColor($point[0], $point[1]) == 1118481 then
		 ; button A
		 send("a")
		 ConsoleWrite ("a")
		 $i = $i + 1
	  ElseIf PixelGetColor($point[0]+100, $point[1]) == 1118481 then
		 ; button S
		 send("s")
		 ConsoleWrite ("s")
		 $i = $i + 1
	  ElseIf PixelGetColor($point[0]+200, $point[1]) == 1118481 then
		 ; button D
		 send("d")
		 ConsoleWrite ("d")
		 $i = $i + 1
	  ElseIf PixelGetColor($point[0]+300, $point[1]) == 1118481 then
		 ; button F
		 send("f")
		 ConsoleWrite ("f")
		 $i = $i + 1
	  EndIf


	  ; delay increment
	  if ($i = 9) then

		 if ( $wait  > 0 ) then
			$wait = $wait - 2
		 Else
			$wait = 1
		 EndIf
		 ConsoleWrite ('\n')
		 ConsoleWrite ($wait)
		 $i = 0
	  EndIf



	  ; delay
	  sleep($wait)


	  if PixelGetColor($point[0]+300, $point[1]) == 0xFB3E38 then
		 ; Reset
		 $i = 0
		 $j = 0
		 $wait = 150
		 MouseClick($MOUSE_CLICK_LEFT)

	  EndIf



   WEnd
EndFunc

While 1
   sleep(250)
WEnd