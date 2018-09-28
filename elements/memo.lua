
function dxCreateMemo(x,y,width,height,text,baba,backcolor,textcolor,bordercolor)
local backcolor=backcolor  or tocolor(255,255,255,255)
local textcolor=textcolor  or tocolor(0,0,0,255)
local bordercolor=bordercolor  or tocolor(40,115,178,255)
local element=createElement('dxMemo')
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
		local memo=guiCreateMemo(x,y,width,height,text,false)
			guiSetVisible(memo,false)
			guiSetAlpha(memo,0)
		Elements[element]={
		type='Memo',
		x=x,
		y=y,
		width=width,
		height=height,
		text=text,
		baba=baba,
		backcolor=backcolor,
		textcolor=textcolor,
		position='left',
		memo=memo,
		bordercolor=bordercolor,
		backposition=0,
		lineposition=1,
		visible=false,
		beforetext={},
		aftertext={},
		isenabled=false,
		disabled=false,
		lastclick=0,
		}
		table.insert(createdElements,element)

		return element
	end
	return false
end
