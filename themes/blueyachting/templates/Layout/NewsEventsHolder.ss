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
			<% loop AllChildren %>
				<div class="row justify-content-between pb-3">
					<div class="col-12 ">
						<% if ContentTitle %>
							<h1 class="border-bottom border-primary mb-3">$ContentTitle</h1>
						<% end_if %>
					</div>
				
					<% if ClassName='NewsHolder' %>
						<% loop myChildren.sort("NewsDate DESC").limit(4) %>
							<div class="col-12 col-md-6 col-xl-5">
								<% include ChildrenLoopBox myDate=$NewsDate %>
							</div>
							<% if MultipleOf(2) %>
								<div class="w-100">
								</div>
							<% end_if %>
						<% end_loop %>
					<% else_if ClassName='EventsHolder' %>
						<% loop myChildren.sort("EventStart ASC").limit(4) %>
							<div class="col-12 col-md-6 col-xl-5">
								<% include ChildrenLoopBox myDate=$EventStart, myDateEnd=$EventEnd %>
							</div>
							<% if MultipleOf(2) %>
								<div class="w-100">
								</div>
							<% end_if %>
						<% end_loop %>
					<% end_if %>
				</div>
			<% end_loop %>
		</div>
	</section>
<% end_if %>