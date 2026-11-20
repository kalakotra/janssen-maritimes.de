<main class="aditional-content-bg">
	<div class="container">
		<div class="row pt-5 justify-content-between">
			<% if ContentTitle %>
				<div class="col-12">
					<h1>$ContentTitle</h1>
				</div>
			<% end_if %>
			<% if HeaderImage %>
				<div class="col-12 col-md-6 py-3 py-lg-5">
					$HeaderImage
				</div>
			<% end_if %>
			<div class="col-12 <% if HeaderImage %>col-md-6<% end_if %>  py-3 py-lg-5">
				$Content			
			</div>
			

			<div class="col-12 py-5">
				<div class="row justify-content-center d-none-">
					<% loop Logo %>
						<div class="col-6 col-md-3 col-xl-2 py-3 rounded-image">
							$Pad(275,160)
						</div>
					<% end_loop %>
				</div>
				$OurTrademarks
				<div class="row justify-content-center py-5">
					<% loop getMyClass("BooteHolder").filter("ShowOnHomeLogo", "1") %>
						<div class="col-4 col-md-3 col-lg-2 pb-4" data-aos="fade-up" data-aos-offset="{$Pos(1)}00">
							<a href="$Link">$HolderLogo.Pad(250,200,FFFFFF,100)</a>
						</div>
					<% end_loop %>
				</div>
			</div>
		</div>
	</div>
</main>

<section>
	<div class="container pb-5">
		<div class="row py-3 py-lg-5 justify-content-center">
			<div class="col-12 col-lg-10 pb-3 pb-lg-5">
				$OurServices
			</div>
			<% loop getRandomOfClass("ServicePage", 3) %>
				<div class="col-12 col-lg-4 mb-3" data-aos="fade-up" data-aos-offset="{$Pos(1)}00">
					<div class="serviceBoxHolder h-100 row no-gutters justify-content-center py-4">
						<div class="col-11 text-center text-uppercase font-size-1-5 text-primary font-weight-bold">
							<% if PreviewTitle %>$PreviewTitle<% else %>$Title<% end_if %>
						</div>
						<div class="col-10 text-center">
							<% if PreviewText %>$PreviewText.limitWordCount(20)<% else %>$Content.limitWordCount(20)<% end_if %>
						</div>
						<div class="col-8 text-center align-self-end pt-3">
							<a href="$Link" class="text-uppercase btn btn-block btn-info stretched-link"><%t Page.MoreInfo "Mehr erfahren" %></a>
						</div>
					</div>
				</div>
			<% end_loop %>
		</div>
	</div>
</section>



<% include BlogBox %>

<% include NewsAndEvents %>
