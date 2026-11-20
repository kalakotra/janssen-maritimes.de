<div class="pb-5 h-100 d-flex flex-column"  data-aos="fade-up">
	<div class="pb-4 flex-shrink-1">
		<div class="px-3 font-weight-bold text-uppercase">
			<% if PreviewTitle %>$PreviewTitle<% else %>$Title<% end_if %>
		</div>
	</div>
	<div class="pb-4 flex-grow-1">
		<div class="bg-white shadow h-100 d-flex flex-column">
			<div class="flex-shrink-1"><% if PreviewImage %>$PreviewImage.FocusFill(650,320)<% else %>$HeaderImage.FocusFill(650,320)<% end_if %></div>
			<div class="previewText  flex-grow-1">
				<div class="row h-100">
					<div class="col-12">
						<div class="p-3"><% if PreviewText %>$PreviewText.limitWordCount(50)<% else %>$Content.limitWordCount(50)<% end_if %></div>
					</div>
					<% if myDate %>
						<div class="col-12 align-self-end text-right">
							<span class="badge badge-primary">$myDate.format("dd.MM.YYYY")<% if myDateEnd %> - $myDateEnd.format("dd.MM.YYYY")<% end_if %></span>
						</div>
					<% end_if %>	
				</div>
			</div>
		</div>
	</div>
	<div class="flex-shrink-1">
		<a href="$Link" class="btn btn-primary text-uppercase stretched-link"><%t Page.MoreInfo "Mehr erfahren" %></a>
	</div>
</div>