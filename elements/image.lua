
function dxCreateImage(x,y,width,height,src,baba,backcolor)
local backcolor=backcolor  or tocolor(255,255,255,255)
local element=createElement('dxImage')
local baba=baba or false	
	if element then
	if baba  then
		setElementParent(element,baba)

	if  Elements[baba].type~='Tab' then
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
		else
		x=Elements[getElementParent(baba)].x+x
		y=Elements[getElementParent(baba)].y+y+(Elements[getElementParent(baba)].height*5/100)
		if x+width>Elements[getElementParent(baba)].x+Elements[getElementParent(baba)].width then
	
		local res=(Elements[getElementParent(baba)].width)-((x-Elements[getElementParent(baba)].x))
		
		width=res
	
	end
	
	if y+height>Elements[getElementParent(baba)].y+Elements[getElementParent(baba)].height then
	
		local res=(Elements[getElementParent(baba)].height-(Elements[getElementParent(baba)].height*5/100))-((y)-(Elements[getElementParent(baba)].y+(Elements[getElementParent(baba)].height*5/100)))
		
		height=res
	
	end
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
			if sourceResource then
			if not resElements[getResourceName(sourceResource)] then resElements[getResourceName(sourceResource)]={} end

			table.insert(resElements[getResourceName(sourceResource)],element)
			end
		return element
	end
	return false
end
