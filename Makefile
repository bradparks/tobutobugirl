default: backgrounds sprites tobu.gb

.PHONY: title_backgrounds
title_backgrounds:
	imgtogb --map data/bg/title.png -o data/bg/title.h

.PHONY: select_backgrounds
select_backgrounds:
	imgtogb --map data/bg/circles.png -o data/bg/circles.h
	imgtogb --map data/bg/select.png -o data/bg/select.h -O 9
	imgtogb --map data/bg/selection1.png -o data/bg/selection1.h -O 44
	imgtogb --map data/bg/selection2.png -o data/bg/selection2.h -O 44
	imgtogb --map data/bg/selection3.png -o data/bg/selection3.h -O 44

.PHONY: ingame_backgrounds
ingame_backgrounds:
	imgtogb --map data/bg/powerups.png -o data/bg/powerups.h
	imgtogb --map data/bg/hud.png -o data/bg/hud.h -O 22
	imgtogb --map data/bg/clock.png -o data/bg/clock.h -O 40
	imgtogb --map data/bg/background1.png -o data/bg/background1.h -O 54
	imgtogb --map data/bg/background2.png -o data/bg/background2.h -O 54
	imgtogb --map data/bg/background3.png -o data/bg/background3.h -O 54

backgrounds: title_backgrounds select_backgrounds ingame_backgrounds

.PHONY: sprites
sprites:
	imgtogb --sprite --8x16 data/sprite/sprites.png -o data/sprite/sprites.h
	imgtogb --sprite data/sprite/characters.png -o data/sprite/characters.h
	imgtogb --sprite data/sprite/arrow.png -o data/sprite/arrow.h

.PHONY: tobu.gb
tobu.gb: 
	lcc -c main.c 
	lcc -c title.c
	lcc -c select.c
	lcc -c game.c
	lcc -c fade.c
	lcc -c gamestate.c
	lcc -c cos.c
	lcc main.o title.o select.o game.o fade.o gamestate.o cos.o -o $@

.PHONY: run
run:
	gambatte -s 3 tobu.gb

.PHONY: clean
clean:
	rm *.o
