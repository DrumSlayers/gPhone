local APP = {}

APP.PrintName = "Contacts"
APP.Icon = "vgui/gphone/contacts.png"

function APP.Run( objects, screen )
	gPhone.DarkenStatusBar()
	
	objects.Title = vgui.Create( "DLabel", screen )
	objects.Title:SetText( "Contacts" )
	objects.Title:SetTextColor(Color(0,0,0))
	objects.Title:SetFont("gPhone_TitleLite")
	objects.Title:SizeToContents()
	objects.Title:SetPos( screen:GetWide()/2 - objects.Title:GetWide()/2, 25 )
	
	local offset = 20 -- A little trick to push the scrollbar off the screen
	objects.LayoutScroll = vgui.Create( "DScrollPanel", screen )
	objects.LayoutScroll:SetSize( screen:GetWide() + offset, screen:GetTall() - 50 )
	objects.LayoutScroll:SetPos( 0, 80 )
	
	objects.Layout = vgui.Create( "DIconLayout", objects.LayoutScroll)
	objects.Layout:SetSize( screen:GetWide(), 0 )
	objects.Layout:SetPos( 0, 0 )
	objects.Layout:SetSpaceY( 0 )
	
	APP.ImportContacts( objects, objects.Layout )
end

function APP.ImportContacts( objects, layout )
	local screen = gPhone.phoneScreen	
	local contactList = {}
	local contactPanels = {}
	local categoryPanels = {}
	
	-- Create a table of online playeres
	for k, v in pairs(player.GetAll()) do
		table.insert(contactList, v:Nick())
	end
	table.sort(contactList)
	
	objects.SearchBar = vgui.Create("DTextEntry", screen)
	objects.SearchBar:SetSize(screen:GetWide(), 20)
	objects.SearchBar:SetPos(0, 50)
	objects.SearchBar:SetText( "Search" )
	objects.SearchBar:SetFont("gPhone_Title")
	objects.SearchBar:SetSize( screen:GetWide(), 30 )
	objects.SearchBar.OnTextChanged = function( self )
		local needle = self:GetText():lower()
		
		-- Nothing in the search bar
		if needle == nil or needle == "" then
			for k, v in pairs( categoryPanels ) do
				v:SetVisible(true)
			end
			for k, v in pairs( contactPanels ) do
				v:SetVisible(true)
			end
			return 
		end
		
		-- Start searching
		for k, v in pairs( categoryPanels ) do
			v:SetVisible(false) -- Hide letter categories
		end
		for k, v in pairs( contactPanels ) do
			local haystack = v:GetChildren()[1]:GetText():lower() -- Get the button's label's text
			
			if string.find(haystack, needle) then
				v:SetVisible(true) -- This contact matches the search
			else
				v:SetVisible(false)
			end
		end
		layout:LayoutIcons_TOP() -- Layout the contact list
	end
	
	-- Populate the contact list
	local prevLetter = 0
	for k, nick in pairs(contactList) do
		local nickLetter = nick[1] -- Grab the first letter of the string
		
		if string.lower(nickLetter) != string.lower(prevLetter) then -- Create a new letter category
			prevLetter = nickLetter
			local key = string.lower(nickLetter)
			
			categoryPanels[key] = layout:Add("DPanel")
			categoryPanels[key]:SetSize(screen:GetWide(), 20)
			categoryPanels[key].Paint = function( self )
				draw.RoundedBox(0, 0, 0, self:GetWide(), self:GetTall(), Color(240, 240, 240))
				--draw.RoundedBox(0, 30, self:GetTall()-1, self:GetWide()-30, 1, Color(150, 150, 150))
			end
			
			local letter = vgui.Create( "DLabel", categoryPanels[key] )
			letter:SetText( string.upper(prevLetter) )
			letter:SetTextColor( Color(0,0,0) )
			letter:SetFont("gPhone_Title")
			letter:SizeToContents()
			letter:SetPos( 30, 0 )
		end
		
		APP.AddContact( layout, contactPanels, nick )
	end
end

function APP.AddContact( layout, pnlTable, nick )
	local screen = gPhone.phoneScreen
	
	pnlTable[nick] = layout:Add("DButton")
	pnlTable[nick]:SetSize(screen:GetWide(), 30)
	pnlTable[nick]:SetText("")
	pnlTable[nick].Paint = function( self )
		if not self:IsDown() then
			draw.RoundedBox(0, 0, 0, self:GetWide(), self:GetTall(), Color(250, 250, 250))
		else
			draw.RoundedBox(0, 0, 0, self:GetWide(), self:GetTall(), Color(230, 230, 230))
		end
		
		draw.RoundedBox(0, 25, self:GetTall()-1, self:GetWide()-25, 1, Color(150, 150, 150))
	end
	pnlTable[nick].DoClick = function()
		APP.ContactInfo( nick )
	end
	
	local contactName = vgui.Create( "DLabel", pnlTable[nick] )
	contactName:SetText( nick )
	contactName:SetTextColor(Color(0,0,0))
	contactName:SetFont("gPhone_Title")
	contactName:SizeToContents()
	local w, h = contactName:GetSize()
	contactName:SetSize( screen:GetWide() - 35, h)
	contactName:SetPos( 30, 5 )
end

function APP.ContactInfo( name )
	local ply = util.GetPlayerByNick( name )
	if not IsValid(ply) then return end
	
	local objects = gPhone.AppBase["_children_"]
	local screen = gPhone.phoneScreen
	local layout = objects.Layout
	
	for k, v in pairs(objects.Layout:GetChildren()) do
		v:SetVisible(false)
	end
	objects.SearchBar:SetVisible(false)
	objects.LayoutScroll:SetPos( 0, 50 )
	
	local tX, tY = objects.Title:GetPos()
	
	objects.Back = vgui.Create("DButton", screen)
	objects.Back:SetText("Back")
	objects.Back:SetFont("gPhone_TitleLite")
	objects.Back:SetTextColor( gPhone.Config.ColorBlue )
	objects.Back:SetPos( 10, tY )
	objects.Back.Paint = function() end
	objects.Back:SetSize( gPhone.GetTextSize("Back", "gPhone_TitleLite") )
	objects.Back.DoClick = function()
		objects.Back:Remove()
		
		objects.LayoutScroll:SetPos( 0, 80 )
		objects.SearchBar:SetVisible(true)
		for k, pnl in pairs(objects.Layout:GetChildren()) do
			if pnl:IsVisible() then
				pnl:Remove()
			else
				pnl:SetVisible(true)
			end
		end
	end
	
	local titlePanel = layout:Add("DPanel")
	titlePanel:SetSize(screen:GetWide(), 70)
	titlePanel.Paint = function( self )
		draw.RoundedBox(0, 0, 0, self:GetWide(), self:GetTall(), Color(250, 250, 250))
		draw.RoundedBox(0, 0, 1, self:GetWide(), 1, Color(20, 40, 40))
	end
	
	local contactAvatar = vgui.Create("AvatarImage", titlePanel)
	contactAvatar:SetPos( 10, 10 )
	contactAvatar:SetSize( 50, 50 )
	contactAvatar:SetPlayer( ply, 64 )
	
	local contactName = vgui.Create( "DLabel", titlePanel )
	contactName:SetText( name )
	contactName:SetTextColor(Color(0,0,0))
	contactName:SetFont("gPhone_Title")
	contactName:SizeToContents()
	contactName:SetPos( 70, 25 )
	
	local numberPanel = layout:Add("DPanel")
	numberPanel:SetSize(screen:GetWide(), 50)
	numberPanel.Paint = function( self )
		draw.RoundedBox(0, 0, 0, self:GetWide(), self:GetTall(), Color(250, 250, 250))
	end
	
	local text = vgui.Create( "DLabel", numberPanel )
	text:SetText( "Number" )
	text:SetTextColor( gPhone.Config.ColorBlue )
	text:SetFont("gPhone_StatusBar")
	text:SizeToContents()
	text:SetPos( 10, 10 )
	
	local contactNumber = vgui.Create( "DLabel", numberPanel )
	contactNumber:SetText( ply:GetPhoneNumber() )
	contactNumber:SetTextColor(Color(0,0,0))
	contactNumber:SetFont("gPhone_Title")
	contactNumber:SizeToContents()
	contactNumber:SetPos( 15, 25 )
	
	local textContact = vgui.Create( "DImageButton", numberPanel ) 
	textContact:SetSize( 24, 24 )
	textContact:SetPos( numberPanel:GetWide() - textContact:GetWide() - 15, 10 )
	textContact:SetImage( "vgui/gphone/text.png"  )	
	textContact:SetColor( gPhone.Config.ColorBlue )
	textContact.DoClick = function()
		gPhone.ToHomeScreen()
		gPhone.RunApp( "messages" )
	end
	
	local callContact = vgui.Create( "DImageButton", numberPanel ) 
	callContact:SetSize( 24, 24 )
	callContact:SetPos( numberPanel:GetWide() - callContact:GetWide() - textContact:GetWide() - 20, 10 )
	callContact:SetImage( "vgui/gphone/phone.png"  )		
	callContact:SetColor( gPhone.Config.ColorBlue )
	callContact.DoClick = function()
		gPhone.ToHomeScreen()
		gPhone.RunApp( "phone" )
	end
end

function APP.Paint( screen )
	draw.RoundedBox(2, 0, 0, screen:GetWide(), screen:GetTall(), Color(200, 200, 200))
		
	draw.RoundedBox(2, 0, 0, screen:GetWide(), 50, Color(250, 250, 250))
	draw.RoundedBox(0, 0, 50, screen:GetWide(), 1, Color(20, 40, 40))
end

gPhone.AddApp(APP)