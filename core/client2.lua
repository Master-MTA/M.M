




--------------------------------------scrollBar
addEventHandler('onClientClick',root,function(btn,st,x,y)
		
		
		for k,v in ipairs(getElementsByType('dxScrollBar'))do
		

			if Elements[v].visible then
			
				if isMouseInPosition(Elements[v].x,Elements[v].y+Elements[v].distanc,Elements[v].width,Elements[v].heightofscroll) then
				
					triggerEvent('onClientDxScrollBarClicked',v,btn,st,x,y)
					
					return
				
				end
			
			end
		
		end
		
		disableAllScrollBars()

end)


addEventHandler('onClientDxScrollBarClicked',root,function(btn,st,x,y)
	
	
	
				if st=='down' then

					Elements[source].lastclick=y
					Elements[source].ismoving=true
					
					else
					
					Elements[source].lastclick=0
					Elements[source].ismoving=false
			
				end
				
	
end)


function getEnabledScrollBar()
	
	for k,v in ipairs(getElementsByType('dxScrollBar'))do
	
		if 	Elements[v].ismoving then
	
			return v
		end
	end
return false
end


addEventHandler('onClientCursorMove',root,function(_,_,x,y)

local check=getEnabledScrollBar()

	if check then
	
	local scx,scy=guiGetScreenSize()
	local oldscroll=Elements[check].distanc
		if Elements[check].lastclick<y then
		
		local percent=(y-Elements[check].lastclick)*100/Elements[getElementParent(check)].height
				
		Elements[check].distanc=Elements[check].distanc+(Elements[check].height*percent/100)
		Elements[check].lastclick=y	
		local allspace=(Elements[check].height)-(Elements[check].heightofscroll)
		
		
			if Elements[check].distanc<0  then
				
				Elements[check].distanc=0
	
			end
			
			if (Elements[check].y+Elements[check].distanc)+Elements[check].heightofscroll> Elements[check].y+Elements[check].height then
				
				Elements[check].distanc=Elements[check].height-Elements[check].heightofscroll
				return
	
			end
			
				triggerEvent('onClientDxScrollBarScrolled',check,(Elements[check].distanc)*100/allspace,oldscroll*100/allspace,true)
			else
	

		local percent=(y-Elements[check].lastclick)*100/Elements[getElementParent(check)].height
		
		local allspace=(Elements[check].height)-(Elements[check].heightofscroll)
		Elements[check].distanc=Elements[check].distanc+(Elements[check].height*percent/100)
		Elements[check].lastclick=y
		
		
			if Elements[check].distanc<0  then
				
				Elements[check].distanc=0
	
			end
			
			if (Elements[check].y+Elements[check].distanc)+Elements[check].heightofscroll> Elements[check].y+Elements[check].height then
				
				Elements[check].distanc=Elements[check].height-Elements[check].heightofscroll
	
			end
				triggerEvent('onClientDxScrollBarScrolled',check,(Elements[check].height-(Elements[check].distanc+Elements[check].heightofscroll))*100/allspace,oldscroll*100/allspace,false)

		end
		
	
	end

end)







---------gridlist scrollbar

addEventHandler('onClientDxScrollBarScrolled',root,function(pr,old,inc)

local grid=getElementParent(source)
	
	if grid and getElementType(grid)=='dxGridList' then
	
		if inc then
	
		
				
			local themm=pr
				
				if themm>=98 then themm=100 end
				
local checkthis=myGridFunction(grid)

	if checkthis and themm>=checkthis and #Elements[grid].unvisiblerowsdown~=0 then

		
		local done=false
		
					for k,v in ipairs(Elements[grid].rows)do
					
						for m,j in ipairs(v) do
						
							Elements[grid].rows[k][m].y=Elements[grid].rows[k][m].y-Elements[grid].rows[k][m].height
							
						
						end
						

						
					end
										
							if done==false then
								
								table.insert(Elements[grid].unvisiblerowsup,Elements[grid].visiblerows[1])
									
								table.remove(Elements[grid].visiblerows,1)

								table.insert(Elements[grid].visiblerows,Elements[grid].unvisiblerowsdown[1])
								
								table.remove(Elements[grid].unvisiblerowsdown,1)
								
								done=true
							end
				Elements[grid].visiblerowcount=Elements[grid].visiblerowcount+1
				
				local mycheck=getPercentegOfHiddenRows(grid,#Elements[grid].unvisiblerowsup)
					if themm>mycheck and themm~=100 then
					
						Elements[source].distanc=((Elements[source].height-Elements[source].heightofscroll)*mycheck)/100
		
					end
			end
			else-------scroll down
			local grid=getElementParent(source)
				
			local themm=pr
				
				if themm<=0 then themm=0 end
				
local checkthis=getTheFunction(getElementParent(source))

	if checkthis and themm>=checkthis and #Elements[grid].unvisiblerowsup~=0   then
		
		local done=false
		
					for k,v in ipairs(Elements[grid].rows)do
					
						for m,j in ipairs(v) do
						
							Elements[grid].rows[k][m].y=Elements[grid].rows[k][m].y+Elements[grid].rows[k][m].height
							
						
						end
						end
						
						if done==false then
						
						local myta={}
						local myta2={}
								
								table.insert(myta2,Elements[grid].visiblerows[#Elements[grid].visiblerows])
								
								for k,v in ipairs(Elements[grid].unvisiblerowsdown)do
								
									table.insert(myta2,v)
								
								end
								Elements[grid].unvisiblerowsdown=myta2
								
									table.remove(Elements[grid].visiblerows,#Elements[grid].visiblerows)

									table.insert(myta,Elements[grid].unvisiblerowsup[#Elements[grid].unvisiblerowsup])
								
								table.remove(Elements[grid].unvisiblerowsup,#Elements[grid].unvisiblerowsup)
								
									for key,value in ipairs(Elements[grid].visiblerows) do
									
										table.insert(myta,value)	
									
									end
									
								Elements[grid].visiblerows=myta
							
								done=true
							end
						
					
				
					Elements[grid].visiblerowcount=Elements[grid].visiblerowcount-1
	
					local mycheck=getPercentegOfHiddenRows(grid,#Elements[grid].unvisiblerowsdown)
					if themm>mycheck and themm~=100 then
					
						Elements[source].distanc=(Elements[source].height-Elements[source].heightofscroll)-((Elements[source].height-Elements[source].heightofscroll)*mycheck)/100
		
					end
		
			end
		
		end
	
	end
	
end
)

-------------gridlist item select
addEventHandler('onClientClick',root,function()
		for j,grid in ipairs(getElementsByType('dxGridList'))do
		
		
			
			for i,u in ipairs(Elements[grid].visiblerows)do
				
				for k,v in ipairs(Elements[grid].visiblerows[i])do
				
					if isMouseInPosition(v.x,v.y,v.width,v.height) and not isMouseInPosition(Elements[grid].x+Elements[grid].width-(Elements[grid].width*2/100),Elements[grid].y+(Elements[grid].height*5/100),(Elements[grid].width*2/100),Elements[grid].height-(Elements[grid].height*5/100))  then
					
					local row,col=getRowPositionInTheMotherTable(grid,i,k)
					
					Elements[grid].selecteditem=row
					Elements[grid].selectedcolumn=col
					
							for m,s in ipairs (Elements[grid].visiblerows[i])do 
							

								Elements[grid].visiblerows[i][m].backcolor=tocolor(40,115,178,255)
							
							end
							
					for m,s in ipairs(Elements[grid].rows)do
								
							if row~=m then
								
								for b,o in ipairs(Elements[grid].rows[m])do
								
								
									Elements[grid].rows[m][b].backcolor=Elements[grid].rows[m][b].anothercolor
								
								end
							end
						end

						return
					
					end
				
				end
			
			end
					
	end
	

end)
