<% if isFirst %>
	<% with $Image %>
		<picture class="lazy-picture">
			<source media="(max-width: 425px)" srcset="$FocusFill(450,650).URL">
			<source media="(max-width: 576px)" srcset="$FocusFill(580,650).URL">
			<source media="(max-width: 768px)" srcset="$FocusFill(770,500).URL">
			<source media="(max-width: 992px)" srcset="$FocusFill(1000,600).URL">
			<source media="(max-width: 1200px)" srcset="$FocusFill(1300,600).URL">
			<source media="(min-width: 1201px)" srcset="$FocusFill(1920,1000).URL">

			<img src="$FocusFill(450,450).URL" alt="$Title"  class="d-block w-100" />

		</picture>
	<% end_with %>
<% else %>
	<% with $Image %>
		<picture>
			<source media="(max-width: 425px)" srcset="$FocusFill(450,650).URL">
			<source media="(max-width: 576px)" srcset="$FocusFill(580,650).URL">
			<source media="(max-width: 768px)" srcset="$FocusFill(770,500).URL">
			<source media="(max-width: 992px)" srcset="$FocusFill(1000,600).URL">
			<source media="(max-width: 1200px)" srcset="$FocusFill(1300,600).URL">
			<source media="(min-width: 1201px)" srcset="$FocusFill(1920,1000).URL">

			<img src="$FocusFill(450,450).URL" alt="$Title" class="d-block w-100" />

		</picture>
	<% end_with %>
<% end_if %>
<div class="sliderPositioner">
	<div class="container">
		<div class="row">
			<div class="col-12 col-md-6 col-lg-4">
				<div class="p-4 <% if BlueBackground %>sliderTextBg-Blue<% else %>sliderTextBg<% end_if %>">
					<span class="font-size-2 font-weight-bold <% if BlueBackground %>text-white<% else %>text-secondary<% end_if %>">$Title1</span> <span class="font-size-2 font-weight-bold <% if BlueBackground %>text-secondary<% else %>text-black<% end_if %>">$Title2</span>
					<% if Text %>
						<p class="text-black pb-3 m-0">
							$Text
						</p>
					<% end_if %>
					<div class="text-right">
						<% if LinkPage %>
							<a href="$LinkPage.Link" class="btn btn-secondary"><% if LinkTitle %>$LinkTitle<% else %>$LinkPage.MenuTitle<% end_if %></a>
						<% end_if %>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>