
function isMouseInPosition ( x, y, width, height )
	if ( not isCursorShowing( ) ) then
		return false
	end
    local sx, sy = guiGetScreenSize ( )
    local cx, cy = getCursorPosition ( )
    local cx, cy = ( cx * sx ), ( cy * sy )
    if ( cx >= x and cx <= x + width ) and ( cy >= y and cy <= y + height ) then
        return true
    else
        return false
    end
end

function deleteLastCharacter(str)
return(str:gsub("[%z\1-\127\194-\244][\128-\191]*$", ""))
end

function round(num, numDecimalPlaces)
  local mult = 10^(numDecimalPlaces or 0)
  return math.floor(num * mult + 0.5) / mult
end
function dxDrawRoundedRectangle(x,y,width,height,raduis,color,postgui)

dxDrawRectangle(x,y+raduis,width+1,height-(raduis*2),color,postgui)--horezantal rectangle
dxDrawRectangle(x+raduis,y,width-(raduis*2),height+1,color,postgui)--vertical rectangle

for k=180,270 do--left top
	local co=math.cos(math.rad(k))* raduis
	local si=math.sin(math.rad(k))* raduis
	dxDrawLine((x+raduis)+co,(y+raduis)+si,x+raduis,y+raduis,color,1,postgui)
end
for k=270,360 do--right top
	local co=math.cos(math.rad(k))* raduis
	local si=math.sin(math.rad(k))* raduis
	dxDrawLine((x+width-raduis)+co,(y+raduis)+si,x+width-raduis,y+raduis,color,1,postgui)
end

for k=90,180 do--left bottom
	local co=math.cos(math.rad(k))* raduis
	local si=math.sin(math.rad(k))* raduis
	dxDrawLine((x+raduis)+co,(y+height-raduis)+si,x+raduis,y+height-raduis,color,1,postgui)
end
local k=360
while(k<=(360+90))do
if k~= 360 then
	local co=math.cos(math.rad(k))* raduis
	local si=math.sin(math.rad(k))* raduis
	dxDrawLine((x-raduis+width)+co,(y+height-raduis)+si,x+width-raduis,y+height-raduis,color,1,postgui)
	
end
	k=k+1;
end

end

function dxDrawCutUpRectangle(x,y,width,height,color,postgui,topcolor,bordercolor)

dxDrawRectangle(x,y+(height*5/100),width,height-(height*5/100),color,postgui)--down
dxDrawRectangle(x+(width*6.5/100),y,width-(width*6.5/100),(height*5/100),topcolor,postgui)---top
dxDrawRectangle(x,y,(width*6.5/100),(height*5/100),bordercolor,postgui)---chip left
dxDrawRectangle(x+(width*93.5/100),y,(width*6.5/100),(height*5/100),bordercolor,postgui)---chip right
dxDrawLine(x,y+(height*5/100),x,y+(height),bordercolor,1,postgui)--left
dxDrawLine(x+(width)-1,y+(height*5/100),x+width-1,y+(height),bordercolor,1,postgui)--right
dxDrawLine(x,y+(height)-1,x+width,y+(height)-1,bordercolor,1,postgui)--bottom


end


function dxDrawRoundedRectangle(x, y, rx, ry, color, radius,postgui)
    rx = rx - radius * 2
    ry = ry - radius * 2
    x = x + radius
    y = y + radius

    if (rx >= 0) and (ry >= 0) then
        dxDrawRectangle(x, y, rx, ry, color,postgui)
        dxDrawRectangle(x, y - radius, rx, radius, color,postgui)
        dxDrawRectangle(x, y + ry, rx, radius, color,postgui)
        dxDrawRectangle(x - radius, y, radius, ry, color,postgui)
        dxDrawRectangle(x + rx, y, radius, ry, color,postgui)

        dxDrawCircle(x, y, radius, 180, 270, color, color, 7,1,postgui)
        dxDrawCircle(x + rx, y, radius, 270, 360, color, color, 7,1,postgui)
        dxDrawCircle(x + rx, y + ry, radius, 0, 90, color, color, 7,1,postgui)
        dxDrawCircle(x, y + ry, radius, 90, 180, color, color, 7,1,postgui)
    end
end

function dxDrawButton(x, y, width, height, color,bordercolor,postgui)


dxDrawRectangle(x, y, width, height, color,postgui)---button self
---borders
dxDrawLine(x,y,x+width-1,y,bordercolor,1,postgui)--top
dxDrawLine(x,y,x,y+height,bordercolor,1,postgui)--left
dxDrawLine(x+width-1,y,x+width-1,y+height,bordercolor,1,postgui)--right
dxDrawLine(x,y+height,x+width-1,y+height,bordercolor,1,postgui)--bottom	

end


--[[

function dxDrawRoundUpRectangle(x, y, width, height,topcolor, color,postgui)
local radius=(height*5/100)/2
   local width = width - (radius * 2)
   local height = height -( radius * 2)
  local  x = x + radius
  local  y = y + radius

        
        dxDrawCircle(x, y+radius, radius*2, 180, 270, topcolor, topcolor, 7,1,postgui)
        dxDrawCircle(x + width, y+radius, radius*2, 270, 360, topcolor, topcolor, 7,1,postgui)
		dxDrawRectangle(x, y-radius, width, radius*2, topcolor,postgui)
        dxDrawRectangle(x-(radius*2), y+radius, width+(radius*4), height+radius, color,postgui)
		

end]]--

function dxDrawDxWindow(x, y, width, height,topcolor, color,bordercolor,postgui)

dxDrawRectangle(x,y,width,height,color,postgui)
dxDrawRectangle(x,y,width,height*5/100,topcolor,postgui)


dxDrawLine(x,y,x+width-1,y,bordercolor,1,postgui)--top top :D

dxDrawLine(x,y,x,y+height,bordercolor,1,postgui)--left  

dxDrawLine(x+width-1,y,x+width-1,y+height,bordercolor,1,postgui)--right  

dxDrawLine(x,y+height,x+width-1,y+height,bordercolor,1,postgui)--bottom  

end




function countString(str)
_, count = string.gsub(str, "[^\128-\193]", "")
return count
end

function getMaxStringForWidth(text,width,isinvers,scale,font)

	local scale=scale or 1.15
	
	local font=font or 'default-bold'
	
	local isinvers= isinvers or false
	
	local mystring=''
	
	local inverstable={}
	
	local num=0
		
	if text~=nil then
			
		local txtwidth=dxGetTextWidth( text,scale,font)
			
			if width>=txtwidth then
			
				return text,text
			
			end
						
		for v in text:gmatch('.') do
		

				if not isinvers then

				mystring=mystring..v
				
					local finalWidth=dxGetTextWidth( mystring,scale,font)
					
						if finalWidth>=width then
							
							mystring=mystring:gsub("[%z\1-\127\194-\244][\128-\191]*$", "")
							
							return mystring,text
							
						end
				
				else
				
					table.insert(inverstable,v)
				
				end
		end
		
				if isinvers then
 
					num=#inverstable
					
					while(num>=1) do
					
						mystring=inverstable[num]..mystring
						
						local finalWidth=dxGetTextWidth( mystring,scale,font)
					
						if finalWidth>=width then
														
							return mystring,text
							
						end
						
						num=num-1
					
					end
					
			return mystring,text
				
				
			
		end
		
	end
	
	return false,text
end


function getCurrentPositionOFCursor(v)

local mystring=v.text

local num=v.backposition	

	
for k=1,num do
	mystring=deleteLastCharacter(mystring)
end
local width=dxGetTextWidth( mystring,1.15,"default-bold")
return 	width
	
end


function isCharBanned(ch)

for k,v in pairs(bannedchars)do

	if string.find(ch,v) then
		
		return true
		
	end

end

return false

end





function disableAllEdit()

	for k,v in ipairs(getElementsByType('dxEdit'))do

		Elements[v].isenabled=false
	
	end

end



function disableAllMemo()

	for k,v in ipairs(getElementsByType('dxMemo'))do

		Elements[v].isenabled=false
	
	end

end



function disableAllScrollBars()

	for k,v in ipairs(getElementsByType('dxScrollBar'))do

		Elements[v].ismoving=false
	
	end

end

function getEditBaba(el)
	for k,v in pairs(Elements) do
	
		if v.edit and v.edit==el then
		
			return k
			
		end
		
	end

	return false

end

function getMemoBaba(el)
	for k,v in pairs(Elements) do
	
		if v.memo and v.memo==el then
		
			return k
			
		end
		
	end

	return false

end


function dxSetVisible(element,stat)
	if isElement(element) then
	
		if not bannedelements[tostring(getElementType(element))] then
				Elements[element].visible=stat
		for k,v in ipairs(getElementChildren(element))do
			dxSetVisible(v,stat)
		end
		triggerEvent('onClientDxVisibleChange',element,stat)
		end
	else
		outputDebugString('dxSetVisible Bad argument @1 expected element got '..type(element),3,255,0,0)
	end
end


function dxGetVisible(element)
	if isElement(element) then
		return Elements[element].visible
	else
		outputDebugString('dxGetVisible Bad argument @1 expected element got '..type(element),3,255,0,0)
	end
end


function getIsEnabledEdit()

for k,v in ipairs(getElementsByType('dxEdit'))do

	if Elements[v].isenabled and Elements[v].visible then

		return v
	
	end

end

return false

end
function getIsEnabledMemo()

for k,v in ipairs(getElementsByType('dxMemo'))do

	if Elements[v].isenabled and Elements[v].visible then

		return v
	
	end

end

return false

end
----------------------------------------------------gridList

function getRowPositionInTheMotherTable(grid,row,col)
	
	for u,j in ipairs(Elements[grid].rows)do
		
		for k,v in ipairs(Elements[grid].rows[u])do
		
			if Elements[grid].rows[u][k]==Elements[grid].visiblerows[row][col] then
			
			return u,k
			
			end
		
		end
		
	end

end

function dxGridListGetColumnPosition(grid,col)

	if Elements[grid] and Elements[grid].type=='gridList' then
	
	local thewidth=Elements[grid].columns[col].width

			if Elements[grid].columns[col].width+Elements[grid].columns[col].x>Elements[grid].x+Elements[grid].width then
			
				thewidth=(Elements[grid].columns[col].x-Elements[grid].x)-Elements[grid].width
				
			end
	
		return Elements[grid].columns[col].x,Elements[grid].columns[col].y,thewidth,Elements[grid].columns[col].height
	
	end
	
	return false


end




function sumTheBeforeRows(grid,row,col)

local value=Elements[grid].height*5/100

	if Elements[grid].rows[row-1] then
	
		
		for k,v in ipairs(Elements[grid].rows)do
		
			for m,j in ipairs(v)do
				
				if j.col==col then

					if j.iswork then
					
						value=value+j.height
					
					end
					
				end
			
			end
		
		end
	
	end
	return value

end


function getColumnTable(grid,num,another)

for k,v in ipairs(Elements[grid].rows[another])do
		
			
			if v.col==num then
			
				return v,k
						
			end
		
		end
	

end


function dxGetMaxRowNumber(grid)

if Elements[grid].rows[1] and Elements[grid].rows[1][1] then
			
		return round(Elements[grid].height/Elements[grid].rows[1][1].height)

end
return false
end



function dxGetMaxAndMinRowNumber(grid)

local num=1 
	for k,v in ipairs(Elements[grid].rows)do
		
		if v[1].y==Elements[grid].y+(Elements[grid].height*5/100) then
			num=k
		end
		
		if v[1].y+v[1].height>Elements[grid].y+Elements[grid].height then
		
			return num,k-1
			
		end
	
	end
return false
end




function dxGridListchangeScrollBarOfSize(grid)
local num=dxGetMaxRowNumber(grid)
	
	if num then

		local result=0
			local checkme=0
		

			
			local starty,endy=dxGetMaxAndMinRowNumber(grid)
			
			for k,v in ipairs(Elements[grid].rows) do
			
				result=result+Elements[grid].rows[k][1].height
				
			end
			

				for k,v in ipairs(Elements[grid].unvisiblerowsdown) do
				
				checkme=checkme+Elements[grid].unvisiblerowsdown[k][1].height
				
				end

				for k,v in ipairs(Elements[grid].unvisiblerowsup) do
				
				checkme=checkme+Elements[grid].unvisiblerowsup[k][1].height
				
				end

				local me=(checkme/result)*100


			
			if Elements[grid].myscroll then
			local ho=Elements[Elements[grid].myscroll].height-((Elements[Elements[grid].myscroll].height*me)/100)
			
				
			Elements[Elements[grid].myscroll].heightofscroll=ho
			
			end
			
	end

end

function myGridFunction(grid)
	
	local starty,endy=dxGetMaxAndMinRowNumber(grid)
		local checkme=0
		if endy then
		for k=1,#Elements[grid].unvisiblerowsdown do
			
			checkme=checkme+Elements[grid].unvisiblerowsdown[k][1].height
		
		end
		
		local me=(Elements[grid].unvisiblerowsdown[1][1].height/checkme)*100
		
		return me
		end
		return false
end


function getTheFunction(thegr)
		local checkme=0
				
			if #Elements[thegr].unvisiblerowsup~=0 then
			for k=1,#Elements[thegr].unvisiblerowsup do

				checkme=checkme+Elements[thegr].rows[k][1].height
				
			end

		local me=(Elements[thegr].rows[1][1].height/checkme)*100
		
		return me
		end
		return false
end




function getPercentegOfHiddenRows(grid,num)
		local result=0
		

			local yes=false
			for k,v in ipairs(Elements[grid].unvisiblerowsdown) do
			
				result=result+Elements[grid].unvisiblerowsdown[k][1].height
				if not yes then
					
					yes=Elements[grid].unvisiblerowsdown[k][1].height
					
				end
				
			end
			
			for k,v in ipairs(Elements[grid].unvisiblerowsup) do
			
				result=result+Elements[grid].unvisiblerowsup[k][1].height
				if not yes and Elements[grid].unvisiblerowsdown[k] then
					
					yes=Elements[grid].unvisiblerowsdown[k][1].height
					
				end
				
			end
			
			

			if not yes then yes=0 end
			
			local val=((num*yes)/result)*100
				
return val			
			
end


function canIscrollTheGridList(grid,pr,old,scroll,inc)

	if inc then

	
		local fin=(100/dxGridListGetUnVisibleRowCount(grid))
		
			
			

			
				if (Elements[scroll].distanc/(Elements[scroll].height-Elements[scroll].heightofscroll))*100>=fin and  (Elements[scroll].distanc/(Elements[scroll].height-Elements[scroll].heightofscroll))*100>fin*Elements[grid].scrolledrowsup then

					Elements[grid].scrolledrowsup=Elements[grid].scrolledrowsup+1

					return true

				end
			
			
		
		return false
		
	else
	
	
	
	end

end


function dxGetText(el)
	if Elements[el] and Elements[el].text then

		return Elements[el].text
	
	end
return false

end
function dxSetText(el,tx)
	if Elements[el] and Elements[el].text then

		 Elements[el].text=tx
	return true
	end
return false

end

function dxSetPosition(el,myownx,myowny)
	if Elements[el] and Elements[el].x and Elements[el].y then
		
		local oldx,oldy=Elements[el].x,Elements[el].y
		
		Elements[el].x=myownx
		Elements[el].y=myowny
		
		local ch=getElementChildren(el)
		
		if #ch~=0 then
			
			for k,v in ipairs(ch) do
			
				if not bannedelements[getElementType(v)] then
				
					if oldx>myownx then
					
						Elements[v].x=Elements[v].x-(oldx-myownx)
						
						else
						
						Elements[v].x=Elements[v].x+(myownx-oldx)
					
					end
					
					
					if oldy>myowny then
					
						Elements[v].y=Elements[v].y-(oldy-myowny)
						
						else
						
						Elements[v].y=Elements[v].y+(myowny-oldy)
					
					end
					
					
			
				end
			
			end
			
		end
		
		
	return true
	end
	
return false

end


function dxGetPosition(el)
	if Elements[el] and Elements[el].x and Elements[el].y then
	

	return  Elements[el].x, Elements[el].y
	
	end
	
return false

end

function dxSetSize(el,mx,my)
	if Elements[el] and Elements[el].width and Elements[el].height then

		 Elements[el].width=mx
		 Elements[el].height=my
	return true
	end
return false

end

function dxGetSize(el,mx,my)
	if Elements[el] and Elements[el].width and Elements[el].height then

	return Elements[el].width,Elements[el].height
	end
return false

end


function dxGetPosition(el)
	if Elements[el] and Elements[el].width and Elements[el].height then

	return  Elements[el].width, Elements[el].height
	
	end
return false

end


function getTextNumbersOfLines(text,borderwidth,scale,font)
	
	local scale=scale or 1
	local font=font or 'default'

	if dxGetTextWidth(text,scale,font)>borderwidth then---if it's in new line then
		local mytext=''
		local numoflines=1
		for c in string.gmatch(text,"%w+") do

			mytext=mytext..' '..c
			local currentwidth=dxGetTextWidth(mytext,scale,font)
			
			if currentwidth>borderwidth then
			
				numoflines=numoflines+1
				mytext=c
		
			end
		end

		return numoflines
	
	
	end
	
return 1---else
end


function getDXRootElements()
local ta={}

	for k,v in ipairs(alltypes)do
	
		for m,j in ipairs(getElementsByType(v,resourceRoot)) do
		
			table.insert(ta,j)
		
		end
		
	end
	
	return ta

end
