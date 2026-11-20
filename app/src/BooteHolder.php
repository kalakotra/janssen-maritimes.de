<?php

namespace {

    use SilverStripe\Forms\TextField;
    use SilverStripe\Forms\TextareaField;
    use SilverStripe\Forms\CheckboxField;
    use SilverStripe\Forms\HTMLEditor\HTMLEditorField;
    use SilverStripe\Assets\Image;
	use SilverStripe\AssetAdmin\Forms\UploadField;
    use Bummzack\SortableFile\Forms\SortableUploadField;
    use SilverStripe\Forms\GridField\GridField;
    use SilverStripe\Forms\GridField\GridFieldConfig_RecordEditor;
    use Symbiote\GridFieldExtensions\GridFieldOrderableRows;

    class BooteHolder extends Page
    {
        private static $icon_class = "font-icon-block-story-carousel";

        private static $allowed_children = [
            'BoteHolder', 'Page'
        ];

        private static $db = [
        	'PreviewTitle' => 'Varchar',
        	'PreviewText' => 'Text',
            'ShowOnHomeLogo' => 'Boolean',

            'AdditionalContent1' => 'HTMLText',
            'AdditionalContent2' => 'HTMLText'
        ];

        private static $has_one = [
        	'HeaderImage' => Image::class,
            'HolderLogo' => Image::class,
            'PreviewImage' => Image::class
        ];

        private static $has_many = [
            'Slide' => BooteSlide::class
        ];

        private static $many_many = [
            'AwardImage' => Image::class
        ];

        private static $many_many_extraFields = [
            'AwardImage' => [ 'SordOrder' => 'Int' ]
        ];

        private static $owns = [
        	'HeaderImage',
        	'PreviewImage',
            'HolderLogo',
            'AwardImage'
        ];

        public function getSettingsFields() {
        	$fields = parent::getSettingsFields();

            $fields->addFieldToTab("Root.Settings", CheckboxField::create("ShowOnHomeLogo", "Show On Home"), "ShowInMenus");

        	return $fields;
        }

        public function getCMSFields() {
        	$fields = parent::getCMSFields();

            $gridConfig = GridFieldConfig_RecordEditor::create();
            $gridConfig->addComponent(GridFieldOrderableRows::create());

            $gridField = GridField::create("Slide", "Slide", $this->Slide(), $gridConfig);
            
            $fields->addFieldsToTab("Root.Slider", [
                $gridField
            ]);

        	//if ($this->parent()->ClassName == "BoteHolder") {
        		$fields->addFieldsToTab("Root.Preview", [
        			TextField::create("PreviewTitle", "Title"),
        			TextareaField::create("PreviewText", "Text"),
        			UploadField::create("PreviewImage", "Image")
        		]);
        	//}

            $fields->addFieldToTab("Root.Main", UploadField::create("HolderLogo", "Logo")->setFolderName('Uploads/logo/'), "Content");

            $fields->addFieldToTab("Root.Awards", SortableUploadField::create("AwardImage")->setFolderName('Uploads/awards/'));

        	//$fields->addFieldToTab("Root.Main", UploadField::create("HeaderImage")->setFolderName('Uploads/header/'));

            $fields->addFieldsToTab("Root.AdditionalContent", [
                HTMLEditorField::create("AdditionalContent1", "Left")->addExtraClass("stacked"),
                HTMLEditorField::create("AdditionalContent2", "Right")->addExtraClass("stacked")
            ]);

        	return $fields;
        }
    }
}
