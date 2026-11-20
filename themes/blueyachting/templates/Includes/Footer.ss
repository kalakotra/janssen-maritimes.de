<section class="wave-bg d-none-">
	<div class="container pt-5">
		<div class="row py-5">
			<div class="col-12 pt-5 mt-5">
				<% loop getMyClass("HomePage").limit(1) %>$OurNewsletter<% end_loop %>
			</div>
			<div class="col-12 py-5">
				$NewsletterFormasdf
			</div>
		</div>
	</div>
</section>
<footer class="bg-secondary text-white py-5" id="footer">
	<div class="container ">
		<div class="row justify-content-between">
			
			<div class="col-12 col-lg-4">
				$SiteConfig.FooterText
			</div>
			<div class="col-12 col-lg-4">
				$SiteConfig.FooterText2
			</div>
			<div class="col-12 col-lg-4">
				<div class="row no-gutters">
					<div class="col-12 col-md-6 col-lg-4 pb-4" >
						<% loop Menu(1) %>
							<% if isFirst %><% else %>
								<% if Children.Count > 1 %>
									</div><div class="col-12 col-md-6 col-lg-3 pb-4" >
								<% else %>
									<div class="w-100 pt-3"></div>
								<% end_if %>
							<% end_if %>
							<a href="$Link" class="text-uppercase font-weight-bold d-block pb-1 text-white">$Title</a>
							
							<% if Children %>
								<% loop Children %>
									<a href="$Link" class="text-white">$Title</a><br />
								<% end_loop %>
							<% end_if %>
							
						<% end_loop %>
					</div>
				</div>
			</div>
		</div>
	</div>
</footer>
