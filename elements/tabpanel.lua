
function dxCreateTabPanel(x,y,width,height,baba,backcolor,bordercolor)
local backcolor=backcolor  or tocolor(169,169,169,255)
local textcolor=textcolor  or tocolor(255,255,255,255)
local bordercolor=bordercolor  or tocolor(255,255,255,255)
local bordercolor2=bordercolor2  or tocolor(40,115,178,255)
local backcolor2=backcolor2 or tocolor(255,255,255,255)
local textcolor2=textcolor2 or tocolor(0,0,0,255)
local element=createElement('dxTabPanel')
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
		type='tabPanel',
		x=x,
		y=y,
		width=width,
		height=height,
		baba=baba,
		buttoneffectx=0,
		buttoneffecty=0,
		isincreas=false,
		backcolor=backcolor,
		visible=false,
		disabled=false,
		selectedtab=false,
		tabcount=0,
		tabs={},
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


function dxCreateTab(text,parent,color,backcolor,font)
	if Elements[parent] and Elements[parent].type=='tabPanel' then
		local element=createElement('dxTab')
		if element then
			
			local thewidth=Elements[parent].width/(Elements[parent].tabcount+1)
			
			for k,v in ipairs(Elements[parent].tabs)do
				if k==1 then
					Elements[v].x=Elements[parent].x
					else
					Elements[v].x=Elements[Elements[parent].tabs[k-1]].x+thewidth
				end
					Elements[v].width=thewidth
					Elements[v].visible=dxGetVisible(parent)
					
			end
			local thex=Elements[parent].x
			if Elements[Elements[parent].tabs[Elements[parent].tabcount]] then
			thex=((Elements[Elements[parent].tabs[Elements[parent].tabcount]].x)+thewidth)
			end
			Elements[element]={
				type='Tab',
				x=thex,
				y=Elements[parent].y,
				width=thewidth,
				height=Elements[parent].height*5/100,
				parent=parent,
				color=color,
				text=text,
				fontsize=1.15,
				isselected=false,
				visible=Elements[parent].visible,
				backcolor=backcolor or tocolor(40,115,178,255),
				order=#Elements[parent].tabs+1,
				font=font or 'default-bold',
			}
			Elements[parent].tabcount=Elements[element].order
			setElementParent(element,parent)
			if Elements[element].order==1 then Elements[element].isselected=true  Elements[parent].selectedtab=element end
						if sourceResource then
						if not resElements[getResourceName(sourceResource)] then resElements[getResourceName(sourceResource)]={} end

			table.insert(resElements[getResourceName(sourceResource)],element)
			end
			table.insert(Elements[parent].tabs,element)
			return element
		end
	end
return false
end

