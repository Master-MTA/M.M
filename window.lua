
function dxCreateWindow(x,y,width,height,text,backcolor,titlecolor,barcolor,btn)
local backcolor=backcolor  or tocolor(0,0,0,125)
local titlecolor=titlecolor  or tocolor(255,255,255,255)
local barcolor=barcolor  or tocolor(40,115,178,255)
local element=createElement('dxWindow')
local btn=btn or false
	if element then
		Elements[element]={
		type='Window',
		x=x,
		y=y,
		width=width,
		height=height,
		text=text,
		backcolor=backcolor,
		titlecolor=titlecolor,
		barcolor=barcolor,
		btn=btn,
		visible=false,
		currentmove=false,
		disabled=false,
		moveable=false,
		sizeable=false,
		lastclick=0,
		}
		table.insert(createdElements,element)
		return element
	end
	return false
end
