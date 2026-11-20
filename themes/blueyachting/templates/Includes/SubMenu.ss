<%--Include SubMenu recursively --%>
<% if $Children %>
	<ul>
		<% loop $Children %>
			<li class="$LinkingMode ">
				<a href="$Link" <% if $ClassName.ShortName='RedirectorPage' %>target="_blank"<% end_if %> title="Zur Seite $Title.XML springen" class="px-3 py-1 d-block">$MenuTitle.XML</a>
				<% include SubMenu %>
			</li>
		<% end_loop %>
	</ul>
<% end_if %>