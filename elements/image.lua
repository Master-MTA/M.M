
function dxCreateImage(x,y,width,height,src,baba,backcolor)
local backcolor=backcolor  or tocolor(255,255,255,255)
local element=createElement('dxImage')
local baba=baba or false	
	if element then
	if baba then
		setElementParent(element,baba)
		x=Elements[baba].x+x
		y=Elements[baba].y+y+(Elements[baba].height*5/100)

	end

		Elements[element]={
		type='Image',
		x=x,
		y=y,
		width=width,
		height=height,
		src=src,
		baba=baba,
		backcolor=backcolor,
		visible=false,
		disabled=false,
		lastclick=0,
		}
		table.insert(createdElements,element)
		return element
	end
	return false
end
