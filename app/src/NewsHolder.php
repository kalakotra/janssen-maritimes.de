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

    class NewsHolder extends Page
    {
        private static $icon_class = "font-icon-page-multiple";

        private static $allowed_children = [
            'NewsPage', 'NewsHolder'
        ];

        private static $db = [
        ];

        private static $has_one = [
        	'HeaderImage' => Image::class,
            'ContentImage' => Image::class
        ];

        private static $has_many = [
            
        ];

        private static $many_many = [
        ];

        private static $many_many_extraFields = [
        ];

        private static $owns = [
        	'HeaderImage',
            'ContentImage'
        ];

        public function getCMSFields() {
        	$fields = parent::getCMSFields();

            $fields->addFieldToTab("Root.Main", UploadField::create("HeaderImage")->setFolderName('Uploads/header/'));
            $fields->addFieldToTab("Root.Main", UploadField::create("ContentImage")->setFolderName('Uploads/news/'));

        	return $fields;
        }

        public function myChildren() {
            return NewsPage::get()->filter(["ParentID"=>$this->ID]);
        }
    }
}
