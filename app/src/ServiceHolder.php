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

    class ServiceHolder extends Page
    {
        private static $icon_class = "font-icon-block-layout-2";

        private static $allowed_children = [
            'ServicePage', 'Page'
        ];

        private static $db = [
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

        public function getSettingsFields() {
        	$fields = parent::getSettingsFields();

            return $fields;
        }

        public function getCMSFields() {
        	$fields = parent::getCMSFields();

            $fields->addFieldToTab("Root.Main", UploadField::create("HeaderImage")->setFolderName('Uploads/header/'));

        	return $fields;
        }
    }
}
