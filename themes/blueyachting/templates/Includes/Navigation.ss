<nav class="primary animatedMenu">
	<ul class="justify-content-center nav">
		<% loop $Menu(1) %>
			<li class="$LinkingMode px-3 py-4 <% if $Children %>have-children-<% end_if %>">
				<a href="$Link" <% if $ClassName.ShortName='RedirectorPage' %>target="_blank"<% end_if %> title="Zur Seite $Title.XML springen">$MenuTitle.XML <% if $Children %><i class="fas fa-chevron-down fa-xs"></i><% end_if %></a>
				<% include SubMenu %>
			</li>
		<% end_loop %>
	</ul>
</nav>
