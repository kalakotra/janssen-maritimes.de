<?php

use SilverStripe\ORM\DataObject;

class ImpressionHighlightValue extends DataObject
{
    private static $plural_name = "HighlightValues";

    private static $singular_name = "HighlightValue";

	private static $default_sort = "Sort";

    private static $db = [
    	'Title' => 'Text',
        'Sort' => 'Int'
    ];

    private static $has_one = [
        'ImpressionHighlight' => ImpressionHighlight::class
    ];

    private static $summary_fields = [
        'Title'
    ];

    public function getCMSFields() {
    	$fields = parent::getCMSFields();

        $fields->removeFieldFromTab("Root.Main", "Sort");

    	return $fields;
    }
}
