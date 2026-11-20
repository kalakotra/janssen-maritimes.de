<main>
	<div class="container">
		<div class="row pt-5 justify-content-between">
			
			<% if ContentImage %>
				<div class="col-12 col-md-6 col-xl-4 pb-3 pb-lg-5">
					$ContentImage
				</div>
			<% end_if %>
			<div class="col-12 <% if ContentImage %>col-md-6 col-xl-8<% end_if %>  pb-3 pb-lg-5">
				<% if ContentTitle %>
						<h1>$ContentTitle</h1>
				<% end_if %>
				$Content			
			</div>
			
		</div>
	</div>
</main>

<% if AllChildren %>
	<section class="bg-light">
		<div class="container py-5">
			<div class="row justify-content-between pb-3">
				<% loop myChildren.sort("EventStart ASC") %>
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
<% end_if %>