#Include <File.au3>
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#include <StaticConstants.au3>

Opt("TrayIconHide", 1)
Dim $lbl[40]
$turn = 0
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

For $ii = 1 To 3
   For $i = 1 to 10
	  $lbl[$i+($ii*10)-10] = GUICtrlCreateLabel($i+($ii*10)-10, ($ii*40)-36, ($i*15)-10,38,15,BitAND($SS_CENTER,$SS_BLACKFRAME))
   Next
Next

$delays = 0
While 1
   $msg = GUIGetMsg()
   If $msg = $GUI_EVENT_CLOSE Then ExitLoop
   if $delays > 10 then
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
	  GUICtrlSetData ($lbl[$turn], "Out")
	  GUICtrlSetColor($lbl[$turn], 0xff0000)
   ElseIf $var < 50 Then
	  GUICtrlSetData ($lbl[$turn], $var)
	  GUICtrlSetColor($lbl[$turn], 0x0055ff)
   ElseIf $var < 100 Then
	  GUICtrlSetData ($lbl[$turn], $var)
	  GUICtrlSetColor($lbl[$turn], 0x8800ff)
   ElseIf $var < 150 Then
	  GUICtrlSetData ($lbl[$turn], $var)
	  GUICtrlSetColor($lbl[$turn], 0x8800ff)
   ElseIf $var < 200 Then
	  GUICtrlSetData ($lbl[$turn], $var)
	  GUICtrlSetColor($lbl[$turn], 0xff0000)
   EndIf

   if $turn > 29 Then
	  $turn = 0
   EndIf
   GUICtrlSetData ($lbl[$turn+1], "")
   $turn = $turn+1
EndFunc

;~ 	if $log == 6 Then
;~ 		if $OutAlert < 8 Then
;~ 			FileWrite ($file,$color & "." & $var)
;~ 			FileWrite ($file,",")
;~ 		Elseif $OutAlert < 9 Then
;~ 			FileWrite ($file,"Disconnected")
;~ 			FileWrite ($file,",")
;~ 		EndIf
;~ 	EndIf
