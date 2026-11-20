<% if $Pages %>
	<a href="$getMyClass('HomePage').First.Link">$getMyClass('HomePage').First.Title</a> $Delimiter.RAW
	<% loop $Pages %><% if $Last %>$MenuTitle.XML<% else %><% if not Up.Unlinked %><a href="$Link" class="breadcrumb-$Pos"><% end_if %>$MenuTitle.XML<% if not Up.Unlinked %></a><% end_if %> $Up.Delimiter.RAW <% end_if %><% end_loop %>
<% end_if %>
