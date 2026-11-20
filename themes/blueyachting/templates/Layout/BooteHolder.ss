<main>
	<div class="container">
		<div class="row pt-5 justify-content-between">
			<% if ContentTitle %>
				<div class="col-12">
					<h1>$ContentTitle</h1>
				</div>
			<% end_if %>
			
			
			<% if HolderLogo || AwardImage %>
				<div class="col-12 col-md-5 py-3 py-lg-5"  data-aos="fade-right">
					<% if HolderLogo %>
						<div class="pb-3 py-lg-5">$HolderLogo</div>
					<% end_if %>
					<% if AwardImage %>
						<div class="row">
							<div class="col-12 pb-3">
								<strong>AWARDS</strong>
							</div>
							<% loop AwardImage %>
								<div class="col-auto col-lg-3 pb-3">
									$Pad(100, 100, FFFFFF)
									<br />
									<span class="font-size-0-75">$Title</span>
								</div>
							<% end_loop %>
						</div>
					<% end_if %>
				</div>
			<% end_if %>
			<div class="col-12 <% if HolderLogo || AwardImage %>col-md-7<% end_if %>  py-3 py-lg-5" data-aos="fade-left">
				$Content			
			</div>
		</div>
	</div>
</main>

<% if Children %>
	<section class="bg-light">
		<div class="container py-5">
			<div class="row justify-content-between">
				<% loop Children %>
					<div class="col-12 col-md-6 col-xl-5">
						<% include ChildrenLoopBox %>
					</div>
					<% if MultipleOf(2) %>
						<div class="w-100">
						</div>
					<% end_if %>
				<% end_loop %>
			</div>
		</div>
	</section>
<% end_if %>

<% if AdditionalContent1 || AdditionalContent2 %>
	<section class="aditional-content-bg">
		<div class="container py-5">
			<div class="row py-5">
				<% if AdditionalContent1 %>
					<div class="col-12 <% if AdditionalContent2 %>col-lg-6<% end_if %> py-3 py-lg-5 " data-aos="fade-right">
						$AdditionalContent1
					</div>
				<% end_if %>
				<% if AdditionalContent2 %>
					<div class="col-12 <% if AdditionalContent1 %>col-lg-6<% end_if %> py-3 py-lg-5 " data-aos="fade-left">
						$AdditionalContent2
					</div>
				<% end_if %>

			</div>
		</div>
	</section>
<% end_if %>

<% include NewsAndEvents %>