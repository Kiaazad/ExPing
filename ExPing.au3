#Include <File.au3>
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
Opt("TrayIconHide", 1)
;~ $log = MsgBox(4,"ExPing","Do you want log you ping?")
;~ if $log == 6 Then
;~ $ISP = InputBox("ExPing","Insert your ISP name.				Press cancel to exit","Unknown")
;~ if @Error =1 Then Exit
;~ $count = InputBox("ExPing","Insert your country name.				Press cancel to exit","Unknown")
;~ if @Error =1 Then Exit
;~ $city = InputBox("ExPing","Insert your city name.				Press cancel to exit","Wnknown")
;~ if @Error =1 Then Exit
;~ EndIf
$Ping = InputBox("ExPing","Insert the IP Or Address to ping, Press cancel to exit","4.2.2.4")
if @Error =1 Then Exit
;~ $y=-10
;~ $x=5
;~ $OutAlert = 0
;~ $ctrl = 0
;~ $color = ""
;~ if $log ==6 Then
;~ $file = FileOpen("PingLog.txt", 1)
;~ FileWriteLine ($file,"")
;~ FileWriteLine ($file,"Ping log from : [" & $ISP & "] ISP Located in : [" & $count & "] city : [" & $city & "] - for [" & $Ping & "]")
;~ FileWriteLine ($file,"Logged by [ExPing 0.2.2] G B P O Out Disconnected")
;~ EndIf
GUICreate("ExPing",95,250,200,200,$WS_SYSMENU)
GUISetState(@SW_SHOW)
$p1 = GUICtrlCreateLabel(100, 10, 10)


$delays = 0
While 1
   $msg = GUIGetMsg()
   If $msg = $GUI_EVENT_CLOSE Then ExitLoop
   if $delays > 50 then
	  pingit()
	  $delays = 0
   EndIf
   sleep(10)
   $delays += 1
WEnd
GUIDelete()

Func pingit()
   $var = ping($Ping)
   if $var == 0 Then
	  GUICtrlSetData ($p1, "Out")
	  GUICtrlSetColor($p1, 0xff0000)
   ElseIf $var < 50 Then
	  GUICtrlSetData ($p1, $var)
	  GUICtrlSetColor($p1, 0x0055ff)
   ElseIf $var < 100 Then
	  GUICtrlSetData ($p1, $var)
	  GUICtrlSetColor($p1, 0x8800ff)
   ElseIf $var < 150 Then
	  GUICtrlSetData ($p1, $var)
	  GUICtrlSetColor($p1, 0x8800ff)
   ElseIf $var < 200 Then
	  GUICtrlSetData ($p1, $var)
	  GUICtrlSetColor($p1, 0xff0000)
   EndIf
EndFunc
;~ 	if ($var == 0) then
;~ 		$var = "Out"
;~ 		$y = $y+15
;~ 		GUICtrlCreateLabel($var, $x, $y)
;~ 		GUICtrlSetColor(-1, 0xff0000)
;~ 		$color = ""
;~ 		$OutAlert=$OutAlert+1
;~ 		if $OutAlert > 3 Then
;~ 			if $OutAlert < 8 Then
;~ 				Beep(900, 100)
;~ 				sleep(20)
;~ 				Beep(900, 100)
;~ 				sleep(20)
;~ 				Beep(900, 100)
;~ 			Elseif $OutAlert < 9 Then
;~ 				Beep(500, 500)
;~ 			EndIf
;~ 		EndIf
;~ 		$ctrl = $ctrl+1
;~ 	else
;~ 		if $OutAlert > 9 Then
;~ 			Beep(500, 500)
;~ 			sleep(20)
;~ 			Beep(900, 100)
;~ 		EndIf
;~
;~ 		$y = $y+15
;~ 		$OutAlert=0
;~ 		GUICtrlCreateLabel($var, $x, $y)
;~ 		GUICtrlSetColor(-1, 0x009900)
;~ 		$color = "G"
;~ 		if $var > 200 Then
;~ 			GUICtrlSetColor(-1, 0x0055ff)
;~ 			$color = "B"
;~ 		EndIf
;~ 		if $var > 400 Then
;~ 			GUICtrlSetColor(-1, 0x8800ff)
;~ 			$color = "P"
;~ 		EndIf
;~ 		if $var > 800 Then
;~ 			GUICtrlSetColor(-1, 0xff9900)
;~ 			$color = "O"
;~ 		EndIf
;~ 		$ctrl = $ctrl+1
;~ 	EndIf
;~
;~ 	if $ctrl > 41 Then
;~ 		$toDel = $ctrl-39
;~ 		GUICtrlDelete($toDel)
;~ 		if $ctrl > 82 Then
;~ 			$ctrl = 41
;~ 		EndIf
;~ 	EndIf
;~
;~ 	if $y > 195 Then
;~ 		$x=$x+37
;~ 		$y=-10
;~ 	EndIf
;~
;~ 	if $x > 79 Then
;~ 		$x =5
;~ 	EndIf
;~
;~ 	if $log == 6 Then
;~ 		if $OutAlert < 8 Then
;~ 			FileWrite ($file,$color & "." & $var)
;~ 			FileWrite ($file,",")
;~ 		Elseif $OutAlert < 9 Then
;~ 			FileWrite ($file,"Disconnected")
;~ 			FileWrite ($file,",")
;~ 		EndIf
;~ 	EndIf
