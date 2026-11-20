<main>
	<div class="container">
		<div class="row pt-5 justify-content-between">
			<% if ContentTitle %>
				<div class="col-12">
					<h1>$ContentTitle</h1>
				</div>
			<% end_if %>
			<div class="col-12 <% if ContentRight || Form %>col-md-6<% end_if %>  py-3 py-lg-5">
				$Content

				<% if URLSegment=datenschutz %>
					<script src="https://app.jurafox.de/bot/getDatenschutzText/8d27e1ba2c853c8d2357ea89aa7facee/6d50958bfbc68445801477bc1e4ff6d8?js"></script>
				<% end_if %>

				<% if URLSegment=impressum %>
					<script src="https://app.jurafox.de/bot/getImpressumText/8d27e1ba2c853c8d2357ea89aa7facee/6d50958bfbc68445801477bc1e4ff6d8?js"></script>
				<% end_if %>
			</div>
			<% if ContentRight %>
				<div class="col-12 col-md-6 py-3 py-lg-5">
					$ContentRight
				</div>
			<% end_if %>
			<% if Form %>
				<div class="col-12 col-md-5 col-lg-5 py-3 py-lg-5">
					$Form
				</div>
			<% end_if %>
		</div>
	</div>
</main>