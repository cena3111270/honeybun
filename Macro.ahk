﻿; huge thanks to:
; raynnpjl for contributing the card selector
; yuh for heavily inspiring  the macro + some functions

#Requires AutoHotkey v2.0
#Include %A_ScriptDir%\Lib\gui.ahk
#Include %A_ScriptDir%\Lib\FindText.ahk
#Include %A_ScriptDir%\Lib\imageForCS.ahk
#Include %A_ScriptDir%\Lib\OCR-main\Lib\OCR.ahk
#Include %A_ScriptDir%\Lib\WebhookOptions.ahk
#Include %A_ScriptDir%\Lib\keybinds.ahk
#Include %A_ScriptDir%\Lib\IsProcessElevated.ahk

global MacroStartTime := A_TickCount
global StageStartTime := A_TickCount

SendMode "Event"
RobloxWindow := "ahk_exe RobloxPlayerBeta.exe"
UnitExistence:="|<>*91$20.3ks0s60w0sD6C3nXUsssCCC3XXUwMsD0C3s7Uz3sDzy0zz0DzUbzwM"
MaxUpgrade :=
    "|<TopMax>*91$30.zzzzzzDzzzy9yD7wMwD7wsMC3ws8C3ws0AHst2AFsta81wty80wty1wwtyNwwzzzzyDzzzzDzzzU"

MaxUpgrade2:="|<>*92$43.7zlzzzzVzkzzzzkTkTzzzs7kDzzzw3s7zzzy0s3k1Xl081k0kk10Mk0M0EUAMQC0MMCAS7UQCD6D3kC7jX3Vs33zlU0s0Vzss0MM0zwS0AS4zyDX7Ta"

MaxUpgrade3 := "|<>*91$49.Dk7s00004M3600006633000031X1U0001UP0nzr3kkD0PzynAM3UD06D3A0U70331a00301U1X20VVUs1lVUklsS1kkssMwD0kMSQAC70AA/u603036413U1UUn20Vs0ksNX0My4NqMTUDnzzlwU"
VoteStart := "|<>*95$38.ryzzzzlz7zlzwDVzwTzXszz7zsSC30Q7770E40klU410C8sklVXUACAM0w7X360T1s1kEbsz0Q40zDsTVUM"
LobbyText := "|<>*134$56.0000000000k00U10000T00y1w000Cs0RkvU003606AAM000lU1X36000AMzMwlswS36zyDwTzjslw7WD4ST6AS0M1k33lX7060A0MMPlkkVX366DwQS8sFkk3z772C4QC1zlkkV327UTw40M0k1wDz1UC0Q0z3zsQ7WD4TkzzzzzzzzwTzzzzzzzy7zzzzzzzzXzzzzzzzzszs"
AreasText := "|<>*108$36.zs007zyzztzzwTzzzzwTzTzzsA4613tA421/k4M0F3k4M4FXXUQ603bmy713zzzzzzU"
MatchmakeUI := "|<>*129$83.zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzUzzzzzzzzzzzzz0zzzzzzzw7zzzw1zzzzzzzkDzzzs3zzzzzzzUTzzzs7zzzzzzz0zzzzkTzzzzzzy1zzzzzzzzzzzzw3zzzzzzzzzzzzs7zzzzzzzzzzzzkDy0Tw7UsDzzzzUTk0Ds7007zzzz0z00DUA007zzzy1w00D0M007zzzw3k00S0k00Dzzzs7U00Q1U00DzzzkC0S0s3060TzzzUQ1y0k60y0zzzz0s7w1UA1y1zzzy1kDs30M3w3zzzw3UTk60k7s7zy7k70TUA1UDkDzs70C0Q0s30TUTzk00S001k60z0zzU01w007UA1y1zz007w00D0M3w3zz00Dw00y0k7s7zz01zw03y1kDkDzzU7zy0Tw7UzkTzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzs"
CaptchaExistence := "|<>*100$131.zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzwDzzzzzzzs3zzzzzzzzzzzkDzzzzzzz01zzzzzzy7zzzUTzzzzzzs00zzzzzzs7zzz0zzzzzzzU01zzzzzzkDzzy1zzzzzzy003zzzzzzUTzzw3zzzzzzs007zzzzzz0zzzs7zzzzzzk7wTzzzzzy1zyTkDzzzzzz0Tzz0UsEDk0DU7UEDz0Uzy1zzw01U0DU0S0300Dw01zw3zzk0300C00s0600Dk03zsDzz00600C01U0A00T007zkTzw00A00A0200M00Q00DzUzzs30M3US1w1lk70s30Tz0zzkD0kDUw3s7zUT1kD0zy1zzUz1UT1s7kTz0y3Uz1zw1zz1w30y3kDUzy1w31w3zw1zC1s61s7UT0zw3s61s7zs0sA00A00D0y0Es7kA00Dzs00A00M00y0C00kDUQ00Tzs00M00k01y0A01UT0s00zzs00s01U07w0Q030y3s01zzs03s0300zw1w0C1w7s03zzw0TwCC1rzy3y1y7wDwCDzzzzzzzw3zzzzzzzzzzzzzzzzzzzzs7zzzzzzzzzzzzzzzzzzzzkDzzzzzzzzzzzzzzzzzzzzUTzzzzzzzzzzzzzzzzzzzz0zzzzzzzzzzzzzzzzzzzzy3zzzzzzzzzzzzzzzzzzzzy7zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzU"
Matchmaking := "|<>*93$73.zzzzzzzzzzzzzzlzzzsszzzzk08zzzwATzzzs04Tzzy6Dzzzw03zzzz3zzzzy7zzzzzVzzzzz3zX4DwElW7w8U7lU3s0Mk1w0E1sk0w0AM0Q080wM0A06A06040SAC6736737W7z6D37VX3VXl3zX7VVklXkkkVzlXkk0MlsM0EzslsQ0AMwC08zwMwC06AS7U4TyATDlb6DbxXzzzzzzzzzzzlzzzzzzzzzzs0zzzzzzzzzzw0zzzzzzzzzzy0zzzzzzzzzzzty"
AutoAbility := "|<>*83$21.zzzzzzzwD4S0kXl28wS03Xk0QSH7nWMy0n7sCQzzzzU"
ClaimText := "|<>*127$71.00000000000000A7s01y000007zTs07w00000Tzlk0AQ00003k7VU0MM0000D03300kk0000Q0667zXzsw01k0AAzzzzzy031ysTrjTSyS0C7zky0AA0EQ0QCTVs0MM00Q0ss73U0kk00M1lkC711VVUUk3VnwC73333VU73zsQS666737y3tksQAAAC7zy01Uk0MMMQDzy030k0kkksTzy061U1VVVkzzz0y3kX77XXzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz"
LoadingScreen := "|<>*98$87.zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzwTzzzzzzzzzzzzX3zszzzzzszXzzsMTz7zzzzz7wDzz3XzszzzzzszVzzsTzz7zzzzz7wDkz3bwMz3szbszXs1sQS07U73sT7wS07XXU0w0QT7s03UkQQMA7b3Vkz00QD3XX3kzwCCDs03XwQQMz7s1llz7wQTXXX7sw0C4TszXXwQQMz73VsXz7wQD3XX3kswD0TszXk0wQQ0731w7z7wT0DXXU0s0DUzszXw3wQT17UFyDzzzzzzzzzzzzzlzzzzzzzzzzzzzgTw"
P := "|<>*88$35.3zzzy0Tzzzy0zzzzy3zzzzw7zzzzsTzzzzszzzzzlzzzzzXzw1zz7zs1zyDzk1zwTzV3zszz73zlzyC7zXzwQTz7zs0zyDzk3zwTzVzzszz7zzlzyDzzXzwTzz7zzzzyDzzzzwTzzzzszzzzzkzzzzzVzzzzy1zzzzw3zzzzk3zzzz00zzzs0000000000004"
P2 := "|<>*102$165.1zzzs000Dzzz0003zzzk000zzzw0zzzzk007zzzy001zzzzU00TzzzsDzzzz001zzzzs00Tzzzy007zzzzXzzzzw00TzzzzU07zzzzs01zzzzyTzzzzU03zzzzw00zzzzz00Dzzzzrzzzzy00zzzzzk0Dzzzzw03zzzzzzzzzzk07zw3zy01zzzzzU0Tzzzzzzzzzy00zy07zk0Dzzzzw03zlyDzzzzzzk07zU0Ty01zzzzzU0Ts30Tzzzzzy00zs01zk0Dzzzzw03y001zzz0zzk07y0k7y01zzzzzU0TU007zzvzzy00zU60Tk0Dzzzzw03w000zzzTzzk07w003y01zzzzTU0TU007zzvzzy00z000Dk0Dzzzzw03w000zzzzzzk07s0k1y01zzzzzU0TU007zzzzzy00z060Dk0Dzzzzw03y001zzzzzzk07s0k1y01zzzzzU0Tk00Dzzzzzy00z060Dk0Dzzzzw03z003zzzzzzk07s0k1y01zzzzzU0Tw00zzzzzzy00zU60Tk0Dzzzzw03zk0Dzzzzzzk07w0k3y01zzzzzU0Tz03zzzzzzy00zk60zk0Dzzzzw03zw0zzzzzzzk07z00Dy01zzzzzU0TzkDzzzzzzy00zw03zk0Dzzzzw03zzbzzzzzzzk07zk0zy01zzzzzU0Tzzzzzzzzzy00zzkzzk0Dzzzzw03zzzzzzzzzzk07zzzzy01zzzzzU0Tzzzzvzzzzw00TzzzzU07zzzzs01zzzzyTzzzzU03zzzzw00zzzzz00Dzzzzlzzzzs00Dzzzz003zzzzk00zzzzw7zzzy000zzzzk00Dzzzw003zzzz0Dzzz0001zzzs000Tzzy0007zzzUU"
Text:="|<>*124$85.zzyTzzzzzzzzbykDzDzznwQszzny87zbzzlyAATztz4rvnvzsza6SzwzWDkNkQ07l2A60S10k4k403s0411C0s1WFUP7y04MbbAT0382DXz32AHn61WTaTUtzVVW9tk430l0kADslkAwM33kMkQD7wwwCSC1"
DailyRewardTimeText:="|<>*128$140.zvzzzzzzqzzzvM1zzzzzzrzk2zzzrbzRjkTym0MDzzzztzzbzzzxtzbvw3zwva1zzzzyTztv2QTSEsKzQsPPhiMqq6665ySk2HrY65jrg6qHNY551V1bPbhYYxvRrPhv9hUW390KNmMyxvN9zCrRqvAmPA8YnsBawa7jSqGLsBrBakQ6l4/Y6H1h1VPzzztzDzvRgBZgt2vXzzPMMqzzzzzzzzzly7ywUvjzvzVxzDzzzzzzz0000018000000003zzzzzzz000000Q000000000zzzzzzzU000000000000000DzzzzzzU0000000000000003zzzzzzU0000000000000000zzzzzzU0000000000000000DzzzzzU00000000000000002"
TradeText:="|<>*119$51.zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz0DzzDzzzs1zztzzzztzzzDzzzzC4211zzztUUE8DzzzAMUE0zzztX420TzzzAQ211zzztrksADzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzw"
DeathText := "|<>*100$22.zzzzUzUw3w3l7l6ASAMtstXbXaASAQFgFkAEDUlUzzzzU"
AbilityOFF := "|<>*83$21.zzzzzzzwD4S0kXl28wS03Xk0QSH7nWMy0n7sCQzzzzU"
AbilityOFF2 := "|<>**50$21.7tznXsWM7AKQnbnk0SqE3rmRqQngM6RXVvgDvzY"
InChamber:="|<>*125$85.zzyTzzzzzzzzbykDzDzznwQszzny87zbzzlyAQTztz4rvnvzsza6SzwzWDkNkQ07l2A60S10kAkA03s0411C0s1WFUP7y04MbbAT0382DXz32CHn61WTaTUtzVVW9tk430l0kADslkAwM33kMkQD7wwwCSC1"
WaveText:="|<>*122$56.XsyDzzzzzkwDVzzzzzy71kzzzzzzVkQDzzzzzsM73l6DnkD20Vk03sM0kU8M08S40A0U602733XU83Vkkkkss20swA8Q0C1kS63UD07kQ7U0w3kzwD1s0D1w0DXsz03sTU3tyDwFyDw1U"

searchX1 := 701 - 100  ; Left boundary
searchY1 := 189 - 100  ; Top boundary
searchX2 := 701 + 100  ; Right boundary
searchY2 := 189 + 100  ; Bottom boundary

dailyRewardSearchX1 := 640 - 200  ; Left boundary
dailyRewardSearchY1 := 46 - 200   ; Top boundary
dailyRewardSearchX2 := 640 + 200  ; Right boundary
dailyRewardSearchY2 := 46 + 200   ; Bottom boundary

searchAreaX1 := 34 - 50  ; Left boundary
searchAreaY1 := 364 - 50  ; Top boundary
searchAreaX2 := 34 + 50  ; Right boundary
searchAreaY2 := 364 + 50  ; Bottom boundary

global cardPickerEnabled := 1

         AddToLog("READ PLEASE. this was rushed F4 to pause. Bugs = Dm Mejt_t with screenshot/video")

SetupMacro() {
    if ControlGetVisible(keybindsGui) {
        return
    }
    if WinExist(RobloxWindow) {
        WinActivate(RobloxWindow)
        Sleep 50
        WinMove(27, 15, 800, 600, RobloxWindow)
        Sleep 50
    }
    if WinExist("Taxi Winter Event Farm") {
        Sleep 50
        WinActivate("Taxi Winter Event Farm")
        Sleep 100
    }

}

InitializeMacro() {
    if ControlGetVisible(keybindsGui) {
        return
    }
    global MacroStartTime := A_TickCount

    if WinExist("Taxi Auto-Challenge") {
        WinActivate("Taxi Auto-Challenge")
    }

    if WinExist(RobloxWindow) {
        WinMove(27, 15, 800, 600, RobloxWindow)
        WinActivate(RobloxWindow)
        Sleep 100
    }
    
    else {
        MsgBox("You must have ROBLOX open in order to start the macro (microsoft roblox doesnt work)", "Error T4", "+0x1000",)
        return
    }


    if (ok := FindText(&X, &Y, 746, 476, 862, 569, 0, 0, AreasText)) {     

    
        GoToRaids()
    }
    else {
        MsgBox("You must be in the lobby with default camera angle to start the macro.", "Error T3", "+0x1000",)
        return
    }

}

searchX1 := 701 - 100  ; Left boundary
searchY1 := 189 - 100  ; Top boundary
searchX2 := 701 + 100  ; Right boundary
searchY2 := 189 + 100  ; Bottom boundary

SetDefaultKeyboard(localeID) {
    static SPI_SETDEFAULTINPUTLANG := 0x005A, SPIF_SENDWININICHANGE := 2
    Lan := DllCall("LoadKeyboardLayout", "Str", Format("{:08x}", LocaleID), "Int", 0)
    binaryLocaleID := Buffer(4, 0)
    NumPut("UInt", LocaleID, binaryLocaleID)
    DllCall("SystemParametersInfo", "UInt", SPI_SETDEFAULTINPUTLANG, "UInt", 0, "Ptr", binaryLocaleID, "UInt", SPIF_SENDWININICHANGE)
    for hwnd in WinGetList()
        PostMessage 0x50, 0, Lan, , hwnd
}

BetterClick(x, y, LR := "Left") { ; credits to yuh for this, lowk a life saver
    MouseMove(x, y)
    MouseMove(1, 0, , "R")
    MouseClick(LR, -1, 0, , , , "R")
    Sleep(50)
}

ScrollDown(power) {
    Loop power {
        SendInput("{WheelDown}")
        Sleep 100 ; Optional delay between scrolls
    }
}

ImageSearchFullScreen(PlayImage, sizeVariation := 50, colorVariation := 30) {
    ; Check if the image file exists
    if !FileExist(PlayImage) {
        MsgBox("Error: Image file not found at path: " . PlayImage)
        return false  ; Return false if image is missing
    }

    ; Set coordinate mode to screen coordinates (default) for full-screen search
    CoordMode("Pixel", "Screen")

    ; Perform the image search across the entire screen
    FoundX  := 0
    FoundY  := 0
    options := "*" . sizeVariation . "*n" . colorVariation . " "  ; Combine options
    result  := ImageSearch(&FoundX, &FoundY, 0, 0, A_ScreenWidth, A_ScreenHeight, options . PlayImage)

    ; Check if the image was found
    if result {  ; true means image was found
        return [true, FoundX, FoundY]  ; Return true and coordinates as an array
    } else {  ; false means image was not found
        return false
    }
}

TimerFinished := false

F4::Pause -1

global sleepTimer := PlacementSpeedDDL.Value		
global turnOffChatEnabled2 := TurnoffChat2.Value	
  
GoToRaids() {

    SendInput ("{Tab}")

   sleep 2000
BetterClick(33, 294)
sleep 2000
BetterClick(432, 223)
sleep 2000
BetterClick(468, 190)
sleep 2000
Send("eclipse")
sleep 2000
BetterClick(214, 291)
sleep 2000
BetterClick(350, 390)
sleep 2000
BetterClick(400, 348)
sleep 13500
BetterClick(404, 461)
sleep 2000
              
    LoadedLoop()
    StartedLoop()
    OnSpawnSetup()
    TryPlacingUnits()
}

TimerLog() {
    global TimerFinished  ; Access global variable

   
    TimerFinished := true
    AddToLog("DONE")

    SetTimer(TimerLog, 0)
}

StopMacro() {
    if ControlGetVisible(keybindsGui) {
        return
    }
    Reload()
}
; Define the rectangle coordinates
global startX := 100, startY := 500, endX := 700, endY := 350
global startY2 := 200, endY2 := 350
global step := 50 ; Step size for grid traversal
global successfulCoordinates := [] ; Array to store successful placements
global successThreshold := 3 ; Number of successful placements needed

PlaceUnit(x, y, slot := 1) {
    SendInput(slot)
    Sleep 50
    BetterClick(x, y)
    Sleep 50
    SendInput("q")

    ; Check if placement is successful
    if IsPlacementSuccessful() {
        Sleep 15
        return true
    }
    return false
}

IsPlacementSuccessful() {
    
    switch sleepTimer {
        case 1: Sleep 1000
        case 2: Sleep 1500
        case 3: Sleep 2000
        case 4: Sleep 2500
        case 5: Sleep 3000
        case 6: Sleep 4000    
    }
    loop 2 {
if (ok:=FindText(&X, &Y, 287-150000, 257-150000, 287+150000, 257+150000, 0, 0, UnitExistence)) {
  AddToLog("Placed unit successfully!")
            Sleep 100
            if (turnOffChatEnabled2 and ok := FindText(&X, &Y, 367, 262, 445, 302, 0, 0, AbilityOFF)) {
                AddToLog("Ability found. Toggling ON")
                BetterClick(373, 237)
            }
            BetterClick(329, 184) ; close upg menu
            return true
}
    }
    return false
}

Numpad5:: {
    SendWebhook()
}

#Requires AutoHotkey v2.0

#Include %A_ScriptDir%\Lib\Gdip_All.ahk

GetWindowCenter(WinTitle) {
    x := 0 y := 0 Width := 0 Height := 0
    WinGetPos(&X, &Y, &Width, &Height, WinTitle)

    centerX := X + (Width / 2)
    centerY := Y + (Height / 2)

    return { x: centerX, y: centerY, width: Width, height: Height }
}

rect1 := { x: 37, y: 45, width: 254, height: 69 }
rect2 := { x: 591, y: 45, width: 243, height: 47 }
rect3 := { x: 36, y: 594, width: 105, height: 51 }

isInsideRect(rect, x, y) {
    return (x >= rect.x and x <= rect.x + rect.width and y >= rect.y and y <= rect.y + rect.height)
}

;By @keirahela
;Modified by @Haie (smaller steps, centered start)
SpiralPlacement(gridPlacement := false) {
    global startX, startY, endX, endY, step, successfulCoordinates, maxedCoordinates
    successfulCoordinates := [] ; Reset successfulCoordinates for each run
    maxedCoordinates := []
    savedPlacements := Map()

    centerX := GetWindowCenter(RobloxWindow).x - 30
    centerY := GetWindowCenter(RobloxWindow).y - 30
    radius := step
    direction := [[1, 0], [0, 1], [-1, 0], [0, -1]]
    dirIndex := 0
    directionCount := 0

    ; Iterate through all slots (1 to 6)
    for slotNum in [1, 2, 3, 4, 5, 6] {
        enabled := "Enabled" slotNum
        enabled := %enabled%
        enabled := enabled.Value
        placements := "Placement" slotNum
        placements := %placements%
        placements := placements.Text

        ; Skip if the slot is not enabled
        if !(enabled = 1) {
            continue
        }

        AddToLog("Starting placements for Slot " slotNum " with " placements " placements.")

        placementCount := 0
        currentX := centerX
        currentY := centerY
        steps := 30
        maxSteps := 5

        while (placementCount < placements) {
            for index, stepSize in [steps] {

                if PlaceUnit(currentX, currentY, slotNum) {
                    placementCount++
                    successfulCoordinates.Push({ x: currentX, y: currentY, slot: "slot_" slotNum }) ; Track successful placements
					
					try {
                        if savedPlacements.Get("slot_" slotNum) {
                            savedPlacements.Set("slot_" slotNum, savedPlacements.Get("slot_" slotNum) + 1)
                        }
                    } catch {
                        savedPlacements.Set("slot_" slotNum, 1)
                    }

                    if placementCount >= placements {
                        break
                    }
		
                    if (gridPlacement) {
                        PlaceInGrid(currentX, currentY, slotNum, &placementCount, &successfulCoordinates, &
                            savedPlacements, &placements)
                    }

                }
                
                BetterClick(348, 391) ; next
                BetterClick(565, 563) ; move mouse
                if ShouldStopUpgrading(1) {
                    AddToLog("Stopping due to finding lobby  condition.")
                    return LobbyLoop()
                }
                Reconnect()

                currentX += direction[dirIndex + 1][1] * steps
                currentY += direction[dirIndex + 1][2] * steps

                currentX += Random(-15, 15)
                currentY += Random(-15, 15)

                if isInsideRect(rect1, currentX, currentY) or isInsideRect(rect2, currentX, currentY) or isInsideRect(
                    rect3, currentX, currentY) {
                    steps := 30
                    currentX := centerX
                    currentY := centerY
                }

                if currentX > 635 or currentY > 520 or currentX <= 190 or currentY < 150 {
                    steps := 30
                    currentX := centerX
                    currentY := centerY
                }
            }

            directionCount++

            if directionCount == 2 {
                steps += 30
                directionCount := 0
            }

            dirIndex := Mod(dirIndex + 1, 4)
            if ShouldStopUpgrading(1) {
                AddToLog("Stopping due to lobby condition.")
                return LobbyLoop()
            }
        }

        AddToLog("Completed " placementCount " placements for Slot " slotNum ".")
    }

    UpgradeUnits()

    AddToLog("All slot placements and upgrades completed.")
}

; The OG placement by @Original author of macro
LinePlacement() {
    global startX, startY, endX, endY, step, successfulCoordinates, maxedCoordinates
    successfulCoordinates := [] ; Reset successfulCoordinates for each run
    maxedCoordinates := []

    x := startX ; Initialize x only once
    y := startY ; Initialize y only once
    y2 := startY2 ; Initialize y2 only once

    ; Iterate through all slots (1 to 6)
    for slotNum in [1, 2, 3, 4, 5, 6] {
        enabled := "Enabled" slotNum
        enabled := %enabled%
        enabled := enabled.Value
        placements := "Placement" slotNum
        placements := %placements%
        placements := placements.Text

        ; Skip if the slot is not enabled
        if !(enabled = 1) {
            continue
        }

        AddToLog("Starting placements for Slot " slotNum " with " placements " placements.")

        placementCount := 0
        alternatingPlacement := 0

        ; Continue placement for the current slot
        while (placementCount < placements && y >= endY && y2 <= endY2) { ; Rows
            while (placementCount < placements && x <= endX) { ; Columns
                if (alternatingPlacement == 0) {
                    if PlaceUnit(x, y2, slotNum) {
                        placementCount++
                        successfulCoordinates.Push({ x: x, y: y2, slot: "slot_" slotNum }) ; Track successful placements
                    }
                }
                if (alternatingPlacement == 1) {
                    if PlaceUnit(x, y, slotNum) {
                        placementCount++
                        successfulCoordinates.Push({ x: x, y: y, slot: "slot_" slotNum }) ; Track successful placements
                    }
                }
                BetterClick(348, 391) ; next
                BetterClick(565, 563) ; move mouse
                if ShouldStopUpgrading(1) {
                    AddToLog("Stopping due to finding lobby  condition.")
                    return LobbyLoop()
                }
                Reconnect()
                x += step - 20 ; Move to the next column
            }
            if x > endX {
                x := startX ; Reset x for the next row
                if (Mod(alternatingPlacement, 2) == 0) {
                    y2 += (step + 25) ; Move to the next row, upwards
                    alternatingPlacement += 1
                }
                else {
                    y -= (step + 25) ; Move to the next row, downwards
                    alternatingPlacement -= 1
                }
            }
            Reconnect()
        }

        AddToLog("Completed " placementCount " placements for Slot " slotNum ".")
        Reconnect()
    }

    UpgradeUnits()

    AddToLog("All slot placements and upgrades completed.")
}

; Modified version of LinePlaceMent, placing in a 2x2 grid when a unit is placed,then goes back to line placing
; By @Durrenth
LinePlacementGrid() {
    global startX, startY, endX, endY, step, successfulCoordinates, maxedCoordinates
    successfulCoordinates := [] ; Reset successfulCoordinates for each run
    maxedCoordinates := []
    savedPlacements := Map()

    x := startX ; Initialize x only once
    y := startY ; Initialize y only once
    y2 := startY2 ; Initialize y2 only once

    ; Iterate through all slots (1 to 6)
    for slotNum in [1, 2, 3, 4, 5, 6] {
        enabled := "Enabled" slotNum
        enabled := %enabled%
        enabled := enabled.Value
        placements := "Placement" slotNum
        placements := %placements%
        placements := placements.Text

        ; Skip if the slot is not enabled
        if !(enabled = 1) {
            continue
        }

        AddToLog("Starting placements for Slot " slotNum " with " placements " placements.")

        placementCount := 0
        alternatingPlacement := 0

        ; Continue placement for the current slot
        while (placementCount < placements && y >= endY && y2 <= endY2) { ; Rows
            while (placementCount < placements && x <= endX) { ; Columns
                if (alternatingPlacement == 0) {

                    if PlaceUnit(x, y2, slotNum) {
                        placementCount++
                        successfulCoordinates.Push({ x: x, y: y2, slot: "slot_" slotNum }) ; Track successful placements

                        try {
                            if savedPlacements.Get("slot_" slotNum) {
                                savedPlacements.Set("slot_" slotNum, savedPlacements.Get("slot_" slotNum) + 1)
                            }
                        } catch {
                            savedPlacements.Set("slot_" slotNum, 1)
                        }

                        if placementCount >= placements {
                            break
                        }

                        PlaceInGrid(x, y2, slotNum, &placementCount, &successfulCoordinates, &savedPlacements, &
                            placements)
                    }

                }

                if (alternatingPlacement == 1) {
                    if PlaceUnit(x, y, slotNum) {
                        placementCount++
                        successfulCoordinates.Push({ x: x, y: y, slot: "slot_" slotNum }) ; Track successful placements

                        try {
                            if savedPlacements.Get("slot_" slotNum) {
                                savedPlacements.Set("slot_" slotNum, savedPlacements.Get("slot_" slotNum) + 1)
                            }
                        } catch {
                            savedPlacements.Set("slot_" slotNum, 1)
                        }

                        if placementCount >= placements {
                            break
                        }

                        PlaceInGrid(x, y2, slotNum, &placementCount, &successfulCoordinates, &savedPlacements, &
                            placements)

                    }
                }
                BetterClick(348, 391) ; next
                BetterClick(565, 563) ; move mouse
                if ShouldStopUpgrading(1) {
                    AddToLog("Stopping due to finding lobby  condition.")
                    return LobbyLoop()
                }
                Reconnect()
                x += step - 20 ; Move to the next column
            }
            if x > endX {
                x := startX ; Reset x for the next row
                if (Mod(alternatingPlacement, 2) == 0) {
                    y2 += (step + 25) ; Move to the next row, upwards
                    alternatingPlacement += 1
                }
                else {
                    y -= (step + 25) ; Move to the next row, downwards
                    alternatingPlacement -= 1
                }
            }
            Reconnect()
        }

        AddToLog("Completed " placementCount " placements for Slot " slotNum ".")
        Reconnect()
    }

    UpgradeUnits()

    AddToLog("All slot placements and upgrades completed.")
}

; Places units in a zig-zag pattern
; By @Durrenth
ZigZagPlacement(gridPlacement := false) {
    global startX, startY, endX, endY, step, successfulCoordinates, maxedCoordinates
    successfulCoordinates := [] ; Reset successfulCoordinates for each run
    maxedCoordinates := []
    savedPlacements := Map()

    startY2 := 200, endY2 := 500
    startY := 170, endY := 470

    rectZigZag := { x: startX, y: startY, width: 500, height: 500 }

    ; += Random(0, 15)

    x := startX + Random(0, 15) ; Incase 2 or more players are using the same placement, randomize starting location by 0-15 steps.
    y1 := startY ; Initialize y only once
    y2 := startY2 ; Initialize y2 only once
    y := y1 ; Start with the top Y coordinate

    ; Iterate through all slots (1 to 6)
    for slotNum in [1, 2, 3, 4, 5, 6] {
        enabled := "Enabled" slotNum
        enabled := %enabled%
        enabled := enabled.Value
        placements := "Placement" slotNum
        placements := %placements%
        placements := placements.Text

        ; Skip if the slot is not enabled
        if !(enabled = 1) {
            continue
        }

        AddToLog("Starting placements for Slot " slotNum " with " placements " placements.")

        placementCount := 0
        alternatingPlacement := 0

        while (placementCount < placements) {

            if PlaceUnit(x, y, slotNum) {
                placementCount++
                successfulCoordinates.Push({ x: x, y: y, slot: "slot_" slotNum }) ; Track successful placements
                ;AddToLog("Unit placed at x: " x ", y: " y)
                try {
                    if savedPlacements.Get("slot_" slotNum) {
                        savedPlacements.Set("slot_" slotNum, savedPlacements.Get("slot_" slotNum) + 1)
                    }
                } catch {
                    savedPlacements.Set("slot_" slotNum, 1)
                }

                if placementCount >= placements {
                    break
                }

                if (gridPlacement) {
                    PlaceInGrid(x, y, slotNum, &placementCount, &successfulCoordinates, &savedPlacements, &placements)
                }

            }
                BetterClick(348, 391) ; next
                BetterClick(565, 563) ; move mouse
            if ShouldStopUpgrading(1) {
                AddToLog("Stopping due to finding lobby  condition.")
                return LobbyLoop()
            }
            Reconnect()

            ; Move to the next X-coordinate
            x += step
            AddToLog("x: " x ", y: " y)

            ; If X exceeds the end range, reset it and move down
            if (isInsideRect(rectZigZag, x, y)) {
                ; Alternate y between y1 and y2 for zig-zag effect
                y := (y = y1) ? y2 : y1
            } else {

                ; Incase y value goes out of bounds, re-initialize starting locations, and add a huge offset to x
                if (y >= endY) {
                    AddToLog("Reached end of Y-range or coordinates are outside rectangles. Moving to the next row.")
                    x := startX + Random(20, 40) ; Reset x to the starting position, add random offset to it incase 2 players are using same placement style
                    startY := 170
                    startY2 := 200
                    y1 := startY
                    y2 := startY2
                    y := y1
                } else { ; If y isin't OOB
                    AddToLog("Reached end of X-range or coordinates are outside rectangles. Moving to the next row.")
                    x := startX + Random(0, 15) ; Reset x to the starting position, add random offset to it incase 2 players are using same placement style
                    y1 := startY + step ; Move top Y-coordinate down
                    y2 := startY2 + step ; Move bottom Y-coordinate down
                    startY := y1 ; This is needed incase you loop again. Otherwise you will keep starting at the default startY/startY2 locations
                    startY2 := y2
                    y := y1 ; Start the new row with the top Y-coordinate
                }

            }

        } ; End While
        AddToLog("Completed " placementCount " placements for Slot " slotNum ".")
        Reconnect()
    } ; End For
    UpgradeUnits()
    AddToLog("All slot placements and upgrades completed.")
}

; Algorithm that's used in LinePlacement. Is a helper function. Attempts to place units in a 2x2 grid once an initial unit has been placed.
; Can be combined with other placement algos.
; by @Durrenth
; modified to place units in a 3x3 grid around the successful unit instead of 2x2
PlaceInGrid(startX, startY, slotNum, &placementCount, &successfulCoordinates, &savedPlacements, &placements) {
    ; Places untis in a 2x2 grid, starting from the top left where the initial unit is placed (as dictated by startX and startY)
    ; U x
    ; x x
    ;"Y"     ;"X"
    ;[number1,number2]

    gridOffsets := [
    [30, 0],  ; Row 1, Column 0
    [0, 30],  ; Row 0, Column 1
    [30, 30],   ; Row 1, Column 1
	[-30, -30],
	[-30, 30],
	[-30, 0],
	[0, -30],
	[30, -30]
    ]
    for index, offset in gridOffsets {

        ; Adds the value that's stored in the array at the current index to either x or y's starting location
        gridX := startX + offset[2] ; Move horizontally by 'step' from the initial start location
        gridY := startY + offset[1] ; Move vertically by 'step' from the initial start location
		
        BetterClick(348, 391) ; next
        BetterClick(565, 563) ; move mouse
        if ShouldStopUpgrading(1) {
            AddToLog("Stopping due to finding lobby condition.")
            return LobbyLoop()
        }
        Reconnect()

        if PlaceUnit(gridX, gridY, slotNum) {
            placementCount++ ; Increment the placement count
            successfulCoordinates.Push({ x: gridX, y: gridY, slot: "slot_" slotNum }) ; Track the placement
            AddToLog("Placed unit at (" gridX ", " gridY ") in 3x3 grid.")

            ; Update or initialize saved placements for the current slot
            try {
                if savedPlacements.Get("slot_" slotNum) {
                    savedPlacements.Set("slot_" slotNum, savedPlacements.Get("slot_" slotNum) + 1)
                }
            } catch {
                savedPlacements.Set("slot_" slotNum, 1)
            }



            ; Check if placement limit is reached
            if placementCount >= placements {
                break
            }

        }

    } ; End for

}

TryPlacingUnits() {
    switch PlacementDropdown.Text {
        case "Spiral":
            SpiralPlacement()
        case "Lines":
            LinePlacement()
        case "Lines + 3x3 Grid Finder":
            LinePlacementGrid()
        case "Zig Zag":
            ZigZagPlacement()
        case "Zig Zag + 3x3 Grid Finder":
            ZigZagPlacement(true)
        case "Spiral + 3x3 Grid Finder":
            SpiralPlacement(true)
        default:
            SpiralPlacement(true)
    }
}


/*TryPlacingUnits() {
    global startX, startY, endX, endY, step, successfulCoordinates, maxedCoordinates
    successfulCoordinates := [] ; Reset successfulCoordinates for each run
    maxedCoordinates := []

    x := startX ; Initialize x only once
    y := startY ; Initialize y only once
    y2 := startY2 ; Initialize y2 only once

    ; Iterate through all slots (1 to 6)
    for slotNum in [1, 2, 3, 4, 5, 6] {
        enabled := "Enabled" slotNum
        enabled := %enabled%
        enabled := enabled.Value
        placements := "Placement" slotNum
        placements := %placements%
        placements := placements.Text

        ; Skip if the slot is not enabled
        if !(enabled = 1) {
            continue
        }

        AddToLog("Starting placements for Slot " slotNum " with " placements " placements.")

        placementCount := 0
        alternatingPlacement := 0

        ; Continue placement for the current slot
        while (placementCount < placements && y >= endY && y2 <= endY2) { ; Rows
            while (placementCount < placements && x <= endX) { ; Columns
                if (alternatingPlacement == 0) {
                    if PlaceUnit(x, y2, slotNum) {
                        placementCount++
                        successfulCoordinates.Push({ x: x, y: y2, slot: "slot_" slotNum }) ; Track successful placements
                    }
                }
                if (alternatingPlacement == 1) {
                    if PlaceUnit(x, y, slotNum) {
                        placementCount++
                        successfulCoordinates.Push({ x: x, y: y, slot: "slot_" slotNum }) ; Track successful placements
                    }
                }
                if (ok := FindText(&X, &Y, 334, 182, 450, 445, 0, 0, AutoAbility)) ; USE ABILITY IF OFF
                {
                    BetterClick(373, 237)
                }
                BetterClick(348, 391) ; next
                BetterClick(565, 563) ; move mouse
                if ShouldStopUpgrading(1) {
                    AddToLog("Stopping due to finding lobby  condition.")
                    return LobbyLoop()
                }
                Reconnect()
                x += step - 20 ; Move to the next column
            }
            if x > endX {
                x := startX ; Reset x for the next row
                if (Mod(alternatingPlacement, 2) == 0) {
                    y2 += (step + 25) ; Move to the next row, upwards
                    alternatingPlacement += 1
                }
                else {
                    y -= (step + 25) ; Move to the next row, downwards
                    alternatingPlacement -= 1
                }
            }
            Reconnect()
        }

        AddToLog("Completed " placementCount " placements for Slot " slotNum ".")
        Reconnect()
    }

    UpgradeUnits()

    AddToLog("All slot placements and upgrades completed.")
}*/

IsMaxed(coord) {
    global maxedCoordinates
    for _, maxedCoord in maxedCoordinates {
        if (maxedCoord.x = coord.x && maxedCoord.y = coord.y) {
            return true
        }
    }
    return false
}

SortByPriority(&array, priorityMapping) {
    AddToLog("Starting unit sorting by priority mapping")
    sortedArray := []

    for index, slot in priorityMapping {
        foundSlot := false

        for i, item in array {
            if (item.slot = slot) {
                sortedArray.Push(item)
                foundSlot := true
            }
        }

        if !foundSlot {
            AddToLog("No units found for: " slot ". Moving onto next slot")
        }
    }

    array := sortedArray
    AddToLog("Finished sorting units, starting upgrading")
}

UpgradeUnits() {
    if UUPCheckbox.Value == 1 {
        global successfulCoordinates, maxedCoordinates, unitUpgradePrioritydropDowns
        AddToLog("Beginning prioritized unit upgrades.")

        priorityMapping := []
        for index, dropDown in unitUpgradePrioritydropDowns {
            priorityText := dropDown.Text
            if priorityText && priorityText != "" {
                priorityMapping.Push(priorityText)
            }
        }

        SortByPriority(&successfulCoordinates, priorityMapping)

        for coord in successfulCoordinates {
            if IsMaxed(coord) {
                AddToLog("Unit already maxed at: X" coord.x " Y" coord.y ". Skipping upgrade.")
                continue
            }
            while !IsMaxUpgrade() {
                UpgradeUnit(coord.x, coord.y)
				
                if (IsMaxUpgrade()) {
                    break
                }
                
                Sleep 200

                if (ok := FindText(&X, &Y, 367, 262, 445, 302, 0, 0, AbilityOFF)) {
                    BetterClick(373, 237)
                }
                BetterClick(348, 391) ; next
                BetterClick(565, 563) ; move mouse

                if ShouldStopUpgrading() {
                    AddToLog("Found return to lobby, going back.")
                    successfulCoordinates := []
                    maxedCoordinates := []
                    return LobbyLoop()
                }

				Sleep 100
                Reconnect()
            }

            if (ok := FindText(&X, &Y, 367, 262, 445, 302, 0, 0, AbilityOFF)) ; USE ABILITY IF OFF
            {
                BetterClick(373, 237)
            }
			
            BetterClick(565, 563) ; move mouse
            AddToLog("Max upgrade reached for: X" coord.x " Y" coord.y ". Moving onto next unit")
            maxedCoordinates.Push(coord)
        }

        AddToLog("All units upgraded or maxed.")
        while !ShouldStopUpgrading() {
            BetterClick(348, 391) ; next
            BetterClick(565, 563) ; move mouse
            Sleep(2000)
        }

        return LobbyLoop()
    }
    else {
        global successfulCoordinates
        global maxedCoordinates

        AddToLog("Beginning unit upgrades.")

        while true { ; Infinite loop to ensure continuous checking
            for index, coord in successfulCoordinates {

                UpgradeUnit(coord.x, coord.y)

                if ShouldStopUpgrading() {
                    AddToLog("Found return to lobby, going back.")
                    successfulCoordinates := []
                    maxedCoordinates := []
                    return LobbyLoop()
                }

                if IsMaxUpgrade() {
                    AddToLog("Max upgrade reached for: X" coord.x " Y" coord.y)
                    maxedCoordinates.Push(successfulCoordinates.Get(index))
                    successfulCoordinates.RemoveAt(index) ; Remove the coordinate
                    continue ; Skip to the next coordinate
                }

                Sleep(200)
                if (ok := FindText(&X, &Y, 367, 262, 445, 302, 0, 0, AbilityOFF)) ; USE ABILITY IF OFF
                {
                    BetterClick(373, 237)
                }
                BetterClick(348, 391) ; next
                BetterClick(565, 563) ; move mouse
                Reconnect()
            }

            ; If all units are maxed, still check for stopping condition
            if successfulCoordinates.Length = 0 and maxedCoordinates.Length > 0 {
                Reconnect()
                BetterClick(348, 391) ; next
                BetterClick(565, 563) ; move mouse
                if ShouldStopUpgrading() {
                    AddToLog("Stopping due to finding return to lobby button.")
                    return LobbyLoop()
                }
                Sleep(2000) ; Prevent excessive looping

            }

            Reconnect()
        }
    }
}


UpgradeUnit(x, y) {
    BetterClick(x, y - 3)
    BetterClick(264, 363) ; upgrade
    BetterClick(264, 363) ; upgrade
    BetterClick(264, 363) ; upgrade
}


MaxUpgradeUI := A_ScriptDir . "\DetectionImages\MaxUpgrade.png"
MaxUpgradeUI2 := A_ScriptDir . "\DetectionImages\MaxUpgrade2.png"


IsMaxUpgrade() {
    Sleep 400
    foundMaxUpgrade := ImageSearchFullScreen(MaxUpgradeUI)

    if foundMaxUpgrade {
      return true
    }
    Sleep 400
    foundMaxUpgrade2 := ImageSearchFullScreen(MaxUpgradeUI2)

    if foundMaxUpgrade2 {
      return true
    }
}


ShouldStopUpgrading(sleepamount := 300) {
    Sleep sleepamount
    if CheckForLobbyButton() {
        if (WebhookCheckbox.Value = 1) {
            SendWebhook()
        }
        BetterClick(540, 117) ; Replay
            sleep 2000
BetterClick(432, 223)
sleep 2000
BetterClick(468, 190)
sleep 2000
Send("eclipse")
sleep 2000
BetterClick(334, 188) ; close chat
Sleep 1000
BetterClick(214, 291) ; click portal
sleep 2000
BetterClick(345, 424) ; select
sleep 10000

            LoadedLoop()
            StartedLoop()
            OnSpawnSetup()
            TryPlacingUnits()
        return true
    }
}

FindAndClickColor(targetColor := 0x006783, searchArea := [0, 0, A_ScreenWidth, A_ScreenHeight]) {
    ; Extract the search area boundaries
    x1 := searchArea[1], y1 := searchArea[2], x2 := searchArea[3], y2 := searchArea[4]

    ; Perform the pixel search
    if (PixelSearch(&foundX, &foundY, x1, y1, x2, y2, targetColor, 0)) {
        ; Color found, click on the detected coordinates
        BetterClick(foundX, foundY, "Right")
        AddToLog("Color found and clicked at: X" foundX " Y" foundY)
        return true

    } else {
    }
}

Checkforloss(){
    if (ok:=FindText(&X, &Y, 412-150000, 109-150000, 412+150000, 109+150000, 0, 0, DeathText))
    {
        return true
    }
    return false
}

OnSpawn() {
    if ControlGetVisible(keybindsGui) {
        return
    }
    OnSpawnSetup()
}

LookDown() {
    MouseMove(400, 300)
    loop 20 {
        SendInput("{WheelUp}")
        Sleep 50
    }
    Sleep 200
    MouseGetPos(&x, &y)
    MouseMove(400, 300)
    SendInput(Format("{Click {} {} Left}", x, y + 150))

    loop 20 {
        SendInput("{WheelDown}")
        Sleep 50
    }
}

LoadedLoop() {
    AddToLog("Waiting to load in")
    loop {
        Sleep 1000
        if (ok := FindText(&X, &Y, 326, 60, 547, 173, 0, 0, VoteStart))
        {
            global StageStartTime := A_TickCount
            AddToLog("Loaded in")
            Sleep 1000
            BetterClick(350, 103) ; click yes
            BetterClick(350, 100) ; click yes
            BetterClick(350, 97) ; click yes
            Sleep 200
            BetterClick(590, 15) ; click on P
            break
        }
                if (ok:=FindText(&X, &Y, 219-150000, 124-150000, 219+150000, 124+150000, 0, 0, WaveText)) {
   global StageStartTime := A_TickCount
            AddToLog("Loaded in")
            Sleep 1000
            BetterClick(350, 103) ; click yes
            BetterClick(350, 100) ; click yes
            BetterClick(350, 97) ; click yes
            Sleep 200
            BetterClick(590, 15) ; click on P
            break
}
        /*else if (ok := FindText(&X, &Y, 694 - 150000, 66 - 150000, 694 + 150000, 66 + 150000, 0, 0, P2))
        {
            global StageStartTime := A_TickCount
            AddToLog("Loaded in late")
            Sleep 1000
            BetterClick(350, 103) ; click yes
            BetterClick(350, 100) ; click yes
            BetterClick(350, 97) ; click yes
            Sleep 200
            BetterClick(590, 15) ; click on P
            break
        }*/
        else if (ok := FindText(&X, &Y, 629 - 150000, 67 - 150000, 629 + 150000, 67 + 150000, 0, 0, P))
        {
            Sleep 10000
            if (ok := FindText(&X, &Y, 629 - 150000, 67 - 150000, 629 + 150000, 67 + 150000, 0, 0, P) and (ok != FindText(&X, &Y, 326, 60, 547, 173, 0, 0, VoteStart))) {
                global StageStartTime := A_TickCount
                AddToLog("Loaded in late")
                Sleep 1000
                BetterClick(350, 103) ; click yes
                BetterClick(350, 100) ; click yes
                BetterClick(350, 97) ; click yes
                Sleep 200
                BetterClick(590, 15) ; click on P
              
                              if (ok:=FindText(&X, &Y, 219-150000, 124-150000, 219+150000, 124+150000, 0, 0, WaveText)) {
   global StageStartTime := A_TickCount
            AddToLog("Loaded in")
            Sleep 1000
            BetterClick(350, 103) ; click yes
            BetterClick(350, 100) ; click yes
            BetterClick(350, 97) ; click yes
            Sleep 200
            BetterClick(590, 15) ; click on P
            
}
            }
        }

        Reconnect()
    }
    chat := ChatToSend.Value
    if (ChatStatusBox.Value = 1 && StrLen(chat) > 0) {
        AddToLog("Sending chat")
        SendChat()
    }
}

StartedLoop() {
    loop {
        Sleep 1000
        if (ok := FindText(&X, &Y, 326, 60, 547, 173, 0, 0, VoteStart))
        {
            continue
        }
        AddToLog("Game started")
        break
    }
}

LobbyLoop() {
    loop {
        Sleep 1000
        if (ok := FindText(&X, &Y, 746, 476, 862, 569, 0, 0, AreasText))
        {
        Sleep 8000
            break
            
        }
        Reconnect()
    }
    AddToLog("Returned to lobby, going back to raids")
    return GoToRaids()
}

CheckForLobbyButton() {
    if (ok := FindText(&X, &Y, 273, 103, 482, 214, 0, 0, LobbyText))
    {
        return true
    }
}

SendChat() {
    SendInput("/")
    Sleep 250
    chat := ChatToSend.Value
    if (ChatStatusBox.Value = 1 && StrLen(chat) > 0) {
        for char in StrSplit(chat) {
            Send(char)
            Sleep(Random(100, 200))  ; Optional delay between each keypress
        }
    }
    Sleep 1200
    SendInput("{Enter}")
    Sleep 250
}

TPtoSpawn() {
    BetterClick(27, 574) ; setings
    Sleep 1000
    BetterClick(400, 287)
    Sleep 600
    loop 4 {
        Sleep 150
        SendInput("{WheelDown 1}") ; scroll
    }
    Sleep 600
    BetterClick(523, 371) ; tp to spawn
    Sleep 600
    BetterClick(582, 150) ; exit settings

}

DebugOCR() {
    if ControlGetVisible(keybindsGui) {
        return
    }
    ocrResult := OCR.FromRect(266, 309, 603 - 266, 352 - 309, , 2)

    if ocrResult {
        BetterClick(414, 342)
        AddToLog("Captcha Detected: " ocrResult.Text)

        ; Clean up the captcha string
        captcha := StrReplace(ocrResult.Text, " ")  ; Remove spaces
        if (StrLen(captcha) <= 1 || RegExMatch(captcha, "[A-Za-z]")) {
            AddToLog("invalid captcha retrying")
            BetterClick(584, 192) ; close captcha
                    return
        }

        ; Remove special characters like /, -, and .
        captcha := RegExReplace(captcha, "[/.\-_,]")

        ; Send each character
        Send(captcha)
        ;for char in StrSplit(captcha) {
        ;    Send(char)
        ;    Sleep(Random(25, 75))  ; Optional delay between each keypress
        ;}
    } else {
        AddToLog("NO CAPTCHA FOUND.")
    }
}

CheckForMatchmakingGUI() {
    targetColor := 0x00FE7F  ; The color to search for
    searchArea := [353, 62, 453, 162]  ; Define the search area (50 pixels around (403, 112))

    ; Perform the pixel search
    if (PixelSearch(&foundX, &foundY, searchArea[1], searchArea[2], searchArea[3], searchArea[4], targetColor, 0)) {
        ; Color found, log the result
        AddToLog("Found matchmaking GUI at: X" foundX " Y" foundY)
        return true  ; Indicate that the color was found
    } else {
        AddToLog("Matchmaking GUI not found.")
        return false  ; Indicate that the color was not found
    }
}

AntiCaptcha() {

    ; Perform OCR on the defined region directly
    ocrResult := OCR.FromRect(266, 309, 603 - 266, 352 - 309, , 2)

    ; Display OCR results
    Reconnect()
    if ocrResult {
        BetterClick(414, 342)
        AddToLog("Captcha Detected: " ocrResult.Text)

        ; Clean up the captcha string
        captcha := StrReplace(ocrResult.Text, " ")  ; Remove spaces
        if (StrLen(captcha) <= 1 || RegExMatch(captcha, "[A-Za-z]")) {
            AddToLog("invalid captcha retrying")
            
            return
        }

        ; Remove special characters like /, -, and .
        captcha := RegExReplace(captcha, "[/.\-_,]")

        ; Send each character
        Send(captcha)
        ;for char in StrSplit(captcha) {
        ;    Send(char)
        ;    Sleep(Random(25, 75))  ; Optional delay between each keypress
        ;}
    } else {
        AddToLog("NO CAPTCHA FOUND.")
    }

    BetterClick(309, 386) ; select
    Sleep 1500
    BetterClick(383, 221)
    Sleep 500

    sleep 15000
    if (ok := FindText(&X, &Y, 10, 70, 350, 205, 0, 0, LoadingScreen)) {
        return
    }
    if (ok := FindText(&X, &Y, 326, 60, 547, 173, 0, 0, VoteStart)) {
        return
    }
                    if (ok:=FindText(&X, &Y, 219-150000, 124-150000, 219+150000, 124+150000, 0, 0, WaveText)) {
  return
}
    AddToLog("Reentering if it didnt matchmake")

    BetterClick(400, 523)

    loop 3 {
        HoldKey("S", 700)
        HoldKey("W", 1500)
        HoldKey("Space", 2000)
    }

    BetterClick(700, 375)
        Sleep 800

    if (ok := FindText(&X, &Y, 221, 206, 403, 355, 0, 0, MatchmakeUI)) {
        AddToLog("Waiting for captcha cooldown then retrying")
        Sleep 20000
    }
    Reconnect()
    return
}


TapToMove(toggle) {

    SendInput("{Esc}")
    Sleep 1000
    BetterClick(246, 91)
    Sleep 500
    SendInput("{Down}")
    Sleep 100
    SendInput("{Down}")
    Sleep 500
    if (toggle) {
        SendInput("{Right}")
        Sleep 400
        SendInput("{Right}")
    }
    else {
        SendInput("{Left}")
        Sleep 400
        SendInput("{Left}")
    }
    Sleep 500
    SendInput("{Esc}")
    Sleep 1000
}

OnSpawnSetup() {
SendInput ("{Tab}")
    BetterClick(642, 71)
    Sleep 100
    BetterClick(642, 71)
    LookDown()
    Sleep 200
    TPtoSpawn()
    Sleep 200

}

SnowyOnSpawnSetup() {
    SendInput ("{Tab}")

    LookDown()
    Sleep 200
    TPtoSpawn()
    Sleep 4000
    SendInput("{d down}")
	Sleep 3000
    SendInput("{d up}")
	Sleep 300
    SendInput("{w down}")
	Sleep 2150
    SendInput("{w up}")
	Sleep 100
}

DungeonOnSpawnSetup() {
    SendInput ("{Tab}")
    LookDown()
    Sleep 200
    TPtoSpawn()
    Sleep 4000
    SendInput("{s down}")
	Sleep 900
    SendInput("{s up}")
    Sleep 300
    SendInput("{d down}")
	Sleep 600
    SendInput("{d up}")
}

Reconnect() {
    ; Check for Disconnected Screen
    color := PixelGetColor(519, 329) ; Get color at (519, 329)
    if (color = 0x393B3D) {
        AddToLog("Disconnected! Attempting to reconnect...")

        ; Use Roblox deep linking to reconnect
        Run("roblox://placeID=" 8304191830)
        Sleep 2000
        if WinExist(RobloxWindow) {
            WinMove(27, 15, 800, 600, RobloxWindow)
            WinActivate(RobloxWindow)
            Sleep 1000
        }
        loop {
            AddToLog("Reconnecting to Roblox...")
            Sleep 15000
            if (ok := FindText(&X, &Y, 746, 476, 862, 569, 0, 0, AreasText)) {
                AddToLog("Reconnected Succesfully!")
                return GoToRaids() ; Check for challenges in the lobby
            }
            else {
                Reconnect()
            }
        }
    }
}

HoldKey(key, duration) {
    SendInput ("{" key "up}")
    ; go to teleporter
    Sleep 100
    SendInput ("{" key " down}")
    Sleep duration
    SendInput ("{" key " up}")
    KeyWait key ; Wait for "d" to be fully processed
}

cardSelector() {
    AddToLog("Picking card in priority order")
    if (ok:=FindText(&X, &Y, 234-150000, 257-150000, 234+150000, 257+150000, 0, 0, UnitExistence)) {
        BetterClick(329, 184) ; close upg menu
        sleep 100
    }

    BetterClick(59, 572) ; Untarget Mouse
    sleep 500

    for index, priority in priorityOrder {
        if (!textCards.Has(priority)) {
            continue
        }
        if (ok := FindText(&cardX, &cardY, 209, 203, 652, 404, 0, 0, textCards.Get(priority))) {
            FindText().Click(cardX, cardY, 0)
            MouseMove 0, 10, 2, "R"
            Click 2
            sleep 1000
            MouseMove 0, 120, 2, "R"
            Click 2
            AddToLog(Format("Picked card: {}", priority))
            sleep 5000
            return
        }
    }
    AddToLog("Failed to pick a card")
}

;Added by @raynnpjl
cardSelectorBackup() {
    AddToLog("Picking card")
    if (ok:=FindText(&X, &Y, 234-150000, 257-150000, 234+150000, 257+150000, 0, 0, UnitExistence)) {
        BetterClick(329, 184) ; close upg menu
        sleep 100
    }
    Click "256 334 0" ; Card Select 1
    sleep 100
    Click "403 334 0" ; Card Select 2
    sleep 100
    Click "547 334 0" ; Card Select 3
    sleep 100
    BetterClick(59, 572) ; Untarget Mouse
    sleep 500
    if (ok := FindText(&cardX, &cardY, 209, 203, 652, 404, 0, 0, new_path)) {
        FindText().Click(cardX, cardY, 0)
        MouseMove 0, 10, 2, "R"
        Click 2
        sleep 1000
        MouseMove 0, 120, 2, "R"
        Click 2
        AddToLog("Picked new_path")
        sleep 5000
    }
    else if (ok := FindText(&cardX, &cardY, 209, 203, 652, 404, 0, 0, shield)) {
        FindText().Click(cardX, cardY, 0)
        MouseMove 0, 10, 2, "R"
        Click 2
        sleep 1000
        MouseMove 0, 120, 2, "R"
        Click 2
        AddToLog("Picked enemy shield")
        sleep 5000
    }
    else if (ok := FindText(&cardX, &cardY, 209, 203, 652, 404, 0, 0, health)) {
        FindText().Click(cardX, cardY, 0)
        MouseMove 0, 10, 2, "R"
        Click 2
        sleep 1000
        MouseMove 0, 120, 2, "R"
        Click 2
        AddToLog("Picked enemy health")
        sleep 5000
    }
    else if (ok := FindText(&cardX, &cardY, 209, 203, 652, 404, 0, 0, regen)) {
        FindText().Click(cardX, cardY, 0)
        MouseMove 0, 10, 2, "R"
        Click 2
        sleep 1000
        MouseMove 0, 120, 2, "R"
        Click 2
        AddToLog("Picked enemy regen")
        sleep 5000
    }
    else if (ok := FindText(&cardX, &cardY, 209, 203, 652, 404, 0, 0, explosive_death)) {
        FindText().Click(cardX, cardY, 0)
        MouseMove 0, 10, 2, "R"
        Click 2
        sleep 1000
        MouseMove 0, 120, 2, "R"
        Click 2
        AddToLog("Picked explosive_death")
        sleep 5000
    }
    else if (ok := FindText(&cardX, &cardY, 209, 203, 652, 404, 0, 0, speed)) {
        FindText().Click(cardX, cardY, 0)
        MouseMove 0, 10, 2, "R"
        Click 2
        sleep 1000
        MouseMove 0, 120, 2, "R"
        Click 2
        AddToLog("Picked enemy speed")
        sleep 5000
    }
    else if (ok := FindText(&cardX, &cardY, 209, 203, 652, 404, 0, 0, range)) {
        FindText().Click(cardX, cardY, 0)
        MouseMove 0, 10, 2, "R"
        Click 2
        sleep 1000
        MouseMove 0, 120, 2, "R"
        Click 2
        AddToLog("Picked range buff")
        sleep 5000
    }
    else if (ok := FindText(&cardX, &cardY, 209, 203, 652, 404, 0, 0, attack)) {
        FindText().Click(cardX, cardY, 0)
        MouseMove 0, 10, 2, "R"
        Click 2
        sleep 1000
        MouseMove 0, 120, 2, "R"
        Click 2
        AddToLog("Picked attack buff")
        sleep 5000
    }
    else if (ok := FindText(&cardX, &cardY, 209, 203, 652, 404, 0, 0, cooldown)) {
        FindText().Click(cardX, cardY, 0)
        MouseMove 0, 10, 2, "R"
        Click 2
        sleep 1000
        MouseMove 0, 120, 2, "R"
        Click 2
        AddToLog("Picked cooldown")
        sleep 5000
    }
    else if (ok := FindText(&cardX, &cardY, 209, 203, 652, 404, 0, 0, yen)) {
        FindText().Click(cardX, cardY, 0)
        MouseMove 0, 10, 2, "R"
        Click 2
        sleep 1000
        MouseMove 0, 120, 2, "R"
        Click 2
        AddToLog("Picked yen buff")
        sleep 5000
    }
    else {
        AddToLog("Failed to pick a card")
    }
}
