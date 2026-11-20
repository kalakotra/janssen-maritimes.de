<main>
	<div class="container">
		<div class="row pt-5 justify-content-between">
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
								<li data-target="#carouselVideo" data-slide-to="$Pos(0)" <% if isFirst %>class="active"<% end_if %> style="background-image: url($myThumb.URL);"></li>
							<% end_loop %>
						</ol>
					</div>
				</div>
			</div>
		</div>
	</section>
<% end_if %>

<% if Image %>
	<section>
		<div class="container py-5">
			<div class="row justify-content-center no-gutters">
				<% if Image.count>1 %>
					<% loop Image.sort("SortOrder") %>
						<div class="col-4 col-md-3 col-lg-2 col-xl-1">
							<a class="p-1 p-md-2 d-inline-block" data-fancybox="gallery" href="$URL" data-caption="$Title">$FocusFill(350,350)</a>
						</div>
						<% if MultipleOf(7) %>
							<div class="w-100 d-none d-xl-block"></div>
						<% end_if %>
					<% end_loop %>
				<% else %>
					<% loop Image %>
						<div class="col-12 text-center">
							<a href="$URL" data-fancybox >$ScaleMaxWidth(1450)</a>
						</div>
					<% end_loop %>
				<% end_if %>
			</div>
		</div>
	</section>
<% end_if %>