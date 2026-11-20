<?php

use SilverStripe\ORM\DataObject;

class ImpressionTechLeftValue extends DataObject
{
    private static $plural_name = "LeftValues";

    private static $singular_name = "LeftValue";

	private static $default_sort = "Sort";

    private static $db = [
    	'Title1' => 'Varchar(250)',
        'Title2' => 'Varchar(250)',
        'Title3' => 'Varchar(250)',
        'Sort' => 'Int'
    ];

    private static $has_one = [
        'ImpressionPage' => ImpressionPage::class
    ];

    private static $summary_fields = [
        'Title1',
        'Title2',
        'Title3'
    ];

    public function getCMSFields() {
    	$fields = parent::getCMSFields();

        $fields->removeFieldFromTab("Root.Main", "Sort");

    	return $fields;
    }
}
