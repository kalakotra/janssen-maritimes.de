<form $AttributesHTML>
	<% if $Message %>
	<p id="{$FormName}_error" class="message $MessageType">$Message</p>
	<% else %>
	<p id="{$FormName}_error" class="message $MessageType" style="display: none"></p>
	<% end_if %>
	<fieldset>
		<% if $Legend %><legend>$Legend</legend><% end_if %>
	
		<div class="row align-items-end-">
			<div class="col-12 col-lg-4">
				$Fields.dataFieldByName(Email).FieldHolder
			</div>
			<div class="col-12 col-lg-4">
				$Fields.dataFieldByName(Trademark).FieldHolder
				
			</div>
			<div class="col-12 col-lg-4">
				<% if $Actions %>
					<% loop $Actions %>
						$Field
					<% end_loop %>
				<% end_if %>
				$Fields.dataFieldByName(datenschutz).FieldHolder
			</div>
			
		</div>
	</fieldset>
	$Fields.dataFieldByName(SecurityID)
</form>