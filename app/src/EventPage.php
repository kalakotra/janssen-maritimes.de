<?php

namespace {

    use SilverStripe\Forms\TextField;
    use SilverStripe\Forms\DateField;
    use SilverStripe\Forms\TextareaField;
    use SilverStripe\Forms\CheckboxField;
    use SilverStripe\Forms\HTMLEditor\HTMLEditorField;
    use SilverStripe\Assets\Image;
	use SilverStripe\AssetAdmin\Forms\UploadField;
    use Bummzack\SortableFile\Forms\SortableUploadField;
    use SilverStripe\Forms\GridField\GridField;
    use SilverStripe\Forms\GridField\GridFieldConfig_RecordEditor;
    use Symbiote\GridFieldExtensions\GridFieldOrderableRows;

    class EventPage extends Page
    {
        private static $icon_class = "font-icon-news";

        private static $default_sort = "EventStart DESC, Created DESC";

        private static $db = [
            'PreviewTitle' => 'Varchar',
            'PreviewText' => 'Text',
            'EventStart' => 'Date',
            'EventEnd' => 'Date'
        ];

        private static $has_one = [
        	'HeaderImage' => Image::class,
            'ContentImage' => Image::class,
            'PreviewImage' => Image::class
        ];

        private static $has_many = [
            'EventContent' => EventContent::class
        ];

        private static $many_many = [
            'Gallery' => Image::class
        ];

        private static $many_many_extraFields = [
            'Gallery' => ['SortOrder' => 'Int']
        ];

        private static $owns = [
        	'HeaderImage',
            'PreviewImage',
            'Gallery',
            'ContentImage'
        ];

        public function getCMSFields() {
        	$fields = parent::getCMSFields();

            $fields->addFieldsToTab("Root.Main", [
                DateField::create("EventStart"),
                DateField::create("EventEnd")
            ], "Content");

            $fields->addFieldToTab("Root.Main", UploadField::create("HeaderImage")->setFolderName('Uploads/header/'));

            $fields->addFieldToTab("Root.Main", UploadField::create("ContentImage")->setFolderName('Uploads/events/'));

            $fields->addFieldToTab("Root.Gallery", SortableUploadField::create("Gallery")->setFolderName('Uploads/events/'));

            /*$gridConfig = GridFieldConfig_RecordEditor::create();
            $gridConfig->addComponent(GridFieldOrderableRows::create());

            $gridField = GridField::create("EventContent", "EventContent", $this->EventContent(), $gridConfig);
            
            $fields->addFieldsToTab("Root.EventContent", [
                $gridField
            ]);*/

            $fields->addFieldsToTab("Root.Preview", [
                TextField::create("PreviewTitle", "Title"),
                TextareaField::create("PreviewText", "Text"),
                UploadField::create("PreviewImage", "Image")->setFolderName('Uploads/events/')
            ]);

        	return $fields;
        }

        public function onBeforeWrite() {
            parent::onBeforeWrite();

            $this->ShowInMenus = 0;
        }
    }
}
