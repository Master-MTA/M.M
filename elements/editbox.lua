
function dxCreateEdit(x,y,width,height,text,baba,backcolor,textcolor,bordercolor,anothercolor)
local backcolor=backcolor  or tocolor(255,255,255,255)
local textcolor=textcolor  or tocolor(0,0,0,255)
local bordercolor=bordercolor  or tocolor(40,115,178,255)
local anothercolor=anothercolor or tocolor(0,0,0,255)
local element=createElement('dxEdit')
local baba=baba or false	
local ismaxed=ismaxed or false	
local othertext=text
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
		local edit=guiCreateEdit(x,y,width,height,text,false)
			guiSetVisible(edit,false)
			guiSetAlpha(edit,0)
	local mywidth = dxGetTextWidth( text,1.15,"default-bold")
		if x+3+mywidth> x+width then
			ismaxed=true
		end
			
			
		Elements[element]={
		type='Edit',
		x=x,
		y=y,
		width=width,
		height=height,
		text=text,
		anothercolor=anothercolor,
		othertext=othertext,
		baba=baba,
		ismaxed=ismaxed,
		orignalcolor=textcolor,
		backcolor=backcolor,
		textcolor=textcolor,
		edit=edit,
		distanc1=0,
		distanc2=0,
		positiontext='left',
		bordercolor=bordercolor,
		visible=false,
		isenabled=false,
		backposition=0,
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
