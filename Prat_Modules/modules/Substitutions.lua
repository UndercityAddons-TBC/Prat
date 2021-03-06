﻿---------------------------------------------------------------------------------
--
-- Prat - A framework for World of Warcraft chat mods
--
-- Copyright (C) 2006-2007  Prat Development Team
--
-- This program is free software; you can redistribute it and/or
-- modify it under the terms of the GNU General Public License
-- as published by the Free Software Foundation; either version 2
-- of the License, or (at your option) any later version.
--
-- This program is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
--
-- You should have received a copy of the GNU General Public License
-- along with this program; if not, write to:
--
-- Free Software Foundation, Inc.,
-- 51 Franklin Street, Fifth Floor,
-- Boston, MA  02110-1301, USA.
--
--
-------------------------------------------------------------------------------



--[[
Name: PratSubstitutions
Revision: $Revision: 80138 $
Author(s): Sylvanaar
Website: http://files.wowace.com/Prat/
Documentation: http://www.wowace.com/wiki/Prat/Integrated_Modules#Substitutions
Subversion: http://svn.wowace.com/wowace/trunk/Prat/
Discussions: http://groups.google.com/group/wow-prat
Issues and feature requests: http://code.google.com/p/prat/issues/list
Based on: CFE2 by Satrina. (http://www.wowinterface.com/downloads/info6885-ChatFrameExtender2.html
Dependencies: Prat
Description: A module to provide basic chat substitutions. (default=off).
]]

-- Get Utility Libraries
local util, DBG, CLR = GetPratUtils()

local Prat = Prat

local LIB = PRATLIB
local PRAT_LIBRARY = PRAT_LIBRARY
-- set prat module name
local PRAT_MODULE = Prat:RequestModuleName("PratSubstitutions")

if PRAT_MODULE == nil then
	return
end

-- define localized strings
local loc = PRAT_LIBRARY(LIB.LOCALIZATION)
local L = loc[PRATLIB.NEWLOCALENAMESPACE](loc, PRAT_MODULE)

L[LIB.NEWLOCALE](L, "enUS", function() return {
	["Substitutions"] = true,
	["A module to provide basic chat substitutions."] = true,
	['User defined substitutions'] = true,
	['Options for setting and removing user defined substitutions. (NB: users may define custom values for existing substitutions, but they will revert to the default value if the user definition is deleted.)'] = true,
	['Set substitution'] = true,
	['Set the value of a user defined substitution (NB: this may be the same as an existing default substitution; to reset it to the default, just remove the user created definition).'] = true,
	['subname = text after expansion -- NOTE: sub name without the prefix "%"'] = true,
	['List substitutions'] = true,
	['Lists all current subtitutions in the default chat frame'] = true,
	['Delete substitution'] = true,
	['Deletes a user defined substitution'] = true,
	['subname -- NOTE: sub name without the prefix \'%\''] = true,
	['Are you sure?'] = true,
	['Delete all'] = true,
	['Deletes all user defined substitutions'] = true,
	['Are you sure - this will delete all user defined substitutions and reset defaults?'] = true,
	['List of available substitutions'] = true,
	['List of available substitutions defined by this module. (NB: users may define custom values for existing substitutions, but they will revert to the default value if the user definition is deleted.)'] = true,
	["NO MATCHFUNC FOUND"] = true,
	["Current value: '%s'\nClick to paste into the chat."] = true,
	['no substitution name given'] = true,
	['no value given for subtitution "%s"'] = true,
	['|cffff0000warning:|r subtitution "%s" already defined as "%s", overwriting'] = true,
	['defined %s: expands to => %s'] = true,
	['no substitution name supplied for deletion'] = true,
	['no user defined subs found'] = true,
	['user defined substition "%s" not found'] = true,
	["user substitutions index (usersubs_idx) doesn't exist! oh dear."] = true,
	["can't find substitution index for a substitution named '%s'"] = true,
	['removing user defined substitution "%s"; previously expanded to => "%s"'] = true,
	['substitution: %s defined as => %s'] = true,
	['%d total user defined substitutions'] = true,
	['Prat_Substitutions:buildUserSubsIndex(): warning: module patterns not defined!'] = true,

	["<notarget>"] = true,
	["male"] = true,
	["female"] = true,
	["unknown sex"] = true,
	["<noguild>"] = true,
	["his"] = true,
	["hers"] = true,
	["its"] = true,
	["him"] = true,
	["her"] = true,
	["it"] = true,

	['usersub_'] = true,
	["TargetHealthDeficit"] = true,
	["TargetPercentHP"] = true,
	["TargetPronoun"] = true,
	["PlayerHP"] = true,
	["PlayerName"] = true,
	["PlayerMaxHP"] = true,
	["PlayerHealthDeficit"] = true,
	["PlayerPercentHP"] = true,
	["PlayerCurrentMana"] = true,
	["PlayerMaxMana"] = true,
	["PlayerPercentMana"] = true,
	["PlayerManaDeficit"] = true,
	["TargetName"] = true,
	["TargetTargetName"] = true,
	["TargetClass"] = true,
	["TargetHealth"] = true,
	["TargetRace"] = true,
	["TargetGender"] = true,
	["TargetLevel"] = true,
	["TargetPossesive"] = true,
	["TargetManaDeficit"] = true,
	["TargetGuild"] = true,
	["TargetIcon"] = true,
	["MapZone"] = true,
	["MapLoc"] = true,
	["MapPos"] = true,
	["MapYPos"] = true,
	["MapXPos"] = true,
	["RandNum"] = true,
} end)

--Chinese Translate by Ananhaid(NovaLOG)@CWDG
--CWDG site: http://Cwowaddon.com
L[LIB.NEWLOCALE](L, "zhCN", function() return {
    ["Substitutions"] = "文字缩写",
    ["A module to provide basic chat substitutions."] = "提供基本的聊天输出文字缩写功能.",
    ['User defined substitutions'] = "玩家自定义文字缩写",
	['Options for setting and removing user defined substitutions. (NB: users may define custom values for existing substitutions, but they will revert to the default value if the user definition is deleted.)'] = "设定或移除玩家自定义文字缩写选项。 (注意: 玩家可覆盖预置的文字缩写，但移除自定义文字缩写后预置的文字缩写后会还原回预设值。)",
	['Set substitution'] = "设定文字缩写",
	['Set the value of a user defined substitution (NB: this may be the same as an existing default substitution; to reset it to the default, just remove the user created definition).'] = "设定玩家自定义文字缩写。 (注意: 玩家可覆盖预置的文字缩写，但移除自定义文字缩写后预置的文字缩写会还原回预设值。)",
	['subname = text after expansion -- NOTE: sub name without the prefix "%"'] = "文字缩写 = 实际输出文字 -- 注意: 文字缩写不包括「%」",
	['List substitutions'] = "列出文字缩写",
	['Lists all current subtitutions in the default chat frame'] = "在预设的聊天窗口列出全部玩家自定义文字缩写。",
	['Delete substitution'] = "移除文字缩写",
	['Deletes a user defined substitution'] = "移除玩家自定义文字缩写。",
	['subname -- NOTE: sub name without the prefix \'%\''] = "文字缩写 -- 注意: 文字缩写不包括「%」",
	['Are you sure?'] = "确定?",
	['Delete all'] = "全部移除",
	['Deletes all user defined substitutions'] = "移除全部玩家自定义文字缩写。",
	['Are you sure - this will delete all user defined substitutions and reset defaults?'] = "确定移除全部玩家自定义文字缩写?",
	['List of available substitutions'] = "可用的文字缩写列表",
	['List of available substitutions defined by this module. (NB: users may define custom values for existing substitutions, but they will revert to the default value if the user definition is deleted.)'] = "此模块定义的可用文字缩写列表。 (注意: 玩家可覆盖预置的文字缩写，但移除自定义文字缩写后预置的文字缩写会还原回预设值。)",
	["NO MATCHFUNC FOUND"] = "找不到 matchfunc()",
	["Current value: '%s'\nClick to paste into the chat."] = "当前的值: 「%s」\n单击帖入输入框。",
	['no substitution name given'] = "沒有提供文字缩写名称",
	['no value given for subtitution "%s"'] = "文字缩写「%s」沒有实际输出文字",
	['|cffff0000warning:|r subtitution "%s" already defined as "%s", overwriting'] = "|cffff0000警告:|r 文字缩写「%s」早已定义为「%s」，将会覆盖",
	['defined %s: expands to => %s'] = "已定义%s: => %s",
	['no substitution name supplied for deletion'] = "沒有提供要移除的文字缩写名称",
	['no user defined subs found'] = "找不到玩家自定义文字缩写",
	['user defined substition "%s" not found'] = "找不到玩家自定义文字缩写「%s」",
	["user substitutions index (usersubs_idx) doesn't exist! oh dear."] = "找不到玩家自定义文字缩写索引 (usersubs_idx)!",
	["can't find substitution index for a substitution named '%s'"] = "找不到「%s」的玩家自定义文字缩写索引",
	['removing user defined substitution "%s"; previously expanded to => "%s"'] = "已移除玩家自定义文字缩写「%s」; 先前定义为 => 「%s」",
	['substitution: %s defined as => %s'] = "文字缩写: %s => %s",
	['%d total user defined substitutions'] = "%d个玩家自定义文字缩写",
	['Prat_Substitutions:buildUserSubsIndex(): warning: module patterns not defined!'] = "Prat_Substitutions:buildUserSubsIndex(): 警告: modpats未定义!",

	["<notarget>"] = "<沒有目标>",
	["male"] = "男",
	["female"] = "女",
	["unknown sex"] = "未知的性別",
	["<noguild>"] = "<沒有公会>",
	["his"] = "他的",
	["hers"] = "她的",
	["its"] = "它的",
	["him"] = "他",
	["her"] = "她",
	["it"] = "它",

	['usersub_'] = "玩家自定义-",
	["TargetHealthDeficit"] = "目标已损失生命力",
	["TargetPercentHP"] = "目标生命力百分比",
	["TargetPronoun"] = "目标代名词",
	["PlayerHP"] = "玩家生命力",
	["PlayerName"] = "玩家名字",
	["PlayerMaxHP"] = "玩家最大生命力",
	["PlayerHealthDeficit"] = "玩家已损失生命力",
	["PlayerPercentHP"] = "玩家生命力百分比",
	["PlayerCurrentMana"] = "玩家法力",
	["PlayerMaxMana"] = "玩家最大法力",
	["PlayerPercentMana"] = "玩家法力百分比",
	["PlayerManaDeficit"] = "玩家已损失法力",
	["TargetName"] = "目标名字",
	["TargetTargetName"] = "目标的目标名字",
	["TargetClass"] = "目标职业",
	["TargetHealth"] = "目标生命力",
	["TargetRace"] = "目标种族",
	["TargetGender"] = "目标性別",
	["TargetLevel"] = "目标等級",
	["TargetPossesive"] = "目标所有格",
	["TargetManaDeficit"] = "目标已损失法力",
	["TargetGuild"] = "目标公会",
	["MapZone"] = "地区",
	["MapLoc"] = "子地区",
	["MapPos"] = "坐标",
	["MapYPos"] = "Y坐标",
	["MapXPos"] = "X坐标",
	["RandNum"] = "随机数字",
} end)

L[LIB.NEWLOCALE](L, "zhTW", function() return {
	["Substitutions"] = "文字縮寫",
	["A module to provide basic chat substitutions."] = "提供基本的聊天輸出文字縮寫功能。",
	['User defined substitutions'] = "玩家自訂文字縮寫",
	['Options for setting and removing user defined substitutions. (NB: users may define custom values for existing substitutions, but they will revert to the default value if the user definition is deleted.)'] = "設定或移除玩家自訂文字縮寫的選項。 (注意: 玩家可覆寫預設的文字縮寫，但移除自訂文字縮寫後預設的文字縮寫會還原回預設值。)",
	['Set substitution'] = "設定文字縮寫",
	['Set the value of a user defined substitution (NB: this may be the same as an existing default substitution; to reset it to the default, just remove the user created definition).'] = "設定玩家自訂文字縮寫。 (注意: 玩家可覆寫預設的文字縮寫，但移除自訂文字縮寫後預設的文字縮寫會還原回預設值。)",
	['subname = text after expansion -- NOTE: sub name without the prefix "%"'] = "文字縮寫 = 實際輸出文字 -- 注意: 文字縮寫不包括「%」",
	['List substitutions'] = "列出文字縮寫",
	['Lists all current subtitutions in the default chat frame'] = "在預設的聊天視窗列出全部玩家自訂文字縮寫。",
	['Delete substitution'] = "移除文字縮寫",
	['Deletes a user defined substitution'] = "移除玩家自訂文字縮寫。",
	['subname -- NOTE: sub name without the prefix \'%\''] = "文字縮寫 -- 注意: 文字縮寫不包括「%」",
	['Are you sure?'] = "確定?",
	['Delete all'] = "移除全部",
	['Deletes all user defined substitutions'] = "移除全部玩家自訂文字縮寫。",
	['Are you sure - this will delete all user defined substitutions and reset defaults?'] = "確定移除全部玩家自訂文字縮寫?",
	['List of available substitutions'] = "可用的文字縮寫列表",
	['List of available substitutions defined by this module. (NB: users may define custom values for existing substitutions, but they will revert to the default value if the user definition is deleted.)'] = "此模組定義的可用文字縮寫列表。 (注意: 玩家可覆寫預設的文字縮寫，但移除自訂文字縮寫後預設的文字縮寫會還原回預設值。)",
	["NO MATCHFUNC FOUND"] = "找不到 matchfunc()",
	["Current value: '%s'\nClick to paste into the chat."] = "現在的值: 「%s」\n左擊貼入聊天輸入框。",
	['no substitution name given'] = "沒有提供文字縮寫名稱",
	['no value given for subtitution "%s"'] = "文字縮寫「%s」沒有實際輸出文字",
	['|cffff0000warning:|r subtitution "%s" already defined as "%s", overwriting'] = "|cffff0000警告:|r 文字縮寫「%s」早已定義為「%s」，將會覆寫",
	['defined %s: expands to => %s'] = "已定義%s: => %s",
	['no substitution name supplied for deletion'] = "沒有提供要移除的文字縮寫名稱",
	['no user defined subs found'] = "找不到玩家自訂文字縮寫",
	['user defined substition "%s" not found'] = "找不到玩家自訂文字縮寫「%s」",
	["user substitutions index (usersubs_idx) doesn't exist! oh dear."] = "找不到玩家自訂文字縮寫索引 (usersubs_idx)!",
	["can't find substitution index for a substitution named '%s'"] = "找不到「%s」的玩家自訂文字縮寫索引",
	['removing user defined substitution "%s"; previously expanded to => "%s"'] = "已移除玩家自訂文字縮寫「%s」; 先前定義為 => 「%s」",
	['substitution: %s defined as => %s'] = "文字縮寫: %s => %s",
	['%d total user defined substitutions'] = "%d個玩家自訂文字縮寫",
	['Prat_Substitutions:buildUserSubsIndex(): warning: module patterns not defined!'] = "Prat_Substitutions:buildUserSubsIndex(): 警告: modpats未定義!",

	["<notarget>"] = "<沒有目標>",
	["male"] = "男",
	["female"] = "女",
	["unknown sex"] = "未知的性別",
	["<noguild>"] = "<沒有公會>",
	["his"] = "他的",
	["hers"] = "她的",
	["its"] = "它的",
	["him"] = "他",
	["her"] = "她",
	["it"] = "它",

	['usersub_'] = "玩家自訂-",
	["TargetHealthDeficit"] = "目標已損失生命力",
	["TargetPercentHP"] = "目標生命力百分比",
	["TargetPronoun"] = "目標代名詞",
	["PlayerHP"] = "玩家生命力",
	["PlayerName"] = "玩家名字",
	["PlayerMaxHP"] = "玩家最大生命力",
	["PlayerHealthDeficit"] = "玩家已損失生命力",
	["PlayerPercentHP"] = "玩家生命力百分比",
	["PlayerCurrentMana"] = "玩家法力",
	["PlayerMaxMana"] = "玩家最大法力",
	["PlayerPercentMana"] = "玩家法力百分比",
	["PlayerManaDeficit"] = "玩家已損失法力",
	["TargetName"] = "目標名字",
	["TargetTargetName"] = "目標的目標名字",
	["TargetClass"] = "目標職業",
	["TargetHealth"] = "目標生命力",
	["TargetRace"] = "目標種族",
	["TargetGender"] = "目標性別",
	["TargetLevel"] = "目標等級",
	["TargetPossesive"] = "目標所有格",
	["TargetManaDeficit"] = "目標已損失法力",
	["TargetGuild"] = "目標公會",
	["TargetIcon"] = "目標圖示",
	["MapZone"] = "地區",
	["MapLoc"] = "子地區",
	["MapPos"] = "座標",
	["MapYPos"] = "y座標",
	["MapXPos"] = "x座標",
	["RandNum"] = "隨機數字",
} end)

L[LIB.NEWLOCALE](L, "deDE", function() return {
    ["Substitutions"] = "Ersetzungen",
    ["A module to provide basic chat substitutions."] = "Ein Modul, um grundlegende Chat-Ersetzungen zur Verf\195\188gung zu stellen.",
} end)

L[LIB.NEWLOCALE](L, "koKR", function() return {
    ["Substitutions"] = "대체",
    ["A module to provide basic chat substitutions."] = "기본 대화 대체를 제공하는 모듈입니다.",
} end)

L[LIB.NEWLOCALE](L, "esES", function() return {
    ["Substitutions"] = "Sustituciones",
    ["A module to provide basic chat substitutions."] = "Un módulo que provee sustituciones de chat básicas.",
} end)

-- get prat module categories
local cat = Prat.Categories

-- create prat module
Prat_Substitutions = Prat:NewModule(PRAT_MODULE)
local Prat_Substitutions = Prat_Substitutions
Prat_Substitutions.pratModuleName = PRAT_MODULE
Prat_Substitutions.revision = tonumber(string.sub("$Revision: 80138 $", 12, -3))

-- define key module values
Prat_Substitutions.moduleName = L["Substitutions"]
Prat_Substitutions.moduleDesc = L["A module to provide basic chat substitutions."]

Prat_Substitutions.consoleName = string.lower(Prat_Substitutions.moduleName)
Prat_Substitutions.guiName = Prat_Substitutions.moduleName

-- list here: http://groups-beta.google.com/group/wow-prat/web/prat-categories
Prat_Substitutions.Categories	= { cat.FILTER, cat.INFO, cat.TEXT }

-- init moduleOoptions (which gets populated by the other options tables below)
Prat_Substitutions.moduleOptions	= {}

-- default values for any settings that need them
Prat_Substitutions.defaultDB = {
	on		= false,
	usersubs	= {},
	}

-- any boolean options
Prat_Substitutions.toggleOptions	= {}
Prat_Substitutions.usersubs_idx		= {}
Prat_Substitutions.modulePatterns	= {}

local usersub		= function(subname) return Prat_Substitutions:userSub(subname) end
local util, DBG, CLR = GetPratUtils()

local Prat = Prat

local LIB = PRATLIB
local PRAT_LIBRARY = PRAT_LIBRARY
--[[------------------------------------------------
Module Event Functions
------------------------------------------------]]--

local clrsubname = function(subname)
	subname = subname or ''

	return '|cff78ff64' .. subname .. '|r'
end

local clrexpansion = function(expandsto)
	expandsto = expandsto or ''

	return '|cff8ca0ff' .. expandsto .. '|r'
end

local fmtsubname = function(subname)
	if not subname then return false end

	subname = '%' .. subname

	return clrsubname(subname)
end


-- things to do when the module is enabled
function Prat_Substitutions:OnModuleEnable()
	self:BuildModuleOptions()
end


-- add module options not covered by templates
function Prat_Substitutions:GetModuleOptions()
	self.moduleOptions = {
		name	= self.moduleName,
		desc	= self.moduleDesc,
		type	= 'group',
		hidden	= function() self:BuildModuleOptions() end,


		args = {
			--[[ section including options for managing user defined substitutions ]]--
			USERDEFHEADER = { type = 'header',
				name	= L['User defined substitutions'],
				desc	= L['Options for setting and removing user defined substitutions. (NB: users may define custom values for existing substitutions, but they will revert to the default value if the user definition is deleted.)'],
				order	= 100,
				},

			--[[ substitution management ]]
			setsub = {
				name	= L['Set substitution'],
				desc	= L['Set the value of a user defined substitution (NB: this may be the same as an existing default substitution; to reset it to the default, just remove the user created definition).'],
				usage	= L['subname = text after expansion -- NOTE: sub name without the prefix "%"'],
				order	= 110,
				type	= 'text',
				get	= false,
				set	= function(v)
						local name, value = self:splitArgs(v)
						return self:setSub(name, value)
					end
				},

			listsubs = {
				name	= L['List substitutions'],
				desc	= L['Lists all current subtitutions in the default chat frame'],
				type	= 'execute',
				order	= 120,
				func	= function() return self:listSubs() end,
				},


			delsub = {
				name	= L['Delete substitution'],
				desc	= L['Deletes a user defined substitution'],
				usage	= L['subname -- NOTE: sub name without the prefix \'%\''],
				order	= 130,
				type	= 'text',
				set	= function(v) return self:delSub(v) end,
				get	= false,
				confirm	= L['Are you sure?'],
				},


			--[[
			delall = {
				name	= L['Delete all'],
				desc	= L['Deletes all user defined substitutions'],
				type	= 'execute',
				order	= 140,
				func	= function() return self:delAllSubs() end,
				confirm	= L['Are you sure - this will delete all user defined substitutions and reset defaults?'],
				},
			]]


			--[[ blank line before header ]]--
			blankline = { type = 'header', order = 499 },

			--[[ lists subs below ]]--
			LISTHEADER = { type = 'header',
				name	= L['List of available substitutions'],
				desc	= L['List of available substitutions defined by this module. (NB: users may define custom values for existing substitutions, but they will revert to the default value if the user definition is deleted.)'],
				order	= 500,
				}

			-- NB: subs list build in the BuildModuleOptions() function, below
			},
	}

	return self.moduleOptions
end


function Prat_Substitutions:BuildModuleOptions()
	self.modulePatterns	= self:getInitialModulePatterns()
	self:addUserSubs()

	local args	= self.moduleOptions.args
	local order	= 500				-- starting val
	local usersubs	= Prat_Substitutions.db.profile.usersubs

	self.buildingMenu = true

	-- process standard module subtitutions
	for k,v in pairs(self.modulePatterns) do
		-- self:print('k, v.pattern: ' .. k .. ' + ' .. v.pattern)
		local name	= v.optname
		local pat	= string.gsub(v.pattern, "%%%%", "%%")

		order	= order + 10

		args[name] = args[name] or {}
		local d = args[name]

		d.name = name.." "..pat

		local matchfuncval = ""

		if v.matchfunc then
			matchfuncval = v.matchfunc() or ""
		else
			matchfuncval = L["NO MATCHFUNC FOUND"]
		end

		d.desc	= L["Current value: '%s'\nClick to paste into the chat."]:format(matchfuncval)
		d.type	= "execute"
		d.func	= function() self:DoPat(pat) end
		d.order	= order
	end

	-- all done
	self.buildingMenu = false
end



--[[------------------------------------------------
Core Functions
------------------------------------------------]]--





function Prat_Substitutions:splitArgs(str)
	-- make sure str is set, and not empty
	if (not str) or (str == '') then return false end

	-- str should be "<command>[=value| value]"
	local name, value

	-- should only match (word) (space or assignment operator) (value)
	for k, v in str:gmatch("%%?(%w+)%s*[%s=]%s*(.-)$") do
		name	= string.lower(k)
		value	= v or ''

		-- self:print('name ' .. name)
		-- self:print('value ' .. value)
	end

	return name, value
end


function Prat_Substitutions:print(msg)
	local colour	= 'ad66ff'

	msg = msg:gsub('[Ss]ubstitutions:%s*', '')

	util:print('|cff' .. colour .. 'Substitutions:|r ' .. msg)
end



-- :cleanStr - always returns at least a blank string

--	if passed a nil string, returns ""
--	takes a string an trims it, removes dodgy characters, and returns it

function Prat_Substitutions:cleanStr(str)
	if (not str) or (str == '') then return "" end

	str	= strtrim(str)
	--str	= str:gsub("[%w^a-z0-9'%\"_.- ]", '')
	str	= str:gsub('[%z%c|]', '')

	return str
end


local pattable = {}

function Prat_Substitutions:setSub(subname, expandsto)
	if not subname then return false end

	expandsto	= expandsto or ''

	subname		= self:cleanStr(subname)
	expandsto	= self:cleanStr(expandsto)

	if subname == '' then
		self:print(L['no substitution name given'])
		return false
	end

	if expandsto == '' then
		self:print(string.format(L['no value given for subtitution "%s"'], fmtsubname(subname)))
		return false
	end

	local usersubs	= self.db.profile.usersubs
	local existing	= usersubs[subname]

	if existing then
		self:print(string.format(L['|cffff0000warning:|r subtitution "%s" already defined as "%s", overwriting'], fmtsubname(subname), clrexpansion(existing)))
	end

	-- { pattern = "(%%tn)", matchfunc=TargetName, optname="TargetName", type = "OUTBOUND"},

	local totalsubs = #Prat_Substitutions.modulePatterns
	local idx	= totalsubs + 1

	pattable	= self:patternTable(subname, expandsto)

	-- tell user we have a new sub of subname -> expandsto
	table.insert(Prat_Substitutions.modulePatterns, pattable)

	self:print(L['defined %s: expands to => %s']:format(fmtsubname(subname), clrexpansion(expandsto)))
	self.db.profile.usersubs[subname] = expandsto

	self:BuildModuleOptions()
	self:buildUserSubsIndex()
end


-- function to return a table suitable for inserting into Prat_Substitutions.modulePatterns
function Prat_Substitutions:patternTable(subname, expandsto)
	if not subname and expandsto then return false end


	--[[
	local pattern = {
		pattern = '(%%'..subname..')',
		matchfunc=function() return Prat_Substitutions:userSub(subname) end,
		optname='usersub_'..subname,
		type='OUTBOUND'
		}
	]]

	local pattern = {
		idx		= idx,
		pattern		= '(%%' .. subname .. ')',
		matchfunc	= function() return Prat_Substitutions:userSub(subname) end,
		optname		= L['usersub_'] .. subname,
		type		= 'OUTBOUND',
		}

	return pattern
end


function Prat_Substitutions:delSub(subname)
	local usersubs		= self.db.profile.usersubs
	local subname		= self:cleanStr(subname)

	-- check shit
	if not subname or (subname == '') then
		self:print(L['no substitution name supplied for deletion'])
		return false
	end

	if not usersubs then
		self:print(L['no user defined subs found'])
		return false
	end

	if not usersubs[subname] then
		self:print(string.format(L['user defined substition "%s" not found'], fmtsubname(subname)))
		return false
	end

	if (type(usersubs_idx) ~= 'table') then
		self:print(L["user substitutions index (usersubs_idx) doesn't exist! oh dear."])
		return false
	end

	local subidx		= usersubs_idx[subname]

	if not subidx then
		self:print(string.format(L["can't find substitution index for a substitution named '%s'"], fmtsubname(subname)))
		return false
	end

	local expandsto	= usersubs[subname]

	self:print(string.format(L['removing user defined substitution "%s"; previously expanded to => "%s"'], fmtsubname, clrexpansion(expandsto)))

	self.modulePatterns[subidx]		= nil
	self.db.profile.usersubs[subname]	= nil
	self.usersubs_idx[subname]		= nil

	self:BuildModuleOptions()
	self:buildUserSubsIndex()
end

function Prat_Substitutions:delAllSubs()
	local usersubs = self.db.profile.usersubs

	if not (usersubs and subname) then return false end

	for subname, expandsto in pairs(usersubs) do
		self:delSub(subname)
	end

end


function Prat_Substitutions:listSubs()
	local usersubs = self.db.profile.usersubs

	if type(usersubs) ~= 'table' then
		self:print(L['no user defined subs found'])
		return 51
	end

	local total = 0

	for subname, expandsto in pairs(usersubs) do
		self:print(L['substitution: %s defined as => %s']:format(fmtsubname(subname), clrexpansion(expandsto)))

		total = total + 1
	end

	self:print(string.format(L['%d total user defined substitutions'], total))
end


function Prat_Substitutions:userSub(subname)
	local usersubs	= self.db.profile.usersubs
	local expandsto

	if not usersubs then return false end

	expandsto	= usersubs[subname] or ""

	return expandsto
end

function  Prat_Substitutions:DoPat(pat)
	local e = ChatFrameEditBox
	if not e:IsVisible() then
		return
	end

	e:SetText((e:GetText() or "")..pat:gsub("[%(%)]", ""))
end

local function prat_match(text)
	local text = text or ""

	if Prat_Substitutions.buildingMenu then
		return text
	end

	return Prat:RegisterMatch(text, "OUTBOUND")
end

local function Zone(...)
	return prat_match(GetZoneText())
end

local function Loc(...)
	return prat_match(GetMinimapZoneText())
end

local function Pos()
	local x,y = GetPlayerMapPosition("player")
	local str = "("..math.floor((x * 100) + 0.5)..","..math.floor((y * 100) + 0.5)..")"
	return prat_match(str)
end

local function Ypos()
	local x, y = GetPlayerMapPosition("player")
	local y = tostring(math.floor((y * 100) + 0.5))
	return prat_match(y)
end

local function Xpos()
	local x, y = GetPlayerMapPosition("player")
	local x = tostring(math.floor((x * 100) + 0.5))
	return prat_match(x)
end

local function PlayerHP(...)
	return prat_match(UnitHealth("player"))
end

local function PlayerMaxHP(...)
	return prat_match(UnitHealthMax("player"))
end

local function PlayerPercentHP()
	return prat_match(floor(100 * (UnitHealth("player") / UnitHealthMax("player"))))
end

local function PlayerHealthDeficit()
	return prat_match(UnitHealthMax("player") - UnitHealth("player"))
end

local function PlayerCurrentMana()
	return prat_match(UnitMana("player"))
end

local function PlayerMaxMana()
	return prat_match(UnitManaMax("player"))
end

local function PlayerPercentMana()
	return prat_match(string.format("%.0f%%%%",
	floor(100 * (UnitMana("player")/UnitManaMax("player")))))
end

local function PlayerManaDeficit()
	return prat_match(UnitManaMax("player") - UnitMana("player"))
end



local function TargetPercentHP()
	local str = L["<notarget>"]
	if UnitExists("target") then
		str = string.format("%.0f%%%%", floor(100 * (UnitHealth("target") / UnitHealthMax("target"))))
	end

	return prat_match(str)
end

local function TargetHealth()
	local str = L["<notarget>"]
	if UnitExists("target") then
		str = UnitHealth("target")
	end

	return prat_match(str)
end

local function TargetHealthDeficit()
	local str = L["<notarget>"]
	if UnitExists("target") then
		str = UnitHealthMax("target") - UnitHealth("target")
	end

	return prat_match(str)
end

local function TargetManaDeficit()
	local str = L["<notarget>"]
	if UnitExists("target") then
		str = UnitManaMax("target") - UnitMana("target")
	end

	return prat_match(str)
end


local function TargetClass()
	local class = L["<notarget>"]
	if UnitExists("target") then
		class = UnitClass("target")
	end

	return prat_match(class)
end

local raidiconpfx = ICON_TAG_RAID_TARGET_STAR1:sub(1,-2) or "rt"

local function TargetIcon()
	local icon = ""
	if UnitExists("target") then
		local iconnum = GetRaidTargetIndex("target")

		if type(iconnum) ~= "nil" then
			icon = ("{%s%d}"):format(raidiconpfx, tostring(iconnum))
		end
	end

	return prat_match(icon)
end


local function TargetRace()
	local race = L["<notarget>"]
	if UnitExists("target") then
		if UnitIsPlayer("target") then
			race = UnitRace("target")
		else
			race = UnitCreatureFamily("target")
			if not race then
				race = UnitCreatureType("target")
			end
		end
	end
	return prat_match(race)
end
local function TargetGender()
	local sex = L["<notarget>"]
	if UnitExists("target") then
		s = UnitSex("target")
		if(s == 2) then
			sex = L["male"]
		elseif (s == 3) then
			sex = L["female"]
		else
			sex = L["unknown sex"]
		end
	end

	return prat_match(sex)
end

local function TargetLevel()
	local level = L["<notarget>"]
	if UnitExists("target") then
		level = UnitLevel("target")
	end
	return prat_match(level)
end

local function TargetGuild()
	local guild = L["<notarget>"]
	if UnitExists("target") then
		guild = L["<noguild>"]
		if IsInGuild("target") then
			guild = GetGuildInfo("target") or ""
		end
	end
	return prat_match(guild)
end

-- %tps (possesive)
local function TargetPossesive()
	local p = L["<notarget>"]
	if UnitExists("target") then
		local s = UnitSex("target")
		if(s == 2) then
			p = L["his"]
		elseif (s == 3) then
			p = L["hers"]
		else
			p = L["its"]
		end
	end

	return prat_match(p)
end

-- %tpn (pronoun)
local function TargetPronoun()
	local p = L["<notarget>"]
	if UnitExists("target") then
		local s = UnitSex("target")
		if(s == 2) then
			p = L["him"]
		elseif (s == 3) then
			p = L["her"]
		else
			p = L["it"]
		end
	end
	return prat_match(p)
end

-- %tn (target)
local function TargetName()
	local t = L['<notarget>']

	if UnitExists("target") then
		t = UnitName("target")
	end

	return prat_match(t)
end

-- %tt (target)
local function TargetTargetName()
	local t = L['<notarget>']

	if UnitExists("targettarget") then
		t = UnitName("targettarget")
	end

	return prat_match(t)
end

-- %pn (player)
local function PlayerName()
	local p = GetUnitName("player") or ""
	return prat_match(p)
end

local function Rand()
	return math.random(1, 100)
end

--[[
* %tn = current target
* %pn = player name
* %hc = your current health
* %hm = your max health
* %hp = your percentage health
* %hd = your current health deficit
* %mc = your current mana
* %mm = your max mana
* %mp = your percentage mana
* %md = your current mana deficit
* %thp = target's percentage health
* %th = target's current health
* %td = target's health deficit
* %tc = class of target
* %tr = race of target
* %ts = sex of target
* %tl = level of target
* %ti = raid icon of target
* %tps = possesive for target (his/hers/its)
* %tpn = pronoun for target (him/her/it)
* %fhp = focus's percentage health
* %fc = class of focus
* %fr = race of focus
* %fs = sex of focus
* %fl = level of focus
* %fps = possesive for focus (his/hers/its)
* %fpn = pronoun for focus (him/her/it)
* %tt = target of target
* %zon = your current zone (Dun Morogh, Hellfire Peninsula, etc.)
* %loc = your current subzone (as shown on the minimap)
* %pos = your current coordinates (x,y)
* %ypos = your current y coordinate
* %xpos = your current x coordinate
* %rnd = a random number between 1 and 100
--]]

function Prat_Substitutions:getInitialModulePatterns()
	local modulePatterns = {
		{ pattern = "(%%thd)", matchfunc=TargetHealthDeficit, optname=L["TargetHealthDeficit"], type = "OUTBOUND"},
		{ pattern = "(%%thp)", matchfunc=TargetPercentHP, optname=L["TargetPercentHP"],  type = "OUTBOUND"},
		{ pattern = "(%%tpn)", matchfunc=TargetPronoun, optname=L["TargetPronoun"],  type = "OUTBOUND"},

		{ pattern = "(%%hc)", matchfunc=PlayerHP, optname=L["PlayerHP"],  type = "OUTBOUND"},
		{ pattern = "(%%pn)", matchfunc=PlayerName, optname=L["PlayerName"], type = "OUTBOUND"},
		{ pattern = "(%%hm)", matchfunc=PlayerMaxHP, optname=L["PlayerMaxHP"],  type = "OUTBOUND"},
		{ pattern = "(%%hd)", matchfunc=PlayerHealthDeficit, optname=L["PlayerHealthDeficit"], type = "OUTBOUND"},
		{ pattern = "(%%hp)", matchfunc=PlayerPercentHP, optname=L["PlayerPercentHP"],  type = "OUTBOUND"},
		{ pattern = "(%%mc)", matchfunc=PlayerCurrentMana, optname=L["PlayerCurrentMana"],  type = "OUTBOUND"},
		{ pattern = "(%%mm)", matchfunc=PlayerMaxMana, optname=L["PlayerMaxMana"],  type = "OUTBOUND"},
		{ pattern = "(%%mp)", matchfunc=PlayerPercentMana, optname=L["PlayerPercentMana"],  type = "OUTBOUND"},
		{ pattern = "(%%pmd)", matchfunc=PlayerManaDeficit, optname=L["PlayerManaDeficit"], type = "OUTBOUND"},

		{ pattern = "(%%tn)", matchfunc=TargetName, optname=L["TargetName"], type = "OUTBOUND"},
		{ pattern = "(%%tt)", matchfunc=TargetTargetName, optname=L["TargetTargetName"], type = "OUTBOUND"},
		{ pattern = "(%%tc)", matchfunc=TargetClass, optname=L["TargetClass"], type = "OUTBOUND"},
		{ pattern = "(%%th)", matchfunc=TargetHealth, optname=L["TargetHealth"], type = "OUTBOUND"},
		{ pattern = "(%%tr)", matchfunc=TargetRace, optname=L["TargetRace"],  type = "OUTBOUND"},
		{ pattern = "(%%ts)", matchfunc=TargetGender, optname=L["TargetGender"],  type = "OUTBOUND"},
		{ pattern = "(%%ti)", matchfunc=TargetIcon, optname=L["TargetIcon"],  type = "OUTBOUND"},
		{ pattern = "(%%tl)", matchfunc=TargetLevel, optname=L["TargetLevel"],  type = "OUTBOUND"},
		{ pattern = "(%%tps)", matchfunc=TargetPossesive, optname=L["TargetPossesive"],  type = "OUTBOUND"},
		{ pattern = "(%%tmd)", matchfunc=TargetManaDeficit, optname=L["TargetManaDeficit"], type = "OUTBOUND"},
		{ pattern = "(%%tg)", matchfunc=TargetGuild, optname=L["TargetGuild"], type = "OUTBOUND"},


		{ pattern = "(%%zon)", matchfunc=Zone, optname=L["MapZone"],  type = "OUTBOUND"},
		{ pattern = "(%%loc)", matchfunc=Loc, optname=L["MapLoc"],  type = "OUTBOUND"},
		{ pattern = "(%%pos)", matchfunc=Pos, optname=L["MapPos"],  type = "OUTBOUND"},
		{ pattern = "(%%ypos)", matchfunc=Ypos, optname=L["MapYPos"],  type = "OUTBOUND"},
		{ pattern = "(%%xpos)", matchfunc=Xpos, optname=L["MapXPos"],  type = "OUTBOUND"},
		{ pattern = "(%%rnd)", matchfunc=Rand, optname=L["RandNum"], type = "OUTBOUND"},

		--~	 { pattern = "(%%tn)", matchfunc=TargetName, optname="Target", type = "OUTBOUND"},
		--~	 { pattern = "(%%pn)", matchfunc=PlayerName, optname="Player", type = "OUTBOUND"}
		}

		--[[ TODO:
		%%fhp - focus health
		%%fr
		%%fc
		%%fs
		%%fl
		%%fvr
		%%fvn
		]]

	return modulePatterns
end

function Prat_Substitutions:userSubIdx(subname)
	if not subname then return false end

	local usersubs_idx	= self.usersubs_idx or {}

	if usersubs_idx[subname] then
		return usersubs_idx[subname]
	end

	local tmpsubname

	for idx, pattern in Prat_Substitutions.modulePatterns do
		tmpsubname = pattern.optname:gsub('^user_', '')

		if usersubs[tmpsubname] then
			usersubs_idx[tmpsubname] = idx

			return idx
		end
	end

	return false
end


function Prat_Substitutions:addUserSubs()
	self.usersubs_idx = {}

	for subname, expandsto in pairs(self.db.profile.usersubs) do
		local pattable = self:patternTable(subname, expandsto)

		table.insert(self.modulePatterns, pattable)

		self.usersubs_idx = pattable.idx
	end
end

function Prat_Substitutions:buildUserSubsIndex()
	local usersubs		= self.db.profile.usersubs
	local modpats		= self.modulePatterns

	self.usersubs_idx = {}

	if not modpats then
		self:print(L['Prat_Substitutions:buildUserSubsIndex(): warning: module patterns not defined!'])
		return false
	end

	for idx, pattern in ipairs(modpats) do
		local subname = pattern.optname:gsub('^user_', '')

		if usersubs[subname] then
			usersubs_idx[subname]				= idx
			Prat_Substitutions.usersubs_idx[subname]	= idx
		end
	end

	return usersubs_idx
end
