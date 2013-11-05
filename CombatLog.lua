local frame = CreateFrame("Frame", nil, UIParent)
local function combatlog(self, event, ...)
        local timestamp, event, sourceGUID,sourceName,sourceFlags,destGUID,destName,destFlags,spellID,spellName = select(1, ...)
		if not timestamp then timestamp = "noTimestamp" end
		if not event then event = "noEvent" end
		if not sourceGUID then sourceGUID = "noSrcGUID" end
		if not sourceName then sourceName = "noSrcName" end
		if not sourceFlags then sourceFlags = "noSrcFlags" end
		if not destGUID then destGUID = "noDestGUID" end
		if not destName then destName = "noDestName" end
		if not destFlags then destFlags = "noDestFlags" end
		if not spellID then spellID = "noSpelLID" end
		if not spellName then spellName = "noSpellName" end
		--DEFAULT_CHAT_FRAME:AddMessage(timestamp.."  "..event.."  "..sourceGUID.."  "..sourceName.."  "..sourceFlags.."  "..destGUID.."  "..destName.."  "..destFlags.."  "..spellID.."  "..spellName)]]
		
		if event == "SPELL_DISPEL" then
			timestamp, event, sourceGUID,sourceName,sourceFlags,destGUID,destName,destFlags,spellID, spellName, arg14, arg15, arg16, arg17, arg18 = select(1, ...)
			DEFAULT_CHAT_FRAME:AddMessage(event.."  "..arg14.."  "..arg15.."  "..arg16.."  "..arg17.."  "..arg18.."  "..arg19)
		end
		
		if event == "SPELL_CAST_FAILED" then
			timestamp, event, sourceGUID,sourceName,sourceFlags,destGUID,destName,destFlags,spellID, spellName, arg14, arg15 = select(1, ...)
			DEFAULT_CHAT_FRAME:AddMessage(event.."  "..arg14.."  "..arg15)
		end
end
frame:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
frame:SetScript("OnEvent", combatlog)