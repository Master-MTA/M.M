
function dxCreateButton(x,y,width,height,text,baba,backcolor,textcolor,bordercolor)
local backcolor=backcolor  or tocolor(40,115,178,255)
local textcolor=textcolor  or tocolor(255,255,255,255)
local bordercolor=bordercolor  or tocolor(40,115,178,255)
local element=createElement('dxButton')
local baba=baba or false	
	if element then
	if baba then
		setElementParent(element,baba)
		x=Elements[baba].x+x
		y=Elements[baba].y+y+(Elements[baba].height*5/100)
	end
		Elements[element]={
		type='Button',
		x=x,
		y=y,
		width=width,
		height=height,
		text=text,
		baba=baba,
		backcolor=backcolor,
		textcolor=textcolor,
		bordercolor=bordercolor,
		visible=false,
		disabled=false,
		lastclick=0,
		}
		table.insert(createdElements,element)
		return element
	end
	return false
end
