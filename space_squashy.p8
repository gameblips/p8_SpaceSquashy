--space squashy
--gameblips - 2016
function _init()
	mode=0
	sfx(4)
end

function _update()
	if mode==0 then
		titleupdate()
	elseif mode==1 then
		gameupdate()
	end
end

function titleupdate()
	if btn(4,0) then
		mode=1
	end
end

function gameupdate()
 if lives<=1 then 
 	mode=2
 end 
end

function _draw()
	if mode==0 then
		titledraw()
	elseif mode==1 then
		gamedraw()
		end
end

function titledraw()
	rectfill(0,0,128,128,0)
	map(0)
	spr(0,28,45)
	spr(0,90,45)
	print("[gameblips]",40,30,7)
	print("-presents-",42,38,7)
	print("space squashy",37,46,7)
	spr(2,53,54,4,18)
	print("press z to start",32,65,6)
	print("�/� to move",34,73,6)
end

function gamedraw()
	lives=3
	score=0

	--ball
	ballx=40
	bally=40
	ballsize=3
	ballxdir=2
	ballydir=-3

	--paddle
	padx=52
	pady=122
	padw=16
	padh=5
	
function movepaddle()
	if btn(0) and (padx>0) then
  		padx-=4
	elseif btn(1) and (padx<110)then
		padx+=4
		end
	end

function moveball()
	ballx+=ballxdir
	bally+=ballydir
end

function loseball()
	if bally>128-ballsize then
		if lives>0 then
			-- next life
			sfx(3)
			bally=24
			lives-=1
		else
			-- game over
			sfx(4)
			ballydir=0
			ballxdir=0
			bally=64
			ballx=64
			run()
		end
	end
end

function bounceball()
--left
	if ballx<ballsize then
	ballxdir=-ballxdir
	sfx(0)
 score+=1
	end

--right
	if ballx>128-ballsize then
	ballxdir=-ballxdir
	sfx(0)
	score+=1
	end 

--top
 if bally<ballsize then
 ballydir=-ballydir
 sfx(0)
 score+=1
 end
end

--bounce the ball off the paddle
function bouncepaddle()
	if ballx>=padx and
		ballx<=padx+padw and
		bally>pady then
		sfx(2)
		score+=10
		ballydir=-ballydir
	end
end

function _update()
	movepaddle()
	moveball()
	bounceball()
	bouncepaddle()
	loseball()
end

function _draw()
--clear the screen
	cls()
	map(0)
-- draw the lives
	for i=1,lives do
	spr(001,90+i*8,4)
	end
--draw the score
	print("pts: ",5,6,8)
	print(score,20,6,8)

--draw the paddle
	spr(2,padx,pady,4,16)

--draw the ball
	spr(0,ballx,bally)
--circfill(ballx,bally,ballsize,15)
	end
	end
