<section>
	<div class="container pb-3 pb-lg-5">
		<div class="row py-5 justify-content-center">
			<div class="col-12 col-lg-10 pb-5">
				$OurBlog
			</div>
			<% loop getMyClass("BlogPage").sort("Sort DESC").limit(4) %>
				<div class="col-12 col-md-3 mb-3" data-aos="fade-up" data-aos-offset="{$Pos(1)}00">
					<div class="serviceBoxHolder- h-100 row no-gutters pb-4 shadow justify-content-center">
						<div class="col-12 pb-3">
							$PreviewImage.FocusFill(350,220)
						</div>
						<div class="col-10 pb-3">
							<h3 class="text-center text-uppercase mb-0"><% if PreviewTitle %>$PreviewTitle<% else %>$Title<% end_if %></h3>
						</div>
						<div class="col-10 text-center pb-3">
							<% if PreviewText %>$PreviewText.limitWordCount(20)<% else %>$Content.limitWordCount(20)<% end_if %>
						</div>
						<div class="col-10 text-center align-self-end-">
							<a href="$Link" class="text-primary"><%t Page.GoToBlog "Hier geht's zum Artikel" %></a>
						</div>
					</div>
				</div>
			<% end_loop %>
		</div>
	</div>
</section>