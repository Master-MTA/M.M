
function dxCreateLabel(x,y,width,height,text,baba,textcolor)
local textcolor=textcolor  or tocolor(255,255,255,255)
local element=createElement('dxLabel')
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
		type='Label',
		x=x,
		y=y,
		width=width,
		height=height,
		text=text,
		baba=baba,
		textcolor=textcolor,
		positionh='center',
		positiony='center',
		visible=false,
		disabled=false,
		lastclick=0,
		}
		table.insert(createdElements,element)

		return element
	end
	return false
end

function dxLabelGetColor(label)

	if Elements[label] and Elements[label].type=='Label' then
	
		return Elements[label].textcolor

	end
	
	return false
end



function  dxLabelSetHorizontalAlign (label,pos)

	if Elements[label] and Elements[label].type=='Label' then
	
		Elements[label].positionh=pos
	
		return true

	end
	
	return false
end




function  dxLabelSetVerticalAlign(label,pos)

	if Elements[label] and Elements[label].type=='Label' then
	
		Elements[label].positiony=pos
	
		return true

	end
	
	return false
end





function  dxLabelSetColor(label,color)

	if Elements[label] and Elements[label].type=='Label' then
	
		Elements[label].textcolor=color
	
		return true

	end
	
	return false
end


