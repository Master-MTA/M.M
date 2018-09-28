
function dxCreateImage(x,y,width,height,src,baba,backcolor)
local backcolor=backcolor  or tocolor(255,255,255,255)
local element=createElement('dxImage')
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
