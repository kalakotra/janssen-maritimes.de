<section>
	<% if HeaderImage %>
		<picture>
			<!--<source media="(max-width: 425px)" srcset="$HeaderImage.FocusFill(450,450).URL">
			<source media="(max-width: 576px)" srcset="$HeaderImage.FocusFill(580,450).URL">
			<source media="(max-width: 768px)" srcset="$HeaderImage.FocusFill(770,500).URL">
			<source media="(max-width: 992px)" srcset="$HeaderImage.FocusFill(1000,600).URL">-->
			<source media="(max-width: 1200px)" srcset="$HeaderImage.FocusFill(1300,400).URL">
			<source media="(min-width: 1201px)" srcset="$HeaderImage.FocusFill(1920,450).URL">

			<img src="$HeaderImage.FocusFill(450,450).URL" alt="$HeaderImage.Title" class="d-block w-100" />

		</picture>
	<% else %>
		<% with $SiteConfig.HeaderImage %>
			<picture>
				<!--<source media="(max-width: 425px)" srcset="$FocusFill(450,450).URL">
				<source media="(max-width: 576px)" srcset="$FocusFill(580,450).URL">
				<source media="(max-width: 768px)" srcset="$FocusFill(770,500).URL">
				<source media="(max-width: 992px)" srcset="$FocusFill(1000,600).URL">-->
				<source media="(max-width: 1200px)" srcset="$FocusFill(1300,400).URL">
				<source media="(min-width: 1201px)" srcset="$FocusFill(1920,450).URL">

				<img src="$FocusFill(450,450).URL" alt="$Title" class="d-block w-100" />

			</picture>
		<% end_with %>
	<% end_if %>
</section>