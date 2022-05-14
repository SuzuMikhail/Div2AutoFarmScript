--[[
    TCTD2 AutoFarm Script
    Version: 0.1
    Author: QwonSuzune
    License: GNU GPLv3
]]--
 
EnablePrimaryMouseButtonEvents(true)
 
-- Using Script
--[[
    1: 观点博物馆挂机带自动捡装备，300 趟之后自动拆解装备（建议两个红皮怪以上，不然怪会乱跑，就捡不到附近的装备）
    2: 暗牙波托马克
    3: 航空航天
    4: 航天局
    5: 体育馆
    6: 杰弗逊
    7: 自动 100 大厅，塔防（有点失败，不建议用，除非输出够高，可以自行改成使用滚雷的版本）\
    8: 自由岛
	9: 坟墓脉冲
]]--
 
local div2_ScriptIndex = 9
 
-- Key Definition
 
local keyForward = "W"
local keyRight = "D"
local keyLeft  = "A"
local keyBackward = "S"
local keyInteractive = "F"
local keyDestruct = "Z"
local keyGranade = "G"
local keySkill1 = "Q"
local keyQuickSkill1 = "5"
local keySkill2 = "E"
local keyQuickSkill2 = "6"
local keyFire = "F11"
local keyCover = "F3"
local keyJump = "F7"
local keySprint = "lshift"
 
local turnRightXOffset = 1920
local turnYOffset = 1700
 
local sleepTimeOfAnyKey = 150
 
local everyRoundSleepTime = 5000
 
-- Basic function
 
function div2_PressWithTime(key, sleepTime)
    PressKey(key)
    Sleep(sleepTime)
    ReleaseKey(key)
    Sleep(sleepTimeOfAnyKey)
end
 
function div2_MoveCamera(x, y)
    local pixel = 24
    local x_pixel = 0
    local y_pixel = 0
    local x_value = 0
    local y_value = 0
    local x_factor = 1
    local y_factor = 1
 
    if x ~= 0 then
        x_value = math.abs(x)
        x_pixel = pixel
    end
 
    if y ~= 0 then
        y_value = math.abs(y)
        y_pixel = pixel
    end
 
    if x < 0 then
        x_factor = -1
    end
 
    if y < 0 then
        y_factor = -1
    end
     
     
    for i=0, x_value, pixel
    do
        MoveMouseRelative(x_pixel * x_factor, 0)
        Sleep(1)
    end
 
    for i=0, y_value, pixel
    do
        MoveMouseRelative(0, y_pixel * y_factor)
        Sleep(1)
    end
end
 
function div2_Sprint(time)
    PressKey(keyForward)
    Sleep(sleepTimeOfAnyKey)
    div2_PressWithTime(keySprint, 150)
    ReleaseKey(keyForward)
    div2_PressWithTime(keyForward, time)
end
 
function div2_RiggerInfinitySkill_Before(keySkill)
    div2_PressWithTime(keySkill, 50)
    div2_PressWithTime(keySkill, 50)
    Sleep(1000)
    div2_PressWithTime(keySkill, 3000)
end
 
function div2_RiggerInfinitySkill(keySkill, keyQuickSkill)
    PressKey(keySkill)
    Sleep(1000)
    for i=0, 15, 1 do -- 自动狂按
        PressKey(keyQuickSkill)
        Sleep(50)
        ReleaseKey(keyQuickSkill)
        Sleep(50)
    end
    ReleaseKey(keySkill)
    Sleep(8000) -- 防没及时重置冷却时间
end
 
function div2_SuicideByFire()
    div2_MoveCamera(0, turnYOffset)
 
    div2_PressWithTime(keySkill1, 100)
    Sleep(1500)
    div2_PressWithTime(keyFire, 150)
    Sleep(1000)
     
    div2_PressWithTime("3", 150)
    div2_PressWithTime(keyFire, 150)
end
 
-- Script Details
 
-- 观点博物馆
function div2_Script1(loop_index)
    div2_PressWithTime("1", 150)
    PressKey(keyForward)
    Sleep(sleepTimeOfAnyKey)
    div2_PressWithTime(keySprint, 150)
    ReleaseKey(keyForward)
    div2_PressWithTime(keyForward, 4000)
    div2_PressWithTime(keyCover, 1000)
     
    div2_MoveCamera(0, 125)
    div2_PressWithTime(keySkill2, 100)
    Sleep(150)
    div2_PressWithTime(keyFire, 150)
    div2_PressWithTime(keySkill2, 150)
    div2_PressWithTime(keySkill2, 150)
     
    div2_PressWithTime(keyCover, 500)
 
    usedKey = keyInteractive
    if loop_index >= 300 then
        usedKey = keyDestruct
    end
 
    local i = math.mod(loop_index, 5)
    if i == 0 then -- 两轮捡 1 次
        PressKey(keyForward)
        Sleep(sleepTimeOfAnyKey)
        div2_PressWithTime(keySprint, 150)
        ReleaseKey(keyForward)
        div2_PressWithTime(keyForward, 2100)
        div2_PressWithTime(usedKey, 1000)
         
        div2_PressWithTime(keyLeft, 500)
        div2_PressWithTime(keyForward, 500)
        div2_PressWithTime(usedKey, 1000)
         
        div2_PressWithTime(keyRight, 500)
        div2_PressWithTime(keyForward, 250)
        div2_PressWithTime(usedKey, 1000)
    end
     
    Sleep(4000)
    div2_MoveCamera(0, turnYOffset)
     
     
    div2_PressWithTime(keySkill1, 100)
    Sleep(1500)
    div2_PressWithTime(keyFire, 150)
    Sleep(1000)
     
    div2_PressWithTime("3", 150)
    div2_PressWithTime(keyFire, 150)
     
    Sleep(6000)
     
    div2_PressWithTime(keyInteractive, 1000)
end
 
-- 暗牙波托马克
function div2_Script2(loop_index)
    div2_PressWithTime("1", 150)
    div2_Sprint(3500)
     
    div2_PressWithTime(keyRight, 3000)
    div2_Sprint(2250)
     
    div2_MoveCamera(2600, 0)
     
     
    div2_PressWithTime("F7", 250) -- 翻越
    div2_PressWithTime("F7", 250) -- 翻越
    div2_PressWithTime("F7", 250) -- 翻越
     
    div2_PressWithTime(keyForward, 2000)
     
    div2_PressWithTime("F7", 250) -- 翻越
    div2_PressWithTime("F7", 250) -- 翻越
    div2_PressWithTime("F7", 250) -- 翻越
     
    Sleep(2000)
     
    div2_PressWithTime(keySkill2, 100)
    Sleep(150)
    div2_MoveCamera(0, -800)
    div2_PressWithTime(keyFire, 150)
     
    Sleep(6000)
    div2_MoveCamera(0, turnYOffset)
     
     
    div2_PressWithTime(keySkill1, 100)
    Sleep(1500)
    div2_PressWithTime(keyFire, 150)
    Sleep(1000)
     
     
    div2_PressWithTime("3", 150)
    div2_PressWithTime(keyFire, 150)
     
    Sleep(6000)
     
    div2_PressWithTime(keyInteractive, 1000)
end
 
-- 航空航天博物馆
function div2_Script3(loop_index)
    div2_PressWithTime(keyLeft, 500)
    div2_PressWithTime(keySprint, 150)
    div2_PressWithTime(keyForward, 2000)
    div2_PressWithTime(keyRight, 1500)
     
    div2_PressWithTime("1", 150)
    div2_Sprint(2000)
     
    div2_PressWithTime(keyForward, 1000)
     
    div2_MoveCamera(0, -150)
    div2_PressWithTime(keySkill2, 100)
    Sleep(1000)
    div2_PressWithTime(keyFire, 150)
     
    Sleep(5000)
    div2_MoveCamera(0, turnYOffset)
     
     
    div2_PressWithTime(keySkill1, 100)
    Sleep(1500)
    div2_PressWithTime(keyFire, 150)
    Sleep(1000)
     
     
    div2_PressWithTime("3", 150)
    div2_PressWithTime(keyFire, 150)
     
    Sleep(6000)
     
    div2_PressWithTime(keyInteractive, 1000)
end
 
-- 航天局
function div2_Script4(loop_index)
    div2_MoveCamera(-800, 0)
    div2_PressWithTime(keyLeft, 700)
    div2_PressWithTime(keyForward, 1500)
     
    div2_PressWithTime("F7", 250) -- 翻越
    div2_PressWithTime("F7", 250) -- 翻越
    div2_PressWithTime("F7", 250) -- 翻越
    Sleep(4000)
     
    div2_PressWithTime(keyForward, 1500)
    div2_PressWithTime(keySkill2, 150)
    Sleep(150)
    div2_PressWithTime(keyFire, 150)
     
    Sleep(6000)
    div2_MoveCamera(0, turnYOffset)
     
     
    div2_PressWithTime(keySkill1, 100)
    Sleep(1500)
    div2_PressWithTime(keyFire, 150)
    Sleep(1000)
     
     
    div2_PressWithTime("3", 150)
    div2_PressWithTime(keyFire, 150)
     
    Sleep(6000)
     
    div2_PressWithTime(keyInteractive, 1000)
end
 
-- 体育馆
function div2_Script5(loop_index)
    div2_PressWithTime("1", 150)
    div2_PressWithTime(keyForward, 1000)
    div2_MoveCamera(500, 0)
    div2_MoveCamera(0, -100)
     
    div2_PressWithTime(keySkill2, 150)
    Sleep(150)
    div2_PressWithTime(keyFire, 150)
     
    Sleep(6000)
    div2_MoveCamera(0, turnYOffset)
     
     
    div2_PressWithTime(keySkill1, 100)
    Sleep(1500)
    div2_PressWithTime(keyFire, 150)
    Sleep(1000)
     
     
    div2_PressWithTime("3", 150)
    div2_PressWithTime(keyFire, 150)
     
    Sleep(6000)
     
    div2_PressWithTime(keyInteractive, 1000)
end
 
-- 杰弗逊
function div2_Script6(loop_index)
    div2_PressWithTime("1", 150)
     
    div2_MoveCamera(400, 0)
    PressKey(keyForward)
    Sleep(2000)
    div2_MoveCamera(-400, 0)
    Sleep(5000)
    ReleaseKey(keyForward)
     
    div2_PressWithTime(keyRight, 1500)
    div2_PressWithTime(keySkill2, 150)
    Sleep(150)
    div2_PressWithTime(keyFire, 150)
     
    Sleep(6000)
    div2_MoveCamera(0, turnYOffset)
     
     
    div2_PressWithTime(keySkill1, 100)
    Sleep(1500)
    div2_PressWithTime(keyFire, 150)
    Sleep(1000)
     
    div2_PressWithTime("3", 150)
    div2_PressWithTime(keyFire, 150)
     
    Sleep(6000)
     
    div2_PressWithTime(keyInteractive, 1000)
end
 
-- 自动 100 大厅
function div2_Script7(loop_index)
    Sleep(4000) -- 等开门
 
    div2_PressWithTime(keyForward, 1000)
    div2_PressWithTime(keyRight, 1000)
    div2_Sprint(3000)
    div2_PressWithTime(keyLeft, 1000)
 
    div2_PressWithTime(keyInteractive, 2000)
    Sleep(2000)
 
    div2_PressWithTime(keyForward, 1000)
    div2_PressWithTime(keyRight, 1500)
    div2_PressWithTime(keyForward, 1000)
    div2_PressWithTime(keyCover, 1000)
    div2_PressWithTime(keyRight, 150)
 
    div2_PressWithTime(keySkill1, 150)
    div2_PressWithTime(keySkill1, 150)  
    div2_PressWithTime(keySkill2, 150)
    div2_PressWithTime(keySkill2, 150)
     
    for i=0, 340, 10 do-- 塔防慢慢刮，10 秒后重新锁定
        div2_PressWithTime(keySkill1, 150)  
        div2_PressWithTime(keySkill2, 150)
        Sleep(400)
        Sleep(9000)
    end
 
     
    div2_MoveCamera(-300, turnYOffset)
    div2_MoveCamera(-2500, 0)
 
    div2_PressWithTime(keyGranade, 150)
    Sleep(1000)
    div2_PressWithTime(keyFire, 150)
    Sleep(2000)
 
    div2_PressWithTime(keyGranade, 150)
    Sleep(1000)
    div2_PressWithTime(keyFire, 150)
    Sleep(2000)
     
    Sleep(4000)
     
    -- 防没按到
    div2_PressWithTime(keyInteractive, 1000)
    Sleep(1000)
    div2_PressWithTime(keyInteractive, 1000)
    Sleep(1000)
    div2_PressWithTime(keyInteractive, 1000)
    Sleep(1000)
end
 
function div2_Script8(loop_index)
    div2_Sprint(2000)
    div2_PressWithTime(keyRight, 1000)
    div2_PressWithTime(keyCover, 1000)
 
    div2_PressWithTime(keyRight, 150)
    div2_MoveCamera(300, 0)
    div2_PressWithTime(keySkill2, 100)
    Sleep(1000)
    div2_PressWithTime(keyFire, 150)
 
    Sleep(6000)
     
    div2_MoveCamera(0, turnYOffset)
 
    div2_PressWithTime(keySkill1, 100)
    Sleep(1500)
    div2_PressWithTime(keyFire, 150)
    Sleep(1000)
     
    div2_PressWithTime("3", 150)
    div2_PressWithTime(keyFire, 150)
 
    Sleep(3000)
 
    -- 防没按到
    div2_PressWithTime(keyInteractive, 1000)
    Sleep(1000)
    div2_PressWithTime(keyInteractive, 1000)
    Sleep(1000)
    div2_PressWithTime(keyInteractive, 1000)
    Sleep(1000)
 
end


-- 无限坟墓
function div2_Script9(loop_index)
	div2_PressWithTime(keyRight, 150)

    div2_Sprint(1000)

    div2_PressWithTime(keyJump, 150)
	Sleep(1000)
	div2_Sprint(1000)
    div2_PressWithTime(keyJump, 150)
    Sleep(4000)
	
	div2_MoveCamera(-300, 0)
	
	PressKey(keyForward)
	PressKey(keySprint)
	PressKey(keySkill2)
    Sleep(4000)
	ReleaseKey(keyForward)
	ReleaseKey(keySprint)
	ReleaseKey(keySkill2)
     
	div2_MoveCamera(0, turnYOffset)
	
	
    div2_PressWithTime(keyGranade, 150)
    Sleep(1000)
    div2_PressWithTime(keyFire, 150)
    Sleep(2000)
 
    div2_PressWithTime(keyGranade, 150)
    Sleep(1000)
    div2_PressWithTime(keyFire, 150)
    Sleep(2000)
 
 
    Sleep(3000)
 
    -- 防没按到
    div2_PressWithTime(keyInteractive, 1000)
    Sleep(1000)
    div2_PressWithTime(keyInteractive, 1000)
    Sleep(1000)
    div2_PressWithTime(keyInteractive, 1000)
    Sleep(1000)
 
end
 
local div2_ScriptList = {
    div2_Script1,
    div2_Script2,
    div2_Script3,
    div2_Script4,
    div2_Script5,
    div2_Script6,
    div2_Script7,
    div2_Script8,
	div2_Script9
}
 
function div2_Script(loop_index)
    div2_ScriptList[div2_ScriptIndex](loop_index)
end
 
 
function OnEvent(event, arg)
    if (event == "MOUSE_BUTTON_PRESSED" and arg == 9) then
        local loop_index = 1
        repeat
             
            div2_Script(loop_index)
             
            local sleepTime = math.random(everyRoundSleepTime, everyRoundSleepTime + 2000)
            Sleep(sleepTime)
             
            loop_index = loop_index + 1
        until IsKeyLockOn("numlock")
         
        OutputLogMessage("SCRIPT ENDED\n")
    end
end