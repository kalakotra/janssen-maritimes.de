<% if $Locales %>
    <nav class="language">
        <ul>
            <% loop $Locales %>
                <li class="$LinkingMode">
                    <a href="$Link.ATT" <% if $LinkingMode != 'invalid' %>rel="alternate"
                       hreflang="$HrefLang"<% end_if %>><img src="$resourceURL('themes/blueyachting/images/flags/4x3/')/{$URLSegment}.svg" alt="$Title.XML Flag" class="languageFlag" /></a>
                </li>
            <% end_loop %>
        </ul>
    </nav>
<% end_if %>
