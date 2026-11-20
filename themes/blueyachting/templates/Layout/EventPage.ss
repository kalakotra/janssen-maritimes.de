<main>
	<div class="container">
		<div class="row pt-5 justify-content-between">
			<% if ContentImage %>
				<div class="col-12 pb-5">
					$ContentImage.FocusFill(1410,500)
				</div>
			<% end_if %>
			<div class="col-12">
				<div class="row ">
					<% if ContentTitle %>
						<div class="col-12 col-md-8">
							<h1 class="mb-0">$ContentTitle</h1>
						</div>
					<% end_if %>
					<% if EventStart %>
						<div class="col-12 col-md-4 text-right text-secondary align-self-center">
							<span class="badge badge-primary">$EventStart.format("dd.MM.YYYY")<% if EventEnd %> - $EventEnd.format("dd.MM.YYYY")<% end_if %></span>
						</div>
					<% end_if %>
				</div>
			</div>
			<div class="col-12 <% if ContentRight %>col-md-6<% end_if %>  py-3 py-lg-5">
				$Content			
			</div>
			<% if ContentRight %>
				<div class="col-12 col-md-6 py-3 py-lg-5">
					$ContentRight
				</div>
			<% end_if %>
			<% if Gallery %>
				<div class="col-12 pb-5">
					<div class="row justify-content-between">
						<% loop Gallery.sort("SortOrder") %>
							<div class="col-4 col-md-3 col-lg-2 pb-4">
								<a href="$URL" data-fancybox="gallery" data-caption="$Title" class="shadow d-block">$FocusFill(350,350)</a>
							</div>
						<% end_loop %>
					</div>
				</div>
			<% end_if %>
		</div>
	</div>
</main>

<% with Parent %>
<section class="bg-light">
		<div class="container py-5">
			<div class="row justify-content-between pb-3">
				<% loop myChildren.sort("EventStart DESC") %>
					<div class="col-12 col-md-6 col-xl-5">
						<% include ChildrenLoopBox myDate=$EventStart, myDateEnd=$EventEnd %>
					</div>
					<% if MultipleOf(2) %>
						<div class="w-100">
						</div>
					<% end_if %>
				<% end_loop %>
			</div>
		</div>
	</section>
<% end_with %>