---drawfunction



drawTable={
['Window']=function(v)
			dxDrawRectangle(v.x,v.y,v.width,v.height,v.backcolor,true)


			dxDrawRectangle(v.x,v.y,v.width,(v.height*5/100),v.barcolor,true)

			if v.btn then 
				
					dxDrawRectangle(v.x+v.width-(v.width*6.5/100),v.y,(v.width*6.5/100),(v.height*5/100),tocolor(255,0,0,255),true)
					
					dxDrawLine(v.x+v.width-((v.width*6.5)/100)+((v.width*6.5/100)*40/100),v.y+((v.height*5/100)*40/100),v.x+v.width-((v.width*6.5)/100)+(((v.width*6.5)/100)*60/100),v.y+(v.height*5/100)-((v.height*5/100)*40/100),tocolor(255,255,255,255),3,true)
					dxDrawLine(v.x+v.width-((v.width*6.5)/100)+(((v.width*6.5)/100)*60/100),v.y+((v.height*5/100)*40/100),v.x+v.width-((v.width*6.5)/100)+((v.width*6.5/100)*40/100),v.y+(v.height*5/100)-((v.height*5/100)*40/100),tocolor(255,255,255,255),3,true)

				end
			
			dxDrawText ( v.text, v.x, v.y, v.x+v.width, v.y+(v.height*5/100), v.titlecolor, 1.4, "default-bold" ,'center','center',true,false,true)
end,
['Button']=function(v)
				if isMouseInPosition(v.x,v.y,v.width,v.height) then
			
				local blue = bitExtract(v.backcolor, 0, 8) 
				
				local green = bitExtract(v.backcolor, 8, 8) 
				
				local red = bitExtract(v.backcolor, 16, 8) 
				
				local alpha = bitExtract(v.backcolor, 24, 8) 
				
				v.backcolor=tocolor(red,green,blue,255)
				
				else
				
				local blue = bitExtract(v.backcolor, 0, 8) 
				
				local green = bitExtract(v.backcolor, 8, 8) 
				
				local red = bitExtract(v.backcolor, 16, 8) 
				
				local alpha = bitExtract(v.backcolor, 24, 8) 
				
				v.backcolor=tocolor(red,green,blue,125)
				
				end
				
					roundedRectangle(v.x,v.y,v.width,v.height,v.backcolor,v.bordercolor,true)
					
					dxDrawText ( v.text, v.x, v.y, v.x+v.width, v.y+v.height, v.textcolor, 1.15, "default-bold" ,'center','center',true,false,true)

end,
['Edit']=function(v)
					if v.isenabled then
					
				local blue = bitExtract(v.backcolor, 0, 8) 
				
				local green = bitExtract(v.backcolor, 8, 8) 
				
				local red = bitExtract(v.backcolor, 16, 8) 
				
				local alpha = bitExtract(v.backcolor, 24, 8) 
				
				v.backcolor=tocolor(red,green,blue,255)
				
				else
				
				local blue = bitExtract(v.backcolor, 0, 8) 
				
				local green = bitExtract(v.backcolor, 8, 8) 
				
				local red = bitExtract(v.backcolor, 16, 8) 
				

				v.backcolor=tocolor(red,green,blue,125)
				
					end
					
					dxDrawRectangle(v.x,v.y,v.width,v.height,v.backcolor,true)
					
					dxDrawLine(v.x-1,v.y,v.x+v.width+1,v.y,v.bordercolor,1,true)--top
					
					dxDrawLine(v.x,v.y,v.x,v.y+v.height,v.bordercolor,1,true)--left
					
					dxDrawLine(v.x+v.width,v.y,v.x+v.width,v.y+v.height,v.bordercolor,1,true)--right
					
					dxDrawLine(v.x-1,v.y+v.height,v.x+v.width+1,v.y+v.height,v.bordercolor,1,true)--bottom
	

	
	if v.isenabled then
		
		local mywidth = getCurrentPositionOFCursor(v)
		if v.x+3+mywidth< v.x+v.width then
		dxDrawText("|",v.x+1+mywidth, v.y, v.x+dxGetTextWidth( '|',1.15,"default-bold")+1, v.y+v.height, tocolor(255,0,0,255), 1.15, "default-bold", "left", "center", false, false, true)
		else
		dxDrawText("|", v.x+v.width-dxGetTextWidth( '|',1.15,"default-bold")-2, v.y, v.x+v.width+dxGetTextWidth( '|',1.15,"default-bold")+2, v.y+v.height, tocolor(255,0,0,255), 1.15, "default-bold", "left", "center", false, false, true)
		end
	end
					dxDrawText ( v.text, v.x+1, v.y, v.x+v.width-1, v.y+v.height, v.textcolor, 1.15, "default-bold" ,v.position,'center',true,false,true)
					
		end,

['Memo']=function(v)
					if v.isenabled then
					
				local blue = bitExtract(v.backcolor, 0, 8) 
				
				local green = bitExtract(v.backcolor, 8, 8) 
				
				local red = bitExtract(v.backcolor, 16, 8) 
				
				local alpha = bitExtract(v.backcolor, 24, 8) 
				
				v.backcolor=tocolor(red,green,blue,255)
				
				else
				
				local blue = bitExtract(v.backcolor, 0, 8) 
				
				local green = bitExtract(v.backcolor, 8, 8) 
				
				local red = bitExtract(v.backcolor, 16, 8) 
				

				v.backcolor=tocolor(red,green,blue,125)
				
					end
					
					
					
					dxDrawRectangle(v.x,v.y,v.width,v.height,v.backcolor,true)
					
					dxDrawLine(v.x-1,v.y,v.x+v.width+1,v.y,v.bordercolor,1,true)--top
					
					dxDrawLine(v.x,v.y,v.x,v.y+v.height,v.bordercolor,1,true)--left
					
					dxDrawLine(v.x+v.width,v.y,v.x+v.width,v.y+v.height,v.bordercolor,1,true)--right
					
					dxDrawLine(v.x-1,v.y+v.height,v.x+v.width+1,v.y+v.height,v.bordercolor,1,true)--bottom
					
					
					dxDrawText ( v.text, v.x+1, v.y, v.x+v.width-1, v.y+v.height, v.textcolor, 1.15, "default-bold" ,v.position,'top',true,true,true)
					
		end,		
		
['Label']=function(v)
										
					dxDrawText ( v.text, v.x, v.y, v.x+v.width, v.y+v.height, v.textcolor, 1.15, "default-bold" ,v.positionh,v.positiony,true,true,true)
					
		end,		
		
['checkBox']=function(v)
					
					dxDrawText ( v.text, v.x+(v.width/8)+3, v.y, v.x+v.width-3-(v.width/8), v.y+v.height, v.textcolor, 1.15, "default-bold" ,v.position,'center',false,true,true)

						if v.isselected then
							
						dxDrawRectangle(v.x,v.y,v.width/8,v.height,v.selectcolor,true)
						else
						dxDrawRectangle(v.x,v.y,v.width/8,v.height,v.backcolor,true)
							
						end
					
					
					
					
		end,	

	['gridList']=function(v)

	
					dxDrawRectangle(v.x,v.y,v.width,v.height,v.backcolor,true)
					--dxDrawRectangle(v.x,v.y,v.width,v.height/8,v.linecolor,true)
				--------------real deal
				
					for j,m in ipairs(v.columns)do
					
						if m.x+m.width>v.x+v.width then
						
							dxDrawRectangle(m.x,m.y,(v.x+v.width)-m.x,m.height,m.backcolor,true)
							
							dxDrawText ( m.title,m.x,m.y,(v.x+v.width),m.y+m.height, m.color, 1.15, "default-bold" ,'center','center',true,false,true)
					
							dxDrawLine(m.x,(m.y+m.height),(v.width+v.x),(m.y+m.height),v.linecolor,3,true)
					
						else
														
							dxDrawRectangle(m.x,m.y,m.width,m.height,m.backcolor,true)

							dxDrawText ( getMaxStringForWidth(m.title,m.width,false,1.15,'default-bold') ,m.x,m.y,(m.x+m.width),(m.y+m.height), m.color, 1.15, "default-bold" ,'center','center',true,false,true)
														
							dxDrawLine(m.x,(m.y+m.height),(m.x+m.width),(m.y+m.height),v.linecolor,3,true)
							

						
						end	
						
					end	
					
					
					for l,s in ipairs(v.visiblerows)do
						
						for k=1,#s do
						
						if s[k].iswork then
						
							if s[k].x and s[k].y then
								
								dxDrawRectangle(s[k].x,s[k].y,s[k].width,s[k].height,s[k].backcolor,true)
								
									local nstr,old=getMaxStringForWidth(s[k].text,s[k].width,false,1.15,'default-bold')
										if old~=nstr then
										
										dxDrawText (  deleteLastCharacter(nstr),s[k].x,s[k].y,(s[k].x+s[k].width),(s[k].y+s[k].height), s[k].color,s[k].scale,s[k].font ,s[k].positiontext,'center',true,false,true)
										
										else
											dxDrawText ( nstr,s[k].x,s[k].y,(s[k].x+s[k].width),(s[k].y+s[k].height), s[k].color,s[k].scale,s[k].font ,s[k].positiontext,'center',true,false,true)
										end
							end
								
						end
						
						end
					
					end
	
				
	end,

	['scrollBar']=function(v)
	
		if v.horezantal then

			dxDrawRectangle(v.x,v.y,v.width,v.height,v.backcolor,true)
			
			dxDrawRectangle(v.x,v.y,v.width,2,v.bordercolor,true)---top
			
			dxDrawRectangle(v.x,v.y+v.height-2,v.width,2,v.bordercolor,true)---bottom
			
			dxDrawRectangle(v.x,v.y,2,v.height,v.bordercolor,true)---left
			
			dxDrawRectangle(v.x+v.width-2,v.y,2,v.height,v.bordercolor,true)---right
			
			dxDrawRectangle(v.x,v.y+v.distanc,v.width,v.heightofscroll,v.movecolor,true)

		
		end
		
	end,

['progressBar']=function(v)
	
		
			dxDrawRectangle(v.x,v.y,v.width,v.height,v.backcolor,true)
			
			if v.distanc >v.width then v.distanc=v.width end
			
			dxDrawRectangle(v.x,v.y,v.distanc,v.height,v.progresscolor,true)
			
				if v.text then
					
					dxDrawText ( v.text,v.x,v.y,(v.x+v.width),(v.y+v.height),v.textcolor,1.15,'default-bold',v.positiontext,'center',true,true,true)
				
				end
		
	end,
	
['radioButton']=function(v)
	
		    if not v.isselected then
			dxDrawCircle(v.x+7,v.y+(v.height/2), 7, 0, 360, tocolor(255,255,255,255), tocolor(255,255,255,255), 32,1,true)
			else
			dxDrawCircle(v.x+7,v.y+(v.height/2), 7, 0, 360, v.backcolor, v.backcolor, 32,1,true)
			end
			dxDrawText ( v.text,v.x+14,v.y,(v.x+v.width),(v.y+v.height),v.textcolor,1.15,'default-bold','center','center',true,true,true)
		
	end,

['Image']=function(v)
	
	if v.src then
	
		dxDrawImage (v.x,v.y,v.width,v.height,v.src,0,0,0,v.backcolor,true)
	
	end
	
	end,

		

}



addEventHandler('onClientDxClick',root,function(btn,st)
	local ty=Elements[source].type

	if ty=='Edit' then
	
		Elements[source].isenabled=true
		
		disableAllMemo()
	
	elseif  ty=='Memo' then
	
		Elements[source].isenabled=true

		disableAllEdit()
		
	elseif ty=='radioButton' then
		
		if st=='down' and  not  Elements[source].isselected then
		
			
			for k,v in ipairs(getElementsByType('dxRadioButton'))do
			
				Elements[v].isselected=false
			
			end

			Elements[source].isselected=true
		
		end
		
		disableAllEdit()

		disableAllMemo()
	
	elseif ty=='checkBox' then
		
		if st=='down' then
		
		Elements[source].isselected=not Elements[source].isselected
		
		end
		
		disableAllEdit()

		disableAllMemo()
		
	else

		disableAllEdit()

		disableAllMemo()

	end

end)

addEventHandler('onClientRender',root,function()
		for k,m in ipairs(createdElements)do
		local v=Elements[m]
			if v.visible then
				drawTable[v.type](v)
			end
		end
end)




addEventHandler('onClientClick',root,function(btn,st,x,y)
	for k,v in pairs(Elements)do
		if v.visible==true and v.type~='scrollBar' then
			if isMouseInPosition(v.x,v.y,v.width,v.height) then
				local ch=getElementChildren(k)
				for s,l in ipairs(ch)do
					local hh=Elements[l]
					if hh then
					if isMouseInPosition(hh.x,hh.y,hh.width,hh.height) then
					triggerEvent('onClientDxClick',l,btn,st,x,y)
					return
					else
						if s==#ch then
							triggerEvent('onClientDxClick',k,btn,st,x,y)
							return
						end
					end
					end
				end
			end
		end
	end
	
	disableAllEdit()
	disableAllMemo()
end)


addEventHandler('onClientDxVisibleChange',root,function(st)
		if Elements[source].type=='Edit' then
			guiSetVisible(Elements[source].edit,st)
		elseif  Elements[source].type=='Memo' then 
			guiSetVisible(Elements[source].memo,st)
		end
end)


addEventHandler('onClientGUIChanged',resourceRoot,function()
	
	if getElementType(source)=='gui-edit' then
	
		local baba=getEditBaba(source)
			
			if baba then
			
				Elements[baba].text=guiGetText(source)
				
				Elements[baba].othertext=getMaxStringForWidth(guiGetText(source),Elements[baba].width)
				
				if guiGetText(source)=='' then

					Elements[baba].backposition=0
	
				end
			
			end
	
	elseif getElementType(source)=='gui-memo' then
		
			local baba=getMemoBaba(source)
			
			if baba then

				Elements[baba].text=guiGetText(source)
			
			end
	end

end)

addEventHandler('onClientDxVisibleChange',root,function(st)
	local ch=getElementChildren(source)

for k,v in ipairs(ch)do
	
	if not bannedelements[tostring(getElementType(v))] then
		if Elements[v] and Elements[v].type=='Edit' or Elements[v].type=='Memo' then
		
			Elements[v].isenabled=false
		
		end
	end

end
	disableAllScrollBars()

end)



------------------------------------




addEventHandler('onClientKey',root,function(ch,pr)
	if pr then
	local edit=getIsEnabledEdit() 

	if ch=='arrow_r' then
	
		if edit then

			if Elements[edit].backposition-1>=0 then
		
				Elements[edit].backposition=Elements[edit].backposition-1
			
			end
		
		end
		
	elseif ch=='arrow_l' then
	
		if edit then

		if  Elements[edit].backposition+1<=countString(Elements[edit].othertext) then

				Elements[edit].backposition=Elements[edit].backposition+1
				
			end
		
		end
	
	end
	
	end

end
)

