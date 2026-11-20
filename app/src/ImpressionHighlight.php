<?php

use SilverStripe\ORM\DataObject;
use SilverStripe\Forms\FieldList;
use SilverStripe\Forms\TextField;
use SilverStripe\Forms\GridField\GridField;
use SilverStripe\Forms\GridField\GridFieldConfig_RecordEditor;
use SilverStripe\Forms\GridField\GridFieldConfig;
use Symbiote\GridFieldExtensions\GridFieldOrderableRows;
use SilverStripe\Forms\GridField\GridFieldDeleteAction;
use SilverStripe\Forms\GridField\GridFieldToolbarHeader;
use SilverStripe\Forms\GridField\GridFieldButtonRow;
use Symbiote\GridFieldExtensions\GridFieldAddNewInlineButton;
use Symbiote\GridFieldExtensions\GridFieldEditableColumns;
use Symbiote\GridFieldExtensions\GridFieldTitleHeader;

class ImpressionHighlight extends DataObject
{
    private static $plural_name = "Highlights";

    private static $singular_name = "Highlight";

	private static $default_sort = "Sort";

    private static $db = [
    	'Title' => 'Varchar(250)',
        'Sort' => 'Int'
    ];

    private static $has_one = [
        'ImpressionPage' => ImpressionPage::class
    ];

    private static $has_many = [
    	'HighlightValue' => ImpressionHighlightValue::class
    ];

    public function getCMSFields() {
    	$fields = parent::getCMSFields();

        $fields->removeFieldFromTab("Root.Main", "Sort");

        $gridConfig = GridFieldConfig::create()
        ->addComponent(new GridFieldButtonRow('before'))
        ->addComponent(new GridFieldToolbarHeader())
        ->addComponent(new GridFieldTitleHeader())
        ->addComponent(new GridFieldEditableColumns())
        ->addComponent(new GridFieldDeleteAction())
        ->addComponent(new GridFieldAddNewInlineButton())
        ->addComponent(GridFieldOrderableRows::create());

        $gridField = GridField::create("HighlightValue", "HighlightValue", $this->HighlightValue(), $gridConfig);
        $fields->addFieldToTab("Root.Main", $gridField);

    	return $fields;
    }
}
