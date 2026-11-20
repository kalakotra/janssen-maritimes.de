<?php

use SilverStripe\Forms\FieldList;
use SilverStripe\Forms\HTMLEditor\HTMLEditorField;
use SilverStripe\Forms\TextField;
use SilverStripe\Forms\TextareaField;
use SilverStripe\Forms\DropdownField;
use SilverStripe\Core\Extension;
use SilverStripe\Forms\GridField\GridField;
use SilverStripe\Forms\GridField\GridFieldConfig_RecordEditor;
use Symbiote\GridFieldExtensions\GridFieldOrderableRows;
use SilverStripe\Assets\Image;
use SilverStripe\AssetAdmin\Forms\UploadField;
use SilverStripe\Control\Director;
use Bummzack\SortableFile\Forms\SortableUploadField;

class CustomSiteConfig extends Extension
{

    private static $db = [
        'FooterText' => 'HTMLText',
        'FooterText2' => 'HTMLText',
        'Facebook' => 'Varchar',
        'Twitter' => 'Varchar',
        'Instagram' => 'Varchar',
        'Email' => 'Varchar',
        'Telephone' => 'Varchar',
        'TelephoneLink' => 'Varchar'
    ];

    private static $has_one = [
        'HeaderImage' => Image::class
    ];

    private static $has_many = [
    ];

    private static $many_many = [
    ];

    private static $many_many_extraFields = [
    ];

    private static $owns = [
        'HeaderImage'
    ];

    public function updateCMSFields(FieldList $fields) 
    {
        //Certificate

        /*$gridConfig = GridFieldConfig_RecordEditor::create();
        $gridConfig->addComponent(GridFieldOrderableRows::create());

        $gridField = GridField::create("Certificate", "Certificate", Certificate::get(), $gridConfig);
        
        $fields->addFieldsToTab("Root.Certificates", [
            $gridField
        ]);*/

        $fields->addFieldsToTab("Root.Main", [
            TextField::create("Email"),
            TextField::create("Telephone"),
            TextField::create("TelephoneLink")->setDescription("Use format +49123456789 for links like tel:+49123456789")
        ]);

        $fields->addFieldsToTab("Root.Social", [
            TextField::create("Facebook"),
            TextField::create("Twitter"),
            TextField::create("Instagram")
        ]);

        $fields->addFieldToTab("Root.HeaderImage", UploadField::create("HeaderImage")->setFolderName('Uploads/header/'));
        
        $fields->addFieldsToTab("Root.Footer", [
            HTMLEditorField::create("FooterText")->addExtraClass("stacked"),
            HTMLEditorField::create("FooterText2")->addExtraClass("stacked")
        ]);
    }
}
