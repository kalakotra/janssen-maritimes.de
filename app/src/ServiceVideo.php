<?php

use SilverStripe\ORM\DataObject;
use SilverStripe\Forms\FieldList;
use SilverStripe\Forms\TextField;
use SilverStripe\Forms\DateField;
use SilverStripe\Assets\File;
use SilverStripe\Assets\Image;
use SilverStripe\Assets\Folder;
use SilverStripe\AssetAdmin\Forms\UploadField;
use SilverStripe\Assets\Upload;

class ServiceVideo extends DataObject
{

	private static $default_sort = "Sort";

    private static $db = [
    	'Title' => 'Varchar(250)',
        'YoutubeCode' => 'Varchar(20)',
        'Sort' => 'Int'
    ];

    private static $has_one = [
        'ServicePage' => ServicePage::class
    ];

    private static $many_many = [
    	
    ];

    private static $many_many_extraFields = [
    	
    ];

    private static $summary_fields = [
        'Title',
        'YoutubeCode'
    ];

    public function getCMSFields() {
    	$fields = parent::getCMSFields();

        $fields->removeFieldFromTab("Root.Main", "Sort");

    	return $fields;
    }

    /**
     * @param $data
     * @return null|Image return written Image object or `null` if failed
     */
    public function myThumb() 
    {
        //$folder = Folder::find_or_make('thumbnails');
        $contents = file_get_contents('http://img.youtube.com/vi/'.$this->YoutubeCode.'/default.jpg');

        $img = Image::create();
        $img->setFromString($contents, 'image_'.$this->YoutubeCode.'.jpg');
        //$img->ParentID = $folder->ID;
        //$img->write();

        //$img->publishSingle();

        return $img;
    }
}
