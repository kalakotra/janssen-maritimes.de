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
use Bummzack\SortableFile\Forms\SortableUploadField;

class Product extends DataObject
{

	private static $default_sort = "Sort";

    private static $db = [
    	'Title' => 'Varchar(250)',
        'Text' => 'HTMLText',
        'Sort' => 'Int'
    ];

    private static $has_one = [
        'ShopPage' => ShopPage::class
    ];

    private static $many_many = [
    	'Image' => Image::class
    ];

    private static $many_many_extraFields = [
    	'Image' => [ 'SortOrder' => 'Int' ]
    ];

    private static $owns = [
    	'Image'
    ];

    public function getCMSFields() {
    	$fields = parent::getCMSFields();

        $fields->removeFieldFromTab("Root.Main", "Sort");

        $fields->addFieldToTab("Root.Main", SortableUploadField::create("Image")->setFolderName('Uploads/products/') );

    	return $fields;
    }
}
