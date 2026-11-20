<% if getMyClass("NewsPage").Count>0 || getMyClass("EventPage").Count>0 %>
<section>
	<div class="container py-3 py-lg-5">
		<div class="row py-3 py-lg-5 justify-content-center">
			<div class="col-12 col-lg-10 pb-3 pb-lg-5">
				<% loop getMyClass("HomePage").limit(1) %>$OurNewsAndEvents<% end_loop %>
			</div>
			<div class="col-12">
				<div id="carouselNews" class="carousel slide" data-ride="carousel">
					<div class="carousel-inner">
						<% loop getMyClass("NewsPage").sort("NewsDate DESC").limit(2) %>
							<div class="carousel-item <% if isFirst %>active<% end_if %>">
								<div class="row justify-content-center w-100 no-gutters align-items-center newsSliderContent">
									<div class="col-11 col-md-10 col-lg-8 text-center">
										<% if PreviewImage %>
											<% with $PreviewImage %>
												<picture>
													<source media="(max-width: 425px)" srcset="$FocusFill(450,300).URL">
													<source media="(max-width: 576px)" srcset="$FocusFill(650,350).URL">
													<source media="(max-width: 768px)" srcset="$FocusFill(650,300).URL">
													<source media="(max-width: 992px)" srcset="$FocusFill(850,300).URL">
													<source media="(max-width: 1200px)" srcset="$FocusFill(850,300).URL">
													<source media="(min-width: 1201px)" srcset="$FocusFill(850,300).URL">

													<img src="$FocusFill(450,300).URL" alt="$Title" title="$Title" class="d-block w-100" />

												</picture>
											<% end_with %>
										<% end_if %>
										<div class="pt-3 text-primary font-weight-bold"><% if PreviewTitle %>$PreviewTitle<% else %>$Title<% end_if %></div>
										<div class="py-3"><% if PreviewText %>$PreviewText.limitWordCount<% else %>$Content.limitWordCount(50)<% end_if %></div>
										<a href="$Link" class="btn btn-info btn-lg"><%t Page.MoreInfo "Mehr erfahren" %></a>
									</div>
								</div>
							</div>
						<% end_loop %>
						<% loop getMyClass("EventPage").sort("EventStart DESC").limit(2) %>
							<div class="carousel-item">
								<div class="row justify-content-center w-100 no-gutters align-items-center newsSliderContent">
									<div class="col-11 col-md-10 col-lg-8 text-center">
										<% if PreviewImage %>
											<% with $PreviewImage %>
												<picture>
													<source media="(max-width: 425px)" srcset="$FocusFill(450,300).URL">
													<source media="(max-width: 576px)" srcset="$FocusFill(650,350).URL">
													<source media="(max-width: 768px)" srcset="$FocusFill(650,300).URL">
													<source media="(max-width: 992px)" srcset="$FocusFill(850,300).URL">
													<source media="(max-width: 1200px)" srcset="$FocusFill(850,300).URL">
													<source media="(min-width: 1201px)" srcset="$FocusFill(850,300).URL">

													<img src="$FocusFill(450,300).URL" alt="$Title" title="$Title" class="d-block w-100" />

												</picture>
											<% end_with %>
										<% end_if %>
										<div class="pt-3 text-primary font-weight-bold"><% if PreviewTitle %>$PreviewTitle<% else %>$Title<% end_if %></div>
										<div class="py-3"><% if PreviewText %>$PreviewText.limitWordCount<% else %>$Content.limitWordCount(50)<% end_if %></div>
										<a href="$Link" class="btn btn-info btn-lg"><%t Page.MoreInfo "Mehr erfahren" %></a>
									</div>
								</div>
							</div>
						<% end_loop %>
					</div>
					<a class="carousel-control-prev" href="#carouselNews" role="button" data-slide="prev">
						<span class="carousel-control-prev-icon" aria-hidden="true"></span>
						<span class="sr-only">Previous</span>
					</a>
					<a class="carousel-control-next" href="#carouselNews" role="button" data-slide="next">
						<span class="carousel-control-next-icon" aria-hidden="true"></span>
						<span class="sr-only">Next</span>
					</a>
				</div>
			</div>
		</div>
	</div>
</section>
<% end_if %>