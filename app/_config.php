<?php

use SilverStripe\i18n\i18n;
use SilverStripe\TinyMCE\TinyMCEConfig;

i18n::set_locale('de_DE');

TinyMCEConfig::get('cms')
    ->addButtonsToLine(1, 'styles')
    ->setOption('importcss_append', true);
