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

<% if BlogContent %>
	
		<% loop BlogContent %>
			<% if Image %>
				<div class="blogImage" style="background-image: url($Image.URL);">
					$Image.ScaleWidth(1920)
				</div>
			<% end_if %>
			<% if Text %>
				<section>
					<div class="container">
						<div class="row justify-content-center">
							<div class="col-12 py-5">
								$Text
							</div>
						</div>
					</div>
				</section>
			<% end_if %>

			<% if Video %>
				<section class="bg-light">
					<div class="container py-5">
						<div class="row justify-content-center">
							<div class="col-12 col-lg-8">
								<iframe frameborder="0" width="1024" height="450" src="https://www.youtube.com/embed/$Video" allowfullscreen></iframe>
							</div>
						</div>
					</div>
				</section>
			<% end_if %>

		<% end_loop %>
	
<% end_if %>