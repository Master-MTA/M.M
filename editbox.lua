
function dxCreateEdit(x,y,width,height,text,baba,backcolor,textcolor,bordercolor)
local backcolor=backcolor  or tocolor(40,115,178,255)
local textcolor=textcolor  or tocolor(255,255,255,255)
local bordercolor=bordercolor  or tocolor(40,115,178,255)
local element=createElement('dxEdit')
local baba=baba or false	
local ismaxed=ismaxed or false	
local othertext=text
	if element then
	if baba then
		setElementParent(element,baba)
		x=Elements[baba].x+x
		y=Elements[baba].y+y+(Elements[baba].height*5/100)

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
		othertext=othertext,
		baba=baba,
		ismaxed=ismaxed,
		backcolor=backcolor,
		textcolor=textcolor,
		edit=edit,
		position='left',
		bordercolor=bordercolor,
		visible=false,
		isenabled=false,
		backposition=0,
		disabled=false,
		lastclick=0,
		}
		table.insert(createdElements,element)
		return element
	end
	return false
end
