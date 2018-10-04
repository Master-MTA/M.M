
function dxCreateWindow(x,y,width,height,text,backcolor,titlecolor,barcolor,bordercolor,sizeoftext)
local backcolor=backcolor  or tocolor(0,0,0,255)
local titlecolor=titlecolor  or tocolor(255,255,255,255)
local barcolor=barcolor  or tocolor(0,0,0,255)
local bordercolor=bordercolor or tocolor(255,255,255,255)
local sizeoftext=sizeoftext or (width/height)
local element=createElement('dxWindow')
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
		sizeoftext=sizeoftext,
		barcolor=barcolor,
		visible=false,
		currentmove=false,
		disabled=false,
		moveable=false,
		sizeable=false,
		lastclickx=0,
		lastclicky=0,
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

function dxWindowSetMovable(window,st)

	if Elements[window] and Elements[window].type=='Window'	then
	
		Elements[window].moveable=st
		
		return true
	
	end

	return false
end

function dxWindowIsMovable(window)

	if Elements[window] and Elements[window].type=='Window'	then
	
		return Elements[window].moveable
	
	end

	return false
end
