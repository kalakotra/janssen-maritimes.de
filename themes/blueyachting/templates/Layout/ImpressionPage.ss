<main>
	<div class="container">
		<div class="row pt-5 justify-content-between">
			<% if Parent.HolderLogo %>
				<div class="col-12 text-center">
					$Parent.HolderLogo.Pad(250, 250, FFFFFF)
				</div>
			<% end_if %>
			<% if ContentTitle %>
				<div class="col-12">
					<h1>$ContentTitle</h1>
				</div>
			<% end_if %>
			<div class="col-12 <% if ContentRight %>col-md-6<% end_if %>  py-3 py-lg-5">
				$Content			
			</div>
			<% if ContentRight %>
				<div class="col-12 col-md-6 py-3 py-lg-5">
					$ContentRight
				</div>
			<% end_if %>
		</div>
		<% if Highlight %>
			<div class="row justify-content-center">
				<% loop Highlight %>
					<div class="col-12 col-md-6 col-lg-4- col-xxl-3 mb-5"  data-aos="fade-up" data-aos-offset="{$Pos(1)}00">
						<div class="h-100 shadow p-3 bg-light">
							<div class="text-center font-weight-bold font-size-1-5">
								$Title
							</div>
							<div class="row no-gutters">
								<% loop HighlightValue %>
									<div class="col-auto pt-2">
										<i class="far fa-check-circle pr-2 text-primary"></i>
									</div>
									<div class="col-10 pt-2">
										$Title
									</div>
									<div class="w-100"></div>
								<% end_loop %>
							</div>
						</div>
					</div>
					<% if MultipleOf(4) %>
						<div class="w-100 d-none d-xxl-block-"></div>
					<% end_if %>
				<% end_loop %>
			</div>
		<% end_if %>
	</div>
</main>

<% if Video %>
	<section class="bg-light">
		<div class="container py-5">
			<div class="row justify-content-center">
				<div class="col-12 col-lg-8">
					<div id="carouselVideo" class="carousel slide" data-ride="carousel">
						<div class="carousel-inner">
							<% loop Video %>
								<div class="carousel-item <% if isFirst %>active<% end_if %>">
									<iframe frameborder="0" width="1024" height="450" src="https://www.youtube.com/embed/$YoutubeCode" allowfullscreen></iframe>
								</div>
							<% end_loop %>
						</div>
						<ol class="carousel-indicators">
							<% loop Video %>
								<li data-target="#carouselVideo" data-slide-to="$Pos(0)" <% if isFirst %>class="active"<% end_if %> style="background-image: url($myThumb.URL);" title="$Title"></li>
							<% end_loop %>
						</ol>
					</div>
				</div>
			</div>
		</div>
	</section>
<% end_if %>


<section class="bg-light">
	<% if ExteriorSeparatorImage %>
		<div class="separatorBlock" style="background-image: url($ExteriorSeparatorImage.URL);">
			$ExteriorSeparatorImage
		</div>
	<% end_if %>
	<div class="container py-5">
		<div class="row ">
			<% if ExteriorTitle %>
				<div class="col-12 pb-5">
					<h2 class="mb-0">$ExteriorTitle</h2>
				</div>
			<% end_if %>
			<% if ExteriorText1 %>
				<div class="col-12 <% if ExteriorText2 %>col-md-6<% end_if %> pb-5">
					$ExteriorText1
				</div>
			<% end_if %>
			<% if ExteriorText2 %>
				<div class="col-12 col-md-6 pb-5">
					$ExteriorText2
				</div>
			<% end_if %>
			<% if ExteriorLinkTitle %>
				<div class="w-100"></div>
				<div class="col-12 pb-5 text-center">
					<a href="$ExteriorLinkURL" class="btn btn-primary btn-lg" rel="nofollow" target="_blank">$ExteriorLinkTitle</a>
				</div>
			<% end_if %>
		</div>
	</div>
</section>

<% if ExteriorImage %>
	<section>
		<div class="container py-5">
			<div class="row justify-content-center no-gutters">
				<% loop ExteriorImage.sort("SortOrder") %>
					<div class="col-4 col-md-3 col-lg-2 col-xl-1">
						<a class="p-2 p-md-3 d-inline-block" data-fancybox="exterior" href="$URL" data-caption="$Title">$FocusFill(350,350)</a>
					</div>
					<% if MultipleOf(7) %>
						<div class="w-100 d-none d-xl-block"></div>
					<% end_if %>
				<% end_loop %>
			</div>
		</div>
	</section>
<% end_if %>


<section class="bg-light">
	<% if InteriorSeparatorImage %>
		<div class="separatorBlock" style="background-image: url($InteriorSeparatorImage.URL);">
			$InteriorSeparatorImage
		</div>
	<% end_if %>
	<div class="container py-5">
		<div class="row ">
			<% if InteriorTitle %>
				<div class="col-12 pb-5">
					<h2 class="mb-0">$InteriorTitle</h2>
				</div>
			<% end_if %>
			<% if InteriorText1 %>
				<div class="col-12 <% if InteriorText2 %>col-md-6<% end_if %> pb-5">
					$InteriorText1
				</div>
			<% end_if %>
			<% if InteriorText2 %>
				<div class="col-12 col-md-6 pb-5">
					$InteriorText2
				</div>
			<% end_if %>
			<% if InteriorLinkTitle %>
				<div class="w-100"></div>
				<div class="col-12 pb-5 text-center">
					<a href="$InteriorLinkURL" class="btn btn-primary btn-lg" rel="nofollow" target="_blank">$InteriorLinkTitle</a>
				</div>
			<% end_if %>
		</div>
	</div>
</section>

<% if InteriorImage %>
	<section>
		<div class="container py-5">
			<div class="row justify-content-center no-gutters">
				<% loop InteriorImage.sort("SortOrder") %>
					<div class="col-4 col-md-3 col-lg-2 col-xl-1">
						<a class="p-2 p-md-3 d-inline-block" data-fancybox="interior" href="$URL" data-caption="$Title">$FocusFill(350,350)</a>
					</div>
					<% if MultipleOf(7) %>
						<div class="w-100 d-none d-xl-block"></div>
					<% end_if %>
				<% end_loop %>
			</div>
		</div>
	</section>
<% end_if %>

<section>
	<div class="container py-5">
		<div class="row justify-content-between">
			<% if SpecificationImage %>
				<div class="col-12 text-center">
					$SpecificationImage.ScaleMaxWidth(800)
				</div>
			<% end_if %>
			<% if SpecificationLeftValue %>
				<div class="col-12 col-lg-6 py-5">
					<div class="row">
						<% loop SpecificationLeftValue %>
							<div class="col-12 col-lg-4 <% if Even %>bg-light<% end_if %> py-1 my-1 <% if isFirst && ImpressionPage.SpecificationLeftTableHeader=1 %>text-primary font-weight-bold<% end_if %>">
								$Title1
							</div>
							<div class="col-12 col-lg-4 <% if Even %>bg-light<% end_if %> py-1 my-1 <% if isFirst && ImpressionPage.SpecificationLeftTableHeader=1 %>text-primary font-weight-bold<% end_if %>">
								$Title2
							</div>

							<% if Title3 %>
								<div class="col-12 col-lg-4 <% if Even %>bg-light<% end_if %> py-1 my-1 <% if isFirst && ImpressionPage.SpecificationLeftTableHeader=1 %>text-primary font-weight-bold<% end_if %>">
									$Title3
								</div>
							<% end_if %>
							<div class="w-100"></div>
						<% end_loop %>
					</div>
				</div>
			<% end_if %>


			<% if SpecificationRightValue %>
				<div class="col-12 col-lg-5 py-5">
					<div class="row">
						<% if SpecificationLeftTableHeader %>
							<% loop SpecificationLeftValue.limit(1) %>
								<div class="col-12 py-1 my-1 text-primary font-weight-bold invisible">
									$Title1
								</div>
								<div class="w-100"></div>
							<% end_loop %>
						<% end_if %>
						<% loop SpecificationRightValue %>
							<div class="col-6 <% if Odd %>bg-light<% end_if %> py-1 my-1">
								$Title1
							</div>
							<div class="col-6 <% if Odd %>bg-light<% end_if %> py-1 my-1">
								$Title2
							</div>
							<div class="w-100"></div>
						<% end_loop %>
					</div>
				</div>
			<% end_if %>

			<% if SpecificationTextAfterTable %>
				<div class="col-12 font-weight-bold">
					$SpecificationTextAfterTable
				</div>
			<% end_if %>

			<% if SpecificationGallery %>
				<div class="col-12 py-5 text-center">
					<div id="carouselSpecificationGallery" class="carousel slide" data-ride="carousel">
						<div class="carousel-inner">
							<% loop SpecificationGallery %>
								<div class="carousel-item <% if isFirst %>active<% end_if %>">
									<a  data-fancybox="specification" href="$URL" data-caption="$Title">$ScaleMaxWidth(1000)</a>
								</div>
							<% end_loop %>
						</div>
						<ol class="carousel-indicators">
							<% loop SpecificationGallery %>
								<li data-target="#carouselSpecificationGallery" data-slide-to="$Pos(0)" <% if isFirst %>class="active"<% end_if %> title="$Title">
									$Fill(100,100)
								</li>
							<% end_loop %>
						</ol>
					</div>
				</div>
			<% end_if %>
		</div>
	</div>
</section>

<% if Download %>
	<section>
		<div class="container">
			<div class="row">
				<div class="col-12 py-5">
					<strong>Download</strong>
					<% loop Download %>
						<br /><a href="$URL" class="d-inline-block mt-3" target="_blank"><i class="far fa-file-pdf"></i> $Title</a>
					<% end_loop %>
				</div>
			</div>
		</div>
	</section>
<% end_if %>