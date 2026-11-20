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

<% if Product %>
	<section class="bg-light">
		<div class="container py-5">
			<div class="row justify-content-between">
				<% loop Product %>
					<div class="col-12 col-md-6 col-xl-5">
						<div class="pb-5 h-100 d-flex flex-column"  data-aos="fade-up">
							<div class="pb-4 flex-shrink-1">
								<div class="px-3 font-weight-bold text-uppercase">
									$Title
								</div>
							</div>
							<div class="pb-4 flex-grow-1">
								<div class="bg-white shadow h-100 d-flex flex-column">
									<div class="flex-shrink-1 updateid" data-id="product-$ID">
										<% loop $Image.sort("SortOrder") %>
											<a data-fancybox="specification" href="$URL" data-caption="$Title"><% if isFirst %>$FocusFill(650,320)<% end_if %></a>
										<% end_loop %>
									</div>
									<div class="previewText  flex-grow-1">
										<div class="row h-100">
											<div class="col-12">
												<div class="p-3">$Text.limitWordCount(50)</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="flex-shrink-1">
								<div class="row">
									<div class="col-5">
										<button type="button" class="btn btn-primary text-uppercase" data-toggle="modal" data-target="#productModal-{$ID}" ><%t Page.MoreInfo "Mehr erfahren" %></button>
									</div>
									<div class="col-7 text-right">
										<div data-href="#Form_ShopForm_Products_{$ID}" class="btn btn-outline-secondary text-uppercase switchLinkText"><span><%t Page.AddToOffer "zum Angebot hinzufügen" %></span><span><%t Page.RemoveFromOffer "aus dem Angebot löschen" %></span></div>
									</div>
								</div>
								
							</div>
						</div>
					</div>
					<!-- Modal -->
					<div class="modal fade" id="productModal-{$ID}" tabindex="-1" aria-labelledby="#productModal-{$ID}-Label" aria-hidden="true">
						<div class="modal-dialog modal-dialog-centered modal-xl">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="productModal-{$ID}-Label">$Title</h5>
									<button type="button" class="close" data-dismiss="modal" aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
								</div>
								<div class="modal-body">
									$Text
									<div class="row justify-content-center updateid" data-id="productPopup-$ID">
										<% loop $Image.sort("SortOrder") %>
											<div class="col-auto py-3"><a data-fancybox="specification" href="$URL" data-caption="$Title">$FocusFill(150,150)</a></div>
										<% end_loop %>
									</div>
								</div>
							</div>
						</div>
					</div>
				<% end_loop %>
			</div>
			<div class="row justify-content-center">
				<div class="col-12 col-md-8 col-lg-6">
					<div id="shopFormHolder" class="p-3 bg-white shadow">$ShopForm</div>
				</div>
			</div>
		</div>
	</section>
<% end_if %>