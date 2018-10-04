
function dxCreateProgressBar(x,y,width,height,baba,text,backcolor,textcolor,progresscolor)
local backcolor=backcolor  or tocolor(255,255,255,255)
local textcolor=textcolor  or tocolor(40,115,178,255)
local progresscolor=progresscolor  or tocolor(40,115,178,70)
local text=text or false
local element=createElement('dxProgressBar')
local baba=baba or false	
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
 			
		Elements[element]={
		type='progressBar',
		x=x,
		y=y,
		width=width,
		height=height,
		text=text,
		othertext=othertext,
		baba=baba,
		backcolor=backcolor,
		textcolor=textcolor,
		positiontext='center',
		progresscolor=progresscolor,
		visible=false,
		distanc=0,
		disabled=false,
		lastclick=0,
		}
		table.insert(createdElements,element)
		return element
	end
	return false
end
 function dxProgressBarSetProgress(element,pr)
 if pr<0 or pr > 100 then return false end
 	if Elements[element] and Elements[element].type=='progressBar' then
	
		Elements[element].distanc=Elements[element].width*pr/100
		
		return true
	
	end
 return false
end
 function dxProgressBarSetText(element,text)
 if type(text)~='string' then return false end
 	if Elements[element] and Elements[element].type=='progressBar' then
	
		Elements[element].text=text
		
		return true
	
	end
 return false
end
 function dxProgressBarGetProgress(element)
 	if Elements[element] and Elements[element].type=='progressBar' then
	
			return (Elements[element].distanc/Elements[element].width)*100
			
	end
 return false
end
