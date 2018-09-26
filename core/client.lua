---drawfunction



drawTable={
['Window']=function(v)

			dxDrawDxWindow(v.x, v.y, v.width, v.height, v.barcolor,  v.backcolor,v.bordercolor,false)
			
			dxDrawText ( v.text, v.x+(v.width*6.5/100), v.y, v.x+v.width-(v.width*6.5/100), v.y+(v.height*5/100), v.titlecolor, 1.4, "default-bold" ,'center','center',true,false,true)
end,
['Button']=function(v)
				if isMouseInPosition(v.x,v.y,v.width,v.height) then
			
				local blue = bitExtract(v.backcolor, 0, 8) 
				
				local green = bitExtract(v.backcolor, 8, 8) 
				
				local red = bitExtract(v.backcolor, 16, 8) 
				
				local alpha = bitExtract(v.backcolor, 24, 8) 
				
				v.backcolor=tocolor(red,green,blue,255)
				  
				  if not v.isincreas then
				  
				v.buttoneffectx=v.buttoneffectx+0.3
				v.buttoneffecty=v.buttoneffecty+0.3
				
				if v.buttoneffectx> (v.width*5/100) then
				
				v.buttoneffect=v.width*5/100
				
				v.isincreas=true
				
				end	

				if v.buttoneffecty> (v.height*5/100) then
				
				v.buttoneffect=v.width*5/100
				
				v.isincreas=true
				
				end
				
				else
				
				v.buttoneffectx=v.buttoneffectx-0.3
				v.buttoneffecty=v.buttoneffecty-0.3
				
				if v.buttoneffectx< 0 then
				
				v.buttoneffect=0
				
				v.isincreas=false
				
				end	

				if v.buttoneffecty<0 then
				
				v.buttoneffect=0
				
				v.isincreas=false
				
				end
				
				
				end
				
				else
				
				local blue = bitExtract(v.backcolor, 0, 8) 
				
				local green = bitExtract(v.backcolor, 8, 8) 
				
				local red = bitExtract(v.backcolor, 16, 8) 
				
				local alpha = bitExtract(v.backcolor, 24, 8) 
				
				v.backcolor=tocolor(red,green,blue,150)
				v.buttoneffectx=0
				v.buttoneffecty=0
				
				
				end
				
					dxDrawRoundUpButton(v.x+v.buttoneffectx,v.y+v.buttoneffecty,v.width-(v.buttoneffectx*2),v.height-(v.buttoneffecty*2),v.backcolor,true)
					

					
					dxDrawText ( v.text, v.x, v.y, v.x+v.width, v.y+v.height, v.textcolor, 1.15, "default-bold" ,'center','center',true,false,true)

end,
['Edit']=function(v)

local widthof=(dxGetTextWidth(v.text,1.15,'default-bold')/2)
					if v.isenabled then
					
				local blue = bitExtract(v.backcolor, 0, 8) 
				
				local green = bitExtract(v.backcolor, 8, 8) 
				
				local red = bitExtract(v.backcolor, 16, 8) 
				
				local alpha = bitExtract(v.backcolor, 24, 8) 
				
				v.backcolor=tocolor(red,green,blue,255)
				v.textcolor=v.orignalcolor
				v.distanc2=v.distanc2+10
				
				widthof=0
				
				if v.distanc2>v.width then
				
				v.distanc2=v.width
				
				end
				
				v.distanc1=v.distanc1-10
				
				if v.distanc1<0 then
				
					v.distanc1=0
				
				end
				
				else
				
				local blue = bitExtract(v.backcolor, 0, 8) 
				
				local green = bitExtract(v.backcolor, 8, 8) 
				
				local red = bitExtract(v.backcolor, 16, 8) 
				

				v.backcolor=tocolor(red,green,blue,150)
				v.textcolor=v.anothercolor
								
				v.distanc1=v.distanc1+10
				widthof=0
				if v.distanc1>=v.width/2 then
				
				widthof=(dxGetTextWidth(v.text,1.15,'default-bold')/2)
				
				end
				
				
				if v.distanc1>v.width/2 then
				
					v.distanc1=v.width/2
					
				
				end

				v.distanc2=v.distanc2-10
				
				if v.distanc2<0 then
				
				v.distanc2=0
				
				end
				
					end
					
					dxDrawRectangle(v.x,v.y,v.width,v.height,v.backcolor,true)
					
					if v.distanc2>0 then
					dxDrawLine(v.x,v.y+v.height,v.x+v.distanc2-1,v.y+v.height,v.bordercolor,1,true)
					end
					
				--[[	dxDrawLine(v.x-1,v.y,v.x+v.width+1,v.y,v.bordercolor,1,true)--top
					
					dxDrawLine(v.x,v.y,v.x,v.y+v.height,v.bordercolor,1,true)--left
					
					dxDrawLine(v.x+v.width,v.y,v.x+v.width,v.y+v.height,v.bordercolor,1,true)--right
					
					dxDrawLine(v.x-1,v.y+v.height,v.x+v.width+1,v.y+v.height,v.bordercolor,1,true)--bottom
					
					]]--
	

	
	if v.isenabled then
		
		local mywidth = getCurrentPositionOFCursor(v)
		if v.x+3+mywidth< v.x+v.width then
		dxDrawText("|",v.x+1+mywidth, v.y, v.x+dxGetTextWidth( '|',1.15,"default-bold")+1, v.y+v.height, tocolor(255,0,0,255), 1.15, "default-bold", "left", "center", false, false, true)
		else
		dxDrawText("|", v.x+v.width-dxGetTextWidth( '|',1.15,"default-bold")-2, v.y, v.x+v.width+dxGetTextWidth( '|',1.15,"default-bold")+2, v.y+v.height, tocolor(255,0,0,255), 1.15, "default-bold", "left", "center", false, false, true)
		end
	end
					
					dxDrawText ( v.text, v.x+v.distanc1-widthof, v.y, v.x+v.width-1, v.y+v.height, v.orignalcolor, 1.15, "default-bold" ,v.position,'center',true,false,true)
					
					
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
					
					dxDrawLine(v.x,v.y,v.x+v.width-1,v.y,v.bordercolor,1,true)--top
					
					dxDrawLine(v.x,v.y,v.x,v.y+v.height,v.bordercolor,1,true)--left
					
					dxDrawLine(v.x+v.width,v.y,v.x+v.width,v.y+v.height,v.bordercolor,1,true)--right
					
					dxDrawLine(v.x,v.y+v.height,v.x+v.width-1,v.y+v.height,v.bordercolor,1,true)--bottom
						if v.isenabled then
		
		local mywidth = getCurrentPositionOFCursor(v)
		if v.x+3+mywidth< v.x+v.width then
		dxDrawText("|",v.x+1+mywidth, v.y+(dxGetFontHeight(1.15,'default-bold')*(v.lineposition-1)), v.x+dxGetTextWidth( '|',1.15,"default-bold")+1, v.y+(dxGetFontHeight(1.15,'default-bold')*v.lineposition), tocolor(255,0,0,255), 1.15, "default-bold", "left", "center", false, false, true)
		else
		dxDrawText("|", v.x+v.width-dxGetTextWidth( '|',1.15,"default-bold")-2, v.y+(dxGetFontHeight(1.15,'default-bold')*(v.lineposition-1)), v.x+v.width+dxGetTextWidth( '|',1.15,"default-bold")+2, v.y+(dxGetFontHeight(1.15,'default-bold')*v.lineposition), tocolor(255,0,0,255), 1.15, "default-bold", "left", "center", false, false, true)
		end
	end
					
					dxDrawText ( v.text, v.x+1, v.y, v.x+v.width-1, v.y+v.height, v.textcolor, 1.15, "default-bold" ,v.position,'top',true,true,true)
					
		end,		
		
['Label']=function(v)
										
					dxDrawText ( v.text, v.x, v.y, v.x+v.width, v.y+v.height, v.textcolor, 1.15, "default-bold" ,v.positionh,v.positiony,true,true,true)
					
		end,		
		
['checkBox']=function(v)
					

					dxDrawRectangle(v.x,v.y,v.width,v.height,v.backcolor,true)

					
						if v.isselected then
						
						v.distanc=v.distanc+5
						
						if v.distanc>v.height then
						
							v.distanc=v.height
						
						end
							else
							
						v.distanc=v.distanc-5
						
						if v.distanc<0 then
						
							v.distanc=2
						
						end
						
						end
						
							dxDrawRectangle(v.x,v.y,v.width,v.distanc,v.selectcolor,true)
					
					
					dxDrawText ( v.text, v.x, v.y, v.x+v.width, v.y+v.height, v.textcolor, 1.15, "default-bold" ,v.position,'center',false,true,true)
					
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
			
			if baba then-----------------stoppedhere
			if getTextNumbersOfLines(Elements[baba].text,Elements[baba].height,Elements[baba].width)>round((Elements[baba].height/dxGetFontHeight(1.15,'default-bold')),0) then
			
				local str=getMaxStringForWidth(Elements[baba].text,Elements[baba].width)
				
				local mytext=string.gsub(guiGetText(source),str,'')
				
				table.insert(Elements[baba].beforetext,str)
				
				Elements[baba].text=mytext
				
				else
					if #Elements[baba].beforetext~=0 then
					
					local val=tostring(table.concat(Elements[baba].beforetext))
										
					Elements[baba].text=string.gsub(guiGetText(source),val,'')	
					
					else
					
					Elements[baba].text=guiGetText(source)
					
					end
					
				end
			
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

-----------------------------------move cursor memo
--[[addEventHandler('onClientKey',root,function(ch,pr)
	if pr then
		local memo=getIsEnabledMemo() 
		
		if memo then
		
			if Elements[memo] and getTextNumbersOfLines(Elements[memo].text,Elements[memo].height,Elements[memo].width)>(Elements[memo].height/dxGetFontHeight(1.15,'default-bold')) then
			
				local str=getMaxStringForWidth(Elements[memo].text,Elements[memo].width)
				
				local mytext=string.gsub(Elements[memo].text,str,'')
				
				local str=str..string.sub(mytext,1,1)
				
				table.insert(Elements[memo].beforetext,str)
				
				Elements[memo].text=string.gsub(Elements[memo].text,str,'')
				
			
			end
		
		end

	end
end
)]]--
---------------------move window

addEventHandler('onClientDxClick',root,function(btn,st,x,y)

	if getElementType(source)=='dxWindow' then
				
			if st=='down' then
					
					if isMouseInPosition(Elements[source].x,Elements[source].y,Elements[source].width,Elements[source].height*5/100) then
						
						Elements[source].lastclickx=x
						Elements[source].lastclicky=y
						Elements[source].currentmove=true
					
					end
				else
				
				Elements[source].currentmove=false
			
			end
	end
	
end)


addEventHandler('onClientCursorMove',root,function(_,_,x,y)

	for k,v in ipairs(getElementsByType('dxWindow')) do

		if Elements[v].visible and Elements[v].currentmove then
		
			local valx=0
			local incx=false
			local valy=0
			local incy=false
		
			if x>Elements[v].lastclickx then
		
				valx=x-Elements[v].lastclickx
				incx=true
				
				else
				
				valx=Elements[v].lastclickx-x
				
			end
			
			if y>Elements[v].lastclicky then
			
				valy=y-Elements[v].lastclicky
				incy=true
				
				else
				
				valy=Elements[v].lastclicky-y
			
			end
			Elements[v].lastclickx=x
			Elements[v].lastclicky=y
			
			triggerEvent('onClientDxWindowMove',v,valx,valy,incx,incy)
			break
			
		end
	
	end
	
end)


addEventHandler('onClientDxWindowMove',root,function(valx,valy,incx,incy)
	local oldposx=Elements[source].x
	local oldposy=Elements[source].y
	local resultx,resulty=0,0
	
	
	if incx then
	
		Elements[source].x=Elements[source].x+valx
		
			resultx=Elements[source].x-oldposx
			
		else
		
		Elements[source].x=Elements[source].x-valx
		
		resultx=oldposx-Elements[source].x
	
	end
	
	if incy then
	
		Elements[source].y=Elements[source].y+valy
		
		resulty=Elements[source].y-oldposy
		
		else
		
		Elements[source].y=Elements[source].y-valy
		
		resulty=oldposy-Elements[source].y
	
	end
	
	
	
	local ch=getElementChildren(source)
		if	#ch~=0 then
			
			for k,v in ipairs(ch)do
			
			triggerEvent('onClientParentChangePosition',v,source,Elements[source].x,Elements[source].y,oldposx,oldposy,incx,incy,resultx,resulty)
		
			end
			
		end
end)




addEventHandler('onClientParentChangePosition',root,function(_,_,_,_,_,incx,incy,checkx,valy)

		local x,y=Elements[source].x,Elements[source].y
		
	local mex=checkx
	
	if incy then
	
		dxSetPosition(source,x,y+valy)
		
		if getElementType(source)=='dxEdit' then
		
			guiSetPosition(Elements[source].edit,x,y+valy,false)
	
		end		
		
		if getElementType(source)=='dxMemo' then
		
			guiSetPosition(Elements[source].memo,x,y+valy,false)
	
		end
		
		if getElementType(source)=='dxGridList' then
		
			for k,v in ipairs(Elements[source].rows)do
		
				for i,h in ipairs(v)do
				
					h.y=h.y+valy
				
				end
			
			end
			
			for k,v in ipairs(Elements[source].columns)do
				
				v.y=v.y+valy
			
			end
			
			if Elements[source].myscroll then
			
				Elements[Elements[source].myscroll].y=Elements[Elements[source].myscroll].y+valy
				
			end
			
		end
		
		else
		
		dxSetPosition(source,x,y-valy)
	
	
		if getElementType(source)=='dxEdit' then
		
			guiSetPosition(Elements[source].edit,x,y-valy,false)
	
		end
	
		if getElementType(source)=='dxMemo' then
		
			guiSetPosition(Elements[source].memo,x,y-valy,false)
	
		end
		
		if getElementType(source)=='dxGridList' then
		
			for k,v in ipairs(Elements[source].rows)do
		
				for i,h in ipairs(v)do
				
					h.y=h.y-valy
				
				end
			
			end
			for k,v in ipairs(Elements[source].columns)do
				
				v.y=v.y-valy
			
			end
			
			if Elements[source].myscroll then
			
				
				Elements[Elements[source].myscroll].y=Elements[Elements[source].myscroll].y-valy
				
			end
			
		end
	
	end
	
		
	
end)

addEventHandler('onClientParentChangePosition',root,function(_,_,_,_,_,incx,incy,checkx,valy)

		local x,y=Elements[source].x,Elements[source].y
		
	local mex=checkx
	
		
	if incx then
	
		dxSetPosition(source,x+mex,y)
		
		if getElementType(source)=='dxEdit' then
		
			guiSetPosition(Elements[source].edit,x+mex,y,false)
	
		end
				
		if getElementType(source)=='dxMemo' then
		
			guiSetPosition(Elements[source].memo,x+mex,y,false)
	
		end
		if getElementType(source)=='dxGridList' then
		
			for k,v in ipairs(Elements[source].rows)do
		
				for i,h in ipairs(v)do
				
					h.x=h.x+mex
				
				end
			
			end
			
			for k,v in ipairs(Elements[source].columns)do
				
				v.x=v.x+mex
			
			end
			
			if Elements[source].myscroll then
			
				
				Elements[Elements[source].myscroll].x=Elements[Elements[source].myscroll].x+mex
				
			end
			
		end
		else
		
		dxSetPosition(source,x-mex,y)
		
		if getElementType(source)=='dxEdit' then
		
			guiSetPosition(Elements[source].edit,x-mex,y,false)
	
		end
	
		if getElementType(source)=='dxMemo' then
		
			guiSetPosition(Elements[source].memo,x-mex,y,false)
	
		end	
		if getElementType(source)=='dxGridList' then
		
			for k,v in ipairs(Elements[source].rows)do
		
				for i,h in ipairs(v)do
				
					h.x=h.x-mex
				
				end
			
			end
			
			for k,v in ipairs(Elements[source].columns)do
				
				v.x=v.x-mex
			
			end
			
			
			if Elements[source].myscroll then
			
				
				Elements[Elements[source].myscroll].x=Elements[Elements[source].myscroll].x-mex
				
			end
			
		end
	
	end		
	
end)
