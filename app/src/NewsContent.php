<?php

use SilverStripe\ORM\DataObject;
use SilverStripe\Forms\FieldList;
use SilverStripe\Forms\TextField;
use SilverStripe\Forms\DateField;
use SilverStripe\Assets\File;
use SilverStripe\Assets\Image;
use SilverStripe\AssetAdmin\Forms\UploadField;

class NewsContent extends DataObject
{

	private static $default_sort = "Sort";

    private static $db = [
    	'Title' => 'Varchar(250)',
        'Text' => 'HTMLText',
        'Video' => 'Varchar',
        'Sort' => 'Int'
    ];

    private static $has_one = [
        'NewsPage' => NewsPage::class
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

    private static $summary_fields = [
        'Text.FirstParagraph' => 'Text'
    ];

    public function getCMSFields() {
    	$fields = parent::getCMSFields();

        $fields->removeFieldFromTab("Root.Main", "Sort");
        $fields->removeFieldFromTab("Root.Main", "Title");

        $fields->addFieldToTab("Root.Main", UploadField::create("Image")->setFolderName('Uploads/news/') );

    	return $fields;
    }

    public function myVideoThumb() 
    {
        if ($this->Video != "") { 
            $contents = file_get_contents('http://img.youtube.com/vi/'.$this->Video.'/default.jpg');

            $img = Image::create();
            $img->setFromString($contents, 'image_'.$this->Video.'.jpg');

            return $img;
        } else {
            return false;
        }
    }
}
