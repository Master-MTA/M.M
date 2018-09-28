
function dxCreateGridList(x,y,width,height,baba,backcolor,bordercolor,linecolor)
local backcolor=backcolor  or tocolor(169,169,169,255)
local bordercolor=bordercolor  or tocolor(255,255,255,255)
local linecolor=linecolor  or tocolor(40,115,178,255)
local element=createElement('dxGridList')
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

		Elements[element]={
		type='gridList',
		x=x,
		y=y,
		width=width,
		height=height,
		text=text,
		backcolor=backcolor,
		bordercolor=bordercolor,
		linecolor=linecolor,
		visible=false,
		currentmove=false,
		disabled=false,
		moveable=false,
		sizeable=false,
		selecteditem=0,
		selectedcolumn=0,
		columns={},
		rows={},
		columncount=0,
		rowcount=0,
		visiblerows={},
		unvisiblerowsdown={},
		unvisiblerowsup={},
		lastclickx=0,
		lastclicky=0,
		visiblerowcount=0,
		scrolledrowsup=0,
		myscroll=false,
		}
		table.insert(createdElements,element)

		return element
	end
	return false
end


function dxGridListAddColumn(grid,title,colwidth,color)
	
	if Elements[grid] and Elements[grid].type=='gridList' then

				local v=Elements[grid]
				local color=color or tocolor(255,255,255,255)
				local backcolor=backcolor or tocolor(40,115,178,255)
				local currentnum=v.columncount	+ 1
				local x,y,width,theheight,finalresult,num=0,0,0,0,0,v.columncount
				
				if v.columns[v.columncount] then
					
					while(num>=1)do
						
						local m= v.columns[num]
						
						finalresult=finalresult+m.width
						
						num=num-1
					end
					
					finalresult=finalresult+(v.width*colwidth)
					x=v.x+finalresult-(v.width*colwidth)
					y=v.y
					width=v.width*colwidth
					theheight=v.height*5/100
					else
					x=v.x
					y=v.y
					width=v.width*colwidth
					theheight=v.height*5/100
					
				end
					
		table.insert(Elements[grid].columns,{title=title,colwidth=colwidth,color=color,x=x,y=y,width=width,height=theheight,backcolor=backcolor})
	
		Elements[grid].columncount=Elements[grid].columncount+1
		local element=createElement('dxGridListColumn',tostring(Elements[grid].columncount))
		setElementParent(element,grid)
		return Elements[grid].columncount
	
	end
	
return false

end



function dxGridListAddRow(grid)

	if Elements[grid] and Elements[grid].type=='gridList' then
		Elements[grid].rowcount=Elements[grid].rowcount+1

	local element=createElement('dxGridListRow',tostring(Elements[grid].rowcount))
		setElementParent(element,grid)
		local myrow={}
		
			for k=1,Elements[grid].columncount do
			
				table.insert(myrow,{col=k})
			
			end
			
		table.insert(Elements[grid].rows,myrow)
		
		return Elements[grid].rowcount
	
	end
	
	return Elements[grid].rowcount
	
end


function dxGridListGetColumnWidth(grid,col)

	if Elements[grid] and Elements[grid].type=='gridList' then

		return Elements[grid].columns[col].colwidth
	
	end
	
	return false

end

function dxGridListGetUnVisibleRowCount(grid)

local result=0

	if Elements[grid].visiblerowcount>=Elements[grid].rowcount then

		result=Elements[grid].visiblerowcount-Elements[grid].rowcount
		else
		
		result=Elements[grid].rowcount-Elements[grid].visiblerowcount
	
	end
	
	return result
end


function dxGridListSetItemText(grid,row,colnum,text,ty,color,backcolor,scale,font)

	if Elements[grid] and Elements[grid].type=='gridList' then
	
				if Elements[grid].rows[1][1] and Elements[grid].rows[1][1].height then
																									
					Elements[grid].height=Elements[grid].rows[1][1].height*math.floor(Elements[grid].height/Elements[grid].rows[1][1].height)
													
				end

		local ty=ty or 'text'
		
		local font=font or 'default-bold'
		
		local scale=scale or 1
		
		local backcolor=backcolor or tocolor(255,255,255,255)

			if ty=='text' then
	
				if Elements[grid].rows[row]  then
				
				local theta,num=getColumnTable(grid,colnum,row)
				
					if theta then
					
					local color=color or tocolor(0,0,0,255)
					
					local x,y,width,height=dxGridListGetColumnPosition(grid,colnum)
					
						if x then
							local res=sumTheBeforeRows(grid,row,colnum)
								
								Elements[grid].rows[row][num]={col=colnum,text=text,positiontext='center',backcolor=backcolor,scale=scale,font=font,type=ty,x=x,y=y+res+5,width=width,height=dxGetFontHeight(scale,font)+5,color=color,iswork=true,myrow=row,anothercolor=backcolor,enterd=false,itemdata=false}
									

								
									if Elements[grid].rows[row][num].y+Elements[grid].rows[row][num].height>Elements[grid].y+Elements[grid].height and not Elements[grid].myscroll then
										
										Elements[grid].myscroll=dxCreateScrollBar(Elements[grid].width-(Elements[grid].width*2/100),0,(Elements[grid].width*2/100),Elements[grid].height-(Elements[grid].height*5/100),grid)
										
									end
									
									
									
										local starty,endy=dxGetMaxAndMinRowNumber(grid)
										
										if starty then
										
											Elements[grid].visiblerows={}
											Elements[grid].unvisiblerowsdown={}
											Elements[grid].visiblerowcount=0
											Elements[Elements[grid].myscroll].distanc=0
											local me=0
											for k=starty,endy do
											Elements[grid].visiblerowcount=Elements[grid].visiblerowcount+1
												table.insert(Elements[grid].visiblerows,Elements[grid].rows[k])
											
											
											end
												
											
											for k=endy+1,Elements[grid].rowcount do
												table.insert(Elements[grid].unvisiblerowsdown,Elements[grid].rows[k])
											end
										
										end
										
										if row~=oldrow then
										
											dxGridListchangeScrollBarOfSize(grid)
											
											oldrow=row
											
										end
									
										
								for k,v in ipairs(Elements[grid].rows[row])do
									
									if not v.iswork then
										
										Elements[grid].rows[row][k]={col=v.col,itemdata=v.itemdata,text=text,positiontext='center',backcolor=backcolor,scale=scale,font=font,type=ty,x=x,y=y+res+5,width=width,height=dxGetFontHeight(scale,font)+5,color=color,iswork=false,myrow=row,anothercolor=backcolor,enterd=false}

									
									end
								
								end
								
									if not dxGetMaxRowNumber(grid) or row<=dxGetMaxRowNumber(grid) then
									
										
										Elements[grid].visiblerowcount=Elements[grid].visiblerowcount+1
										
										table.insert(Elements[grid].visiblerows,Elements[grid].rows[row])	
										
									end
															
							return true
						
						end
						
					end
				
				end
				
				
			else
	
			end

		return false
	
	end
end

function dxGridListGetSelectedItem(grid)
	if Elements[grid] and Elements[grid].type=='gridList'then
	
		return Elements[grid].selecteditem,Elements[grid].selectedcolumn
	
	end
	return false
end


function dxGridListSetSelectedItem(grid,sel,col)
	if Elements[grid] and Elements[grid].type=='gridList'then
	
	Elements[grid].selecteditem =sel
	Elements[grid].selectedcolumn=col
						
						for m,s in ipairs (Elements[grid].rows[sel])do 
							

								Elements[grid].rows[sel][m].backcolor=tocolor(40,115,178,255)
							
						end
							
					for m,s in ipairs(Elements[grid].rows)do
								
							if sel~=m then
								
								for b,o in ipairs(Elements[grid].rows[m])do
								
								
									Elements[grid].rows[m][b].backcolor=Elements[grid].rows[m][b].anothercolor
								
								end
							end
						end
	
		return true
	
	end
	return false
end


function dxGridListGetItemText(grid,sel,col)
	if Elements[grid] and Elements[grid].type=='gridList'then
		local col=col or 1
	
		return Elements[grid].rows[sel][col].text
	
	end
	return false
end

