
function dxCreateButton(x,y,width,height,text,baba,backcolor,backcolor2,textcolor,textcolor2,bordercolor,bordercolor2,textsize)
local backcolor=backcolor  or tocolor(169,169,169,255)
local textcolor=textcolor  or tocolor(255,255,255,255)
local bordercolor=bordercolor  or tocolor(255,255,255,255)
local bordercolor2=bordercolor2  or tocolor(40,115,178,255)
local backcolor2=backcolor2 or tocolor(255,255,255,255)
local textcolor2=textcolor2 or tocolor(0,0,0,255)
local textsize=textsize or width/height
local element=createElement('dxButton')
local baba=baba or false	
	if element then
	if baba then
		setElementParent(element,baba)
		x=Elements[baba].x+x
		y=Elements[baba].y+y+(Elements[baba].height*5/100)
	
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
		type='Button',
		x=x,
		y=y,
		width=width,
		height=height,
		text=text,
		baba=baba,
		buttoneffectx=0,
		buttoneffecty=0,
		isincreas=false,
		backcolor2=backcolor2,
		textcolor2=textcolor2,
		backcolor=backcolor,
		textcolor=textcolor,
		bordercolor2=bordercolor2,
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
