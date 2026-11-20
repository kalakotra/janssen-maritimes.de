<main>
	<div class="container">
		<div class="row pt-5 justify-content-between">
			
			<% if ContentImage %>
				<div class="col-12 col-md-6 col-xl-4 pb-3 pb-lg-5"  data-aos="fade-right">
					$ContentImage
				</div>
			<% end_if %>
			<div class="col-12 <% if ContentImage %>col-md-6 col-xl-8<% end_if %>  pb-3 pb-lg-5"  data-aos="fade-left">
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
			<div class="row justify-content-between">
				<% loop AllChildren.reverse %>
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