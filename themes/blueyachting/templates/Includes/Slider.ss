<% if ClassName=HomePage %>
	<div id="carouselHome" class="carousel slide carousel-fade lazy-slider" data-ride="carousel">
		<ol class="carousel-indicators">
			<% loop Slide %>
				<li data-target="#carouselHome" data-slide-to="$Pos(0)" class="<% if isFirst %>active<% end_if %>"></li>
			<% end_loop %>
		</ol>
		<div class="carousel-inner">
			<% loop Slide %>
				<div class="carousel-item <% if isFirst %>active<% end_if %> ">
					<% include SlideItem %>
				</div>
			<% end_loop %>
		</div>
	</div>
<% else_if ClassName='BooteHolder' %>
	<% if Slide %>
		<div id="carouselHome" class="carousel slide carousel-fade lazy-slider" data-ride="carousel">
			<ol class="carousel-indicators">
				<% loop Slide %>
					<li data-target="#carouselHome" data-slide-to="$Pos(0)" class="<% if isFirst %>active<% end_if %>"></li>
				<% end_loop %>
			</ol>
			<div class="carousel-inner">
				<% loop Slide %>
					<div class="carousel-item <% if isFirst %>active<% end_if %> ">
						<% include SlideItem %>
					</div>
				<% end_loop %>
			</div>
		</div>
	<% else %>
		<% include HeaderImage %>
	<% end_if %>
<% else_if ClassName='ImpressionPage' %>
	<% if Slide %>
		<div id="carouselHome" class="carousel slide carousel-fade lazy-slider" data-ride="carousel">
			<ol class="carousel-indicators">
				<% loop Slide %>
					<li data-target="#carouselHome" data-slide-to="$Pos(0)" class="<% if isFirst %>active<% end_if %>"></li>
				<% end_loop %>
			</ol>
			<div class="carousel-inner">
				<% loop Slide %>
					<div class="carousel-item <% if isFirst %>active<% end_if %> ">
						<% include SlideItem %>
					</div>
				<% end_loop %>
			</div>
		</div>
	<% else %>
		<% include HeaderImage %>
	<% end_if %>
<% else %>
	<% include HeaderImage %>
<% end_if %>