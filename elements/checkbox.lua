
function dxCreateCheckBox(x,y,width,height,text,baba,backcolor,textcolor,selectcolor)
local backcolor=backcolor  or tocolor(187,187,187,125)
local textcolor=textcolor  or tocolor(255,255,255,255)
local selectcolor=selectcolor  or tocolor(40,115,178,255)
local element=createElement('dxCheckBox')
local baba=baba or false	
	if element then
	if baba then
		setElementParent(element,baba)
		x=Elements[baba].x+x
		y=Elements[baba].y+y+(Elements[baba].height*5/100)

	end
		Elements[element]={
		type='checkBox',
		x=x,
		y=y,
		width=width,
		height=height,
		text=text,
		baba=baba,
		backcolor=backcolor,
		textcolor=textcolor,
		position='center',
		distanc=0,
		clickedby=false,
		anothercolor=false,
		iscolorchanged=false,
		selectcolor=selectcolor,
		visible=false,
		isenabled=false,
		disabled=false,
		isselected=false,

		}
		table.insert(createdElements,element)
		return element
	end
	return false
end


function dxCheckBoxGetSelected(check)
	if Elements[check] and Elements[check].type=='checkBox' then
		return Elements[check].isselected
	end
return false
end


function dxCheckBoxSetSelected(check,st)
	if Elements[check] and Elements[check].type=='checkBox' then
		 Elements[check].isselected=st
		return true
	end
return false
end

