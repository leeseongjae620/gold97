	const_def 2 ; object constants
	const GOLDENRODGAMECORNER_CLERK
	const GOLDENRODGAMECORNER_RECEPTIONIST1
	const GOLDENRODGAMECORNER_RECEPTIONIST2
	const GOLDENRODGAMECORNER_PHARMACIST1
	const GOLDENRODGAMECORNER_PHARMACIST2
	const GOLDENRODGAMECORNER_POKEFAN_M1
	const GOLDENRODGAMECORNER_COOLTRAINER_M
	const GOLDENRODGAMECORNER_POKEFAN_F
	const GOLDENRODGAMECORNER_COOLTRAINER_F
	const GOLDENRODGAMECORNER_GENTLEMAN
	const GOLDENRODGAMECORNER_POKEFAN_M2
	const GOLDENRODGAMECORNER_MOVETUTOR

BoardwalkGameCorner_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_OBJECTS, .MoveTutor

.MoveTutor:
	checkevent EVENT_BEAT_ELITE_FOUR
	iffalse .finish
	checkitem COIN_CASE
	iffalse .move_tutor_inside
	checkcode VAR_WEEKDAY
	ifequal WEDNESDAY, .move_tutor_outside
	ifequal SATURDAY, .move_tutor_outside
.move_tutor_inside
	appear GOLDENRODGAMECORNER_MOVETUTOR
	return

.move_tutor_outside
	checkflag ENGINE_DAILY_MOVE_TUTOR
	iftrue .finish
	disappear GOLDENRODGAMECORNER_MOVETUTOR
.finish
	return

MoveTutorInsideScript:
	faceplayer
	opentext
	writetext MoveTutorInsideText
	waitbutton
	closetext
	turnobject GOLDENRODGAMECORNER_MOVETUTOR, RIGHT
	end

BoardwalkGameCornerCoinVendorScript:
	jumpstd gamecornercoinvendor

BoardwalkGameCornerSpecialVendorScript:
	faceplayer
	opentext
	writetext BoardwalkGameCornerPrizeVendorIntroText
	waitbutton
	checkitem COIN_CASE
	iffalse BoardwalkGameCornerPrizeVendor_NoCoinCaseScript
	writetext BoardwalkGameCornerPrizeVendorWhichPrizeText
	special DisplayCoinCaseBalance
	loadmenu BoardwalkGameCornerSpecialVendorMenuHeader
	verticalmenu
	closewindow
	ifequal 1, BoardwalkGameCornerStoneVendorScript
	ifequal 2, BoardwalkGameCornerItemVendorScript
	jump BoardwalkGameCornerPrizeVendor_CancelPurchaseScript
	
BoardwalkGameCornerStoneVendorScript:
	special DisplayCoinCaseBalance
	loadmenu BoardwalkGameCornerStoneVendorMenuHeader
	verticalmenu
	closewindow
	ifequal 1, .FireStone
	ifequal 2, .ThunderStone
	ifequal 3, .WaterStone
	ifequal 4, .LeafStone
	ifequal 5, .NextMenu
	jump BoardwalkGameCornerPrizeVendor_CancelPurchaseScript

.FireStone:
	checkcoins 1000
	ifequal HAVE_LESS, BoardwalkGameCornerPrizeVendor_NotEnoughCoinsScript
	itemtotext FIRE_STONE, MEM_BUFFER_0
	scall BoardwalkGameCornerPrizeVendor_ConfirmPurchaseScript
	iffalse BoardwalkGameCornerPrizeVendor_CancelPurchaseScript
	giveitem FIRE_STONE
	iffalse BoardwalkGameCornerPrizeMonVendor_NoRoomForPrizeScript
	takecoins 1000
	jump BoardwalkGameCornerStoneVendor_FinishScript

.ThunderStone:
	checkcoins 1000
	ifequal HAVE_LESS, BoardwalkGameCornerPrizeVendor_NotEnoughCoinsScript
	itemtotext THUNDERSTONE, MEM_BUFFER_0
	scall BoardwalkGameCornerPrizeVendor_ConfirmPurchaseScript
	iffalse BoardwalkGameCornerPrizeVendor_CancelPurchaseScript
	giveitem THUNDERSTONE
	iffalse BoardwalkGameCornerPrizeMonVendor_NoRoomForPrizeScript
	takecoins 1000
	jump BoardwalkGameCornerStoneVendor_FinishScript

.WaterStone:
	checkcoins 1000
	ifequal HAVE_LESS, BoardwalkGameCornerPrizeVendor_NotEnoughCoinsScript
	itemtotext WATER_STONE, MEM_BUFFER_0
	scall BoardwalkGameCornerPrizeVendor_ConfirmPurchaseScript
	iffalse BoardwalkGameCornerPrizeVendor_CancelPurchaseScript
	giveitem WATER_STONE
	iffalse BoardwalkGameCornerPrizeMonVendor_NoRoomForPrizeScript
	takecoins 1000
	jump BoardwalkGameCornerStoneVendor_FinishScript
	
.LeafStone:
	checkcoins 1000
	ifequal HAVE_LESS, BoardwalkGameCornerPrizeVendor_NotEnoughCoinsScript
	itemtotext LEAF_STONE, MEM_BUFFER_0
	scall BoardwalkGameCornerPrizeVendor_ConfirmPurchaseScript
	iffalse BoardwalkGameCornerPrizeVendor_CancelPurchaseScript
	giveitem LEAF_STONE
	iffalse BoardwalkGameCornerPrizeMonVendor_NoRoomForPrizeScript
	takecoins 1000
	jump BoardwalkGameCornerStoneVendor_FinishScript
	
.PoisonStone:
	checkcoins 1000
	ifequal HAVE_LESS, BoardwalkGameCornerPrizeVendor_NotEnoughCoinsScript
	itemtotext POISON_STONE, MEM_BUFFER_0
	scall BoardwalkGameCornerPrizeVendor_ConfirmPurchaseScript
	iffalse BoardwalkGameCornerPrizeVendor_CancelPurchaseScript
	giveitem POISON_STONE
	iffalse BoardwalkGameCornerPrizeMonVendor_NoRoomForPrizeScript
	takecoins 1000
	jump BoardwalkGameCornerStoneVendor_FinishScript
	
.HeartStone:
	checkcoins 1000
	ifequal HAVE_LESS, BoardwalkGameCornerPrizeVendor_NotEnoughCoinsScript
	itemtotext HEART_STONE, MEM_BUFFER_0
	scall BoardwalkGameCornerPrizeVendor_ConfirmPurchaseScript
	iffalse BoardwalkGameCornerPrizeVendor_CancelPurchaseScript
	giveitem HEART_STONE
	iffalse BoardwalkGameCornerPrizeMonVendor_NoRoomForPrizeScript
	takecoins 1000
	jump BoardwalkGameCornerStoneVendor_FinishScript
	
.MoonStone:
	checkcoins 1000
	ifequal HAVE_LESS, BoardwalkGameCornerPrizeVendor_NotEnoughCoinsScript
	itemtotext MOON_STONE, MEM_BUFFER_0
	scall BoardwalkGameCornerPrizeVendor_ConfirmPurchaseScript
	iffalse BoardwalkGameCornerPrizeVendor_CancelPurchaseScript
	giveitem MOON_STONE
	iffalse BoardwalkGameCornerPrizeMonVendor_NoRoomForPrizeScript
	takecoins 1000
	jump BoardwalkGameCornerStoneVendor_FinishScript
	
.NextMenu
	loadmenu BoardwalkGameCornerStoneVendorMenu2Header
	verticalmenu
	closewindow
	ifequal 1, .PoisonStone
	ifequal 2, .HeartStone
	ifequal 3, .MoonStone
	jump BoardwalkGameCornerPrizeVendor_CancelPurchaseScript
	
BoardwalkGameCornerItemVendorScript:
	special DisplayCoinCaseBalance
	loadmenu BoardwalkGameCornerItemVendorMenuHeader
	verticalmenu
	closewindow
	ifequal 1, .KingsRock
	ifequal 2, .MetalCoat
	ifequal 3, .CovenantOrb
	jump BoardwalkGameCornerPrizeVendor_CancelPurchaseScript

.KingsRock:
	checkcoins 2000
	ifequal HAVE_LESS, BoardwalkGameCornerPrizeVendor_NotEnoughCoinsScript
	itemtotext KINGS_ROCK, MEM_BUFFER_0
	scall BoardwalkGameCornerPrizeVendor_ConfirmPurchaseScript
	iffalse BoardwalkGameCornerPrizeVendor_CancelPurchaseScript
	giveitem KINGS_ROCK
	iffalse BoardwalkGameCornerPrizeMonVendor_NoRoomForPrizeScript
	takecoins 2000
	jump BoardwalkGameCornerItemVendor_FinishScript

.MetalCoat:
	checkcoins 2000
	ifequal HAVE_LESS, BoardwalkGameCornerPrizeVendor_NotEnoughCoinsScript
	itemtotext METAL_COAT, MEM_BUFFER_0
	scall BoardwalkGameCornerPrizeVendor_ConfirmPurchaseScript
	iffalse BoardwalkGameCornerPrizeVendor_CancelPurchaseScript
	giveitem METAL_COAT
	iffalse BoardwalkGameCornerPrizeMonVendor_NoRoomForPrizeScript
	takecoins 2000
	jump BoardwalkGameCornerItemVendor_FinishScript

.CovenantOrb:
	checkcoins 3000
	ifequal HAVE_LESS, BoardwalkGameCornerPrizeVendor_NotEnoughCoinsScript
	itemtotext COVENANT_ORB, MEM_BUFFER_0
	scall BoardwalkGameCornerPrizeVendor_ConfirmPurchaseScript
	iffalse BoardwalkGameCornerPrizeVendor_CancelPurchaseScript
	giveitem COVENANT_ORB
	iffalse BoardwalkGameCornerPrizeMonVendor_NoRoomForPrizeScript
	takecoins 3000
	jump BoardwalkGameCornerItemVendor_FinishScript
	
BoardwalkGameCornerSpecialVendorMenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 3, 19, TEXTBOX_Y - 2
	dw .MenuDataSpecial
	db 1 ; default option

.MenuDataSpecial:
	db STATICMENU_CURSOR ; flags
	db 3 ; items
	db "EVOLUTION STONES@"
	db "EVOLUTION ITEMS@"
	db "CANCEL@"

BoardwalkGameCornerStoneVendorMenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 2, 19, TEXTBOX_Y - -1
	dw .MenuDataStone
	db 1 ; default option

.MenuDataStone:
	db STATICMENU_CURSOR ; flags
	db 5 ; items
	db "FIRE STONE   1000@"
	db "THUNDERSTONE 1000@"
	db "WATER STONE  1000@"
	db "LEAF STONE   1000@"
	db "NEXT@"
	
BoardwalkGameCornerStoneVendorMenu2Header:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 2, 19, TEXTBOX_Y - 1
	dw .MenuDataStone2
	db 1 ; default option
	
.MenuDataStone2:
	db STATICMENU_CURSOR ; flags
	db 4 ; items
	db "POISON STONE 1000@"
	db "HEART STONE  1000@"
	db "MOON STONE   1000@"
	db "CANCEL@"
	
BoardwalkGameCornerItemVendorMenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 2, 19, TEXTBOX_Y - 1
	dw .MenuDataItems
	db 1 ; default option

.MenuDataItems:
	db STATICMENU_CURSOR ; flags
	db 4 ; items
	db "KING'S ROCK  2000@"
	db "METAL COAT   2000@"
	db "COVENANT ORB 3000@"
	db "CANCEL@"
	
BoardwalkGameCornerStoneVendor_FinishScript:
	waitsfx
	playsound SFX_TRANSACTION
	writetext BoardwalkGameCornerPrizeVendorHereYouGoText
	waitbutton
	jump BoardwalkGameCornerStoneVendorScript
	
BoardwalkGameCornerItemVendor_FinishScript:
	waitsfx
	playsound SFX_TRANSACTION
	writetext BoardwalkGameCornerPrizeVendorHereYouGoText
	waitbutton
	jump BoardwalkGameCornerItemVendorScript

BoardwalkGameCornerPrizeVendor_ConfirmPurchaseScript:
	writetext BoardwalkGameCornerPrizeVendorConfirmPrizeText
	yesorno
	end

BoardwalkGameCornerPrizeVendor_NotEnoughCoinsScript:
	writetext BoardwalkGameCornerPrizeVendorNeedMoreCoinsText
	waitbutton
	closetext
	end

BoardwalkGameCornerPrizeMonVendor_NoRoomForPrizeScript:
	writetext BoardwalkGameCornerPrizeVendorNoMoreRoomText
	waitbutton
	closetext
	end

BoardwalkGameCornerPrizeVendor_CancelPurchaseScript:
	writetext BoardwalkGameCornerPrizeVendorQuitText
	waitbutton
	closetext
	end

BoardwalkGameCornerPrizeVendor_NoCoinCaseScript:
	writetext BoardwalkGameCornerPrizeVendorNoCoinCaseText
	waitbutton
	closetext
	end

BoardwalkGameCornerPrizeMonVendorScript:
	faceplayer
	opentext
	writetext BoardwalkGameCornerPrizeVendorIntroText
	waitbutton
	checkitem COIN_CASE
	iffalse BoardwalkGameCornerPrizeVendor_NoCoinCaseScript
.loop
	writetext BoardwalkGameCornerPrizeVendorWhichPrizeText
	special DisplayCoinCaseBalance
	loadmenu .MenuHeader
	verticalmenu
	closewindow
	ifequal 1, .abra
	ifequal 2, .cubone
	ifequal 3, .porygon
	jump BoardwalkGameCornerPrizeVendor_CancelPurchaseScript

.abra
	checkcoins 100
	ifequal HAVE_LESS, BoardwalkGameCornerPrizeVendor_NotEnoughCoinsScript
	checkcode VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, BoardwalkGameCornerPrizeMonVendor_NoRoomForPrizeScript
	pokenamemem ABRA, MEM_BUFFER_0
	scall BoardwalkGameCornerPrizeVendor_ConfirmPurchaseScript
	iffalse BoardwalkGameCornerPrizeVendor_CancelPurchaseScript
	waitsfx
	playsound SFX_TRANSACTION
	writetext BoardwalkGameCornerPrizeVendorHereYouGoText
	waitbutton
	writebyte ABRA
	special GameCornerPrizeMonCheckDex
	givepoke ABRA, 5
	takecoins 100
	jump .loop

.cubone
	checkcoins 800
	ifequal HAVE_LESS, BoardwalkGameCornerPrizeVendor_NotEnoughCoinsScript
	checkcode VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, BoardwalkGameCornerPrizeMonVendor_NoRoomForPrizeScript
	pokenamemem CUBONE, MEM_BUFFER_0
	scall BoardwalkGameCornerPrizeVendor_ConfirmPurchaseScript
	iffalse BoardwalkGameCornerPrizeVendor_CancelPurchaseScript
	waitsfx
	playsound SFX_TRANSACTION
	writetext BoardwalkGameCornerPrizeVendorHereYouGoText
	waitbutton
	writebyte CUBONE
	special GameCornerPrizeMonCheckDex
	givepoke CUBONE, 15
	takecoins 800
	jump .loop

.porygon
	checkcoins 2500
	ifequal HAVE_LESS, BoardwalkGameCornerPrizeVendor_NotEnoughCoinsScript
	checkcode VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, BoardwalkGameCornerPrizeMonVendor_NoRoomForPrizeScript
	pokenamemem PORYGON, MEM_BUFFER_0
	scall BoardwalkGameCornerPrizeVendor_ConfirmPurchaseScript
	iffalse BoardwalkGameCornerPrizeVendor_CancelPurchaseScript
	waitsfx
	playsound SFX_TRANSACTION
	writetext BoardwalkGameCornerPrizeVendorHereYouGoText
	waitbutton
	writebyte PORYGON
	special GameCornerPrizeMonCheckDex
	givepoke PORYGON, 12
	takecoins 2500
	jump .loop

.MenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 2, 17, TEXTBOX_Y - 1
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR ; flags
	db 4 ; items
	db "ABRA        100@"
	db "CUBONE      800@"
	db "PORYGON    2500@"
	db "CANCEL@"

BoardwalkGameCornerPharmacistScript:
	faceplayer
	opentext
	writetext BoardwalkGameCornerPharmacistText
	waitbutton
	closetext
	turnobject LAST_TALKED, LEFT
	end

BoardwalkGameCornerPokefanM1Script:
	faceplayer
	opentext
	writetext BoardwalkGameCornerPokefanM1Text
	waitbutton
	closetext
	turnobject GOLDENRODGAMECORNER_POKEFAN_M1, RIGHT
	end

BoardwalkGameCornerCooltrainerMScript:
	faceplayer
	opentext
	writetext BoardwalkGameCornerCooltrainerMText
	waitbutton
	closetext
	turnobject GOLDENRODGAMECORNER_COOLTRAINER_M, LEFT
	end

BoardwalkGameCornerPokefanFScript:
	faceplayer
	opentext
	writetext BoardwalkGameCornerPokefanFText
	waitbutton
	closetext
	turnobject GOLDENRODGAMECORNER_POKEFAN_F, RIGHT
	end

BoardwalkGameCornerCooltrainerFScript:
	jumptextfaceplayer BoardwalkGameCornerCooltrainerFText

BoardwalkGameCornerGentlemanScript:
	faceplayer
	opentext
	writetext BoardwalkGameCornerGentlemanText
	waitbutton
	closetext
	turnobject GOLDENRODGAMECORNER_GENTLEMAN, RIGHT
	end

BoardwalkGameCornerPokefanM2Script:
	jumptextfaceplayer BoardwalkGameCornerPokefanM2Text

BoardwalkGameCornerLeftTheirDrinkScript:
	jumptext BoardwalkGameCornerLeftTheirDrinkText

BoardwalkGameCornerSlotsMachineScript:
	random 6
	ifequal 0, BoardwalkGameCornerLuckySlotsMachineScript
	refreshscreen
	writebyte FALSE
	special SlotMachine
	closetext
	end

BoardwalkGameCornerLuckySlotsMachineScript:
	refreshscreen
	writebyte TRUE
	special SlotMachine
	closetext
	end

BoardwalkGameCornerCardFlipMachineScript:
	refreshscreen
	special CardFlip
	closetext
	end

BoardwalkGameCornerPrizeVendorIntroText:
	text "Welcome!"

	para "We exchange your"
	line "game coins for"
	cont "fabulous prizes!"
	done

BoardwalkGameCornerPrizeVendorWhichPrizeText:
	text "Which prize would"
	line "you like?"
	done

BoardwalkGameCornerPrizeVendorConfirmPrizeText:
	text_ram wStringBuffer3
	text "."
	line "Is that right?"
	done

BoardwalkGameCornerPrizeVendorHereYouGoText:
	text "Here you go!"
	done

BoardwalkGameCornerPrizeVendorNeedMoreCoinsText:
	text "Sorry! You need"
	line "more coins."
	done

BoardwalkGameCornerPrizeVendorNoMoreRoomText:
	text "Sorry. You can't"
	line "carry any more."
	done

BoardwalkGameCornerPrizeVendorQuitText:
	text "OK. Please save"
	line "your coins and"
	cont "come again!"
	done

BoardwalkGameCornerPrizeVendorNoCoinCaseText:
	text "Oh? You don't have"
	line "a COIN CASE."
	done

BoardwalkGameCornerPharmacistText:
	text "I always play this"
	line "slot machine. It"

	para "pays out more than"
	line "others, I think."
	done

BoardwalkGameCornerPokefanM1Text:
	text "I just love this"
	line "new slot machine."

	para "It's just the"
	line "right level of"
	cont "challenge."
	done

BoardwalkGameCornerCooltrainerMText:
	text "Life is a gamble."
	line "I'm going to flip"
	cont "cards till I drop!"
	done

BoardwalkGameCornerPokefanFText:
	text "Card flip…"

	para "I prefer it over"
	line "the slots because"

	para "it's easier to"
	line "figure the odds."

	para "But the payout is"
	line "much lower."
	done

BoardwalkGameCornerCooltrainerFText:
	text "I won't quit until"
	line "I win!"
	done

BoardwalkGameCornerGentlemanText:
	text "I evolved my #-"
	line "MON with a POISON"
	cont "STONE."

	para "It was hard to get"
	line "enough coins for"

	para "it, but it was"
	line "worth it."
	done

BoardwalkGameCornerPokefanM2Text:
	text "I couldn't win at"
	line "the slots, and I"

	para "blew it on card"
	line "flipping…"

	para "I took too many"
	line "risks, and they"
	cont "weren't worth it."
	done

MoveTutorInsideText:
	text "Wahahah! The coins"
	line "keep rolling in!"
	done

BoardwalkGameCornerLeftTheirDrinkText:
	text "Someone left their"
	line "drink."

	para "It smells sweet."
	done

BoardwalkGameCorner_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 10, 13, BOARDWALK, 7
	warp_event 11, 13, BOARDWALK, 8

	db 0 ; coord events

	db 31 ; bg events
	bg_event  6,  6, BGEVENT_READ, BoardwalkGameCornerSlotsMachineScript
	bg_event  6,  7, BGEVENT_READ, BoardwalkGameCornerSlotsMachineScript
	bg_event  6,  8, BGEVENT_READ, BoardwalkGameCornerSlotsMachineScript
	bg_event  6,  9, BGEVENT_READ, BoardwalkGameCornerSlotsMachineScript
	bg_event  6, 10, BGEVENT_READ, BoardwalkGameCornerSlotsMachineScript
	bg_event  6, 11, BGEVENT_RIGHT, BoardwalkGameCornerSlotsMachineScript
	bg_event  7,  6, BGEVENT_READ, BoardwalkGameCornerSlotsMachineScript
	bg_event  7,  7, BGEVENT_READ, BoardwalkGameCornerLuckySlotsMachineScript
	bg_event  7,  8, BGEVENT_READ, BoardwalkGameCornerSlotsMachineScript
	bg_event  7,  9, BGEVENT_READ, BoardwalkGameCornerSlotsMachineScript
	bg_event  7, 10, BGEVENT_READ, BoardwalkGameCornerSlotsMachineScript
	bg_event  7, 11, BGEVENT_LEFT, BoardwalkGameCornerSlotsMachineScript
	bg_event 12,  6, BGEVENT_READ, BoardwalkGameCornerSlotsMachineScript
	bg_event 12,  7, BGEVENT_READ, BoardwalkGameCornerSlotsMachineScript
	bg_event 12,  8, BGEVENT_READ, BoardwalkGameCornerSlotsMachineScript
	bg_event 12,  9, BGEVENT_READ, BoardwalkGameCornerSlotsMachineScript
	bg_event 12, 10, BGEVENT_READ, BoardwalkGameCornerSlotsMachineScript
	bg_event 12, 11, BGEVENT_RIGHT, BoardwalkGameCornerSlotsMachineScript
	bg_event 13,  6, BGEVENT_READ, BoardwalkGameCornerCardFlipMachineScript
	bg_event 13,  7, BGEVENT_READ, BoardwalkGameCornerCardFlipMachineScript
	bg_event 13,  8, BGEVENT_READ, BoardwalkGameCornerCardFlipMachineScript
	bg_event 13,  9, BGEVENT_READ, BoardwalkGameCornerCardFlipMachineScript
	bg_event 13, 10, BGEVENT_READ, BoardwalkGameCornerCardFlipMachineScript
	bg_event 13, 11, BGEVENT_LEFT, BoardwalkGameCornerCardFlipMachineScript
	bg_event 18,  6, BGEVENT_READ, BoardwalkGameCornerCardFlipMachineScript
	bg_event 18,  7, BGEVENT_READ, BoardwalkGameCornerCardFlipMachineScript
	bg_event 18,  8, BGEVENT_READ, BoardwalkGameCornerCardFlipMachineScript
	bg_event 18,  9, BGEVENT_READ, BoardwalkGameCornerCardFlipMachineScript
	bg_event 18, 10, BGEVENT_READ, BoardwalkGameCornerCardFlipMachineScript
	bg_event 18, 11, BGEVENT_RIGHT, BoardwalkGameCornerCardFlipMachineScript
	bg_event 12,  1, BGEVENT_LEFT, BoardwalkGameCornerLeftTheirDrinkScript

	db 12 ; object events
	object_event  3,  2, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, BoardwalkGameCornerCoinVendorScript, -1
	object_event 16,  2, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, BoardwalkGameCornerSpecialVendorScript, -1
	object_event 18,  2, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, BoardwalkGameCornerPrizeMonVendorScript, -1
	object_event  8,  7, SPRITE_PHARMACIST, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, DAY, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, BoardwalkGameCornerPharmacistScript, -1
	object_event  8,  7, SPRITE_PHARMACIST, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, NITE, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, BoardwalkGameCornerPharmacistScript, -1
	object_event 11, 10, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, BoardwalkGameCornerPokefanM1Script, -1
	object_event 14,  8, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, BoardwalkGameCornerCooltrainerMScript, -1
	object_event 17,  6, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, BoardwalkGameCornerPokefanFScript, -1
	object_event 10,  3, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_WANDER, 2, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, BoardwalkGameCornerCooltrainerFScript, -1
	object_event  5, 10, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, BoardwalkGameCornerGentlemanScript, -1
	object_event  2,  9, SPRITE_POKEFAN_M, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, BoardwalkGameCornerPokefanM2Script, -1
	object_event 17, 10, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, MoveTutorInsideScript, EVENT_GOLDENROD_GAME_CORNER_MOVE_TUTOR
