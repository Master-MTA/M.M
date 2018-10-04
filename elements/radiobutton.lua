
function dxCreateRadioButton(x,y,width,height,text,baba,backcolor,textcolor)
local backcolor=backcolor  or tocolor(40,115,178,255)
local textcolor=textcolor  or tocolor(255,255,255,255)
local element=createElement('dxRadioButton')
local text=text or ''
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
		type='radioButton',
		x=x,
		y=y,
		width=width,
		height=height,
		text=text,
		baba=baba,
		backcolor=backcolor,
		textcolor=textcolor,
		positiontext='center',
		visible=false,
		isenabled=false,
		disabled=false,
		isselected=false,
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



function dxRadioButtonGetSelected(check)
	if Elements[check] and Elements[check].type=='radioButton' then
		return Elements[check].isselected
	end
return false
end


function dxRadioButtonSetSelected(check,st)
	if Elements[check] and Elements[check].type=='radioButton' then
		 Elements[check].isselected=st
		return true
	end
return false
end

