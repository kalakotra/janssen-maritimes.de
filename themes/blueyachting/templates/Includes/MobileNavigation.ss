
<div class="container h-100">
	<div class="row">
		<div class="col-8 py-3">
			<a href="home/"><img src="$resourceURL('themes/blueyachting/images/janssen-maritimes-logo.svg')" alt="Janssen Maritimes logo" class="logo" /></a>
		</div>
		<div class="col-4 align-self-center text-right">
			<button class="hamburger hamburger--squeeze" type="button">
				<span class="hamburger-box">
					<span class="hamburger-inner"></span>
					<span class="d-none-special">menu</span>
				</span>
			</button>
		</div>
	</div>
	<div class="row h-75">
		<div class="col-12 align-self-center">
			<nav >
				<ul class="sideMain">
					<% loop $Menu(1) %>
						<li class="$LinkingMode">
							<a href="$Link"  <% if $ClassName.ShortName='RedirectorPage' %>target="_blank"<% end_if %>  title="Zur Seite $Title.XML springen" class="animated">$MenuTitle.XML</a>
							<% if Children %>
								<span class="arrow"></span>
								<ul class="sideSub">
									<% loop Children %>
										<li class="$LinkingMode">
											<a href="$Link" <% if $ClassName.ShortName='RedirectorPage' %>target="_blank"<% end_if %> title="Zur Seite $Title.XML springen" class="animated">$MenuTitle.XML</a>
											<% if Childrenasdf %>
												<span class="arrow"></span>
												<ul class="sideSub">
													<% loop Children %>
														<li class="$LinkingMode"><a href="$Link" title="Zur Seite $Title.XML springen" class="animated">$MenuTitle.XML</a></li>
													<% end_loop %>
												</ul>
											<% end_if %>
										</li>
									<% end_loop %>
								</ul>
							<% end_if %>
						</li>
					<% end_loop %>
					<li class="text-center py-5">
						<% if $SiteConfig.Telephone %><a href="tel://$SiteConfig.TelephoneLink" class="px-3"><i class="fas fa-phone-alt fa-2x"></i><span class="d-none-special"> $SiteConfig.Telephone</span></a><% end_if %>
						<% if $SiteConfig.Email %><a href="mailto://$SiteConfig.Email" class="px-3"><i class="fas fa-envelope fa-2x"></i><span class="d-none-special"> $SiteConfig.Email</span></a><% end_if %>
					</li>
					<li class="text-center">
						<% if $SiteConfig.Facebook %>
							<a href="$SiteConfig.Facebook" rel="nofolow" class="pr-1 text-white"><i class="fab fa-facebook  fa-2x"></i><span class="d-none-special">facebook</span></a>
						<% end_if %>
						<% if $SiteConfig.Twitter %>
							<a href="$SiteConfig.Twitter" rel="nofolow" class="pr-1 text-white"><i class="fab fa-twitter  fa-2x"></i><span class="d-none-special">twitter</span></a>
						<% end_if %>
						<% if $SiteConfig.Instagram %>
							<a href="$SiteConfig.Instagram" rel="nofolow" class="pr-1 text-white"><i class="fab fa-instagram  fa-2x"></i><span class="d-none-special">instagram</span></a>
						<% end_if %>
					</li>
				</ul>
			</nav>
		</div>
	</div>
</div>

