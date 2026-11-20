<?php

use SilverStripe\ORM\DataObject;
use SilverStripe\CMS\Model\SiteTree;
use SilverStripe\Forms\FieldList;
use SilverStripe\Forms\TextField;
use SilverStripe\Forms\DateField;
use SilverStripe\Assets\File;
use SilverStripe\Assets\Image;
use SilverStripe\AssetAdmin\Forms\UploadField;
use SilverStripe\Forms\TreeDropdownField;

class ImpressionSlide extends DataObject
{
    private static $plural_name = "Slides";

    private static $singular_name = "Slide";

	private static $default_sort = "Sort";

    private static $db = [
    	'Title1' => 'Varchar(250)',
        'Title2' => 'Varchar(250)',
        'Text' => 'Text',
        'LinkTitle' => 'Varchar(250)',
        'BlueBackground' => 'Boolean',
        'Sort' => 'Int'
    ];

    private static $has_one = [
        'ImpressionPage' => ImpressionPage::class,
    	'Image' => Image::class,
        'LinkPage' => Page::class
    ];

    private static $many_many = [
    	
    ];

    private static $many_many_extraFields = [
    	
    ];

    private static $owns = [
    	'Image'
    ];
    private static $summary_fields = [
        'Title1',
        'Title2'
    ];

    public function getCMSFields() {
    	$fields = parent::getCMSFields();

        $fields->removeFieldFromTab("Root.Main", "Sort");

        $fields->addFieldToTab("Root.Main", UploadField::create("Image")->setFolderName('Uploads/slider/') );

        $treeField = TreeDropdownField::create('LinkPageID', 'Link Page', Page::class);
        //$treeField->setTitleField('LinkPage');
        $fields->addFieldToTab('Root.Main', $treeField, 'BlueBackground');

    	return $fields;
    }
}
