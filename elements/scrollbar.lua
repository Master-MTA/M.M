
function dxCreateScrollBar(x,y,width,height,baba,horezantal,backcolor,bordercolor,movecolor)
local bordercolor=bordercolor  or tocolor(255,255,255,255)
local horezantal=horezantal or true
local backcolor=backcolor or tocolor(255,255,255,255)
local movecolor=movecolor or tocolor(40,115,178,255)
local element=createElement('dxScrollBar')
	if element then
	if baba then
		setElementParent(element,baba)
		x=Elements[baba].x+x
		if Elements[baba].type=='gridList' or Elements[baba].type=='Window' then
		y=Elements[baba].y+y+(Elements[baba].height*5/100)
		else
		y=Elements[baba].y+y+(Elements[baba].height)
		end
		
		if Elements[baba].type=='gridList' then
			
		end
			if x+width>Elements[baba].x+Elements[baba].width then
	
		local res=(Elements[baba].width)-((x-Elements[baba].x))
		
		width=res
	
	end
	
	if y+height>Elements[baba].y+Elements[baba].height then
	
		local res=(Elements[baba].height-(Elements[baba].height*5/100))-((y)-(Elements[baba].y+(Elements[baba].height*5/100)))
		
		height=res
	
	end
	end
		Elements[element]={
		type='scrollBar',
		x=x,
		y=y,
		width=width,
		height=height,
		text=text,
		baba=baba,
		bordercolor=bordercolor,
		backcolor=backcolor,
		movecolor=movecolor,
		horezantal=horezantal,
		heightofscroll=height/2,
		distanc=0,
		visible=false,
		ismoving=false,
		disabled=false,
		lastclick=0,
		}
		table.insert(createdElements,element)

		return element
	end
	return false
end
