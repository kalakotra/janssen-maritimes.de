<?php

namespace {

    use SilverStripe\CMS\Model\SiteTree;
    use SilverStripe\Forms\TextField;
    use SilverStripe\Forms\TextareaField;
    use SilverStripe\Forms\CheckboxField;
    use SilverStripe\Assets\Image;
    use SilverStripe\Model\List\ArrayList;
	use SilverStripe\AssetAdmin\Forms\UploadField;

    class Page extends SiteTree
    {
        private static $db = [
        	'ContentTitle' => 'Varchar'
        ];

        private static $has_one = [
        	'HeaderImage' => Image::class
        ];

        private static $owns = [
        	'HeaderImage'
        ];

        public function getSettingsFields() {
        	$fields = parent::getSettingsFields();

        	return $fields;
        }

        public function getCMSFields() {
        	$fields = parent::getCMSFields();

        	$fields->removeFieldFromTab("Root.Main", "MenuTitle");

        	$fields->addFieldToTab("Root.Main", UploadField::create("HeaderImage")->setFolderName('Uploads/header/'));

        	$fields->addFieldToTab("Root.Main", TextField::create("ContentTitle"), "Content");

        	return $fields;
        }

        public function getMyClass($myClass = "Page") {
            return $myClass::get();
        }

        public function getRandomOfClass($myClass = "Page", $limit = 3) {
            $items = $myClass::get()->toArray();
            shuffle($items);
            return ArrayList::create(array_slice($items, 0, (int) $limit));
        }
    }
}
