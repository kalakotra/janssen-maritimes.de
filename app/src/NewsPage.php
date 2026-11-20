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

    class NewsPage extends Page
    {
        private static $icon_class = "font-icon-news";

        private static $default_sort = "NewsDate DESC, Created DESC";

        private static $db = [
            'PreviewTitle' => 'Varchar',
            'PreviewText' => 'Text',
            'NewsDate' => 'Date'
        ];

        private static $has_one = [
        	'HeaderImage' => Image::class,
            'ContentImage' => Image::class,
            'PreviewImage' => Image::class
        ];

        private static $has_many = [
            'NewsContent' => NewsContent::class
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

            $fields->addFieldToTab("Root.Main", DateField::create("NewsDate"), "Content");

            $fields->addFieldToTab("Root.Main", UploadField::create("HeaderImage")->setFolderName('Uploads/header/'));

            $fields->addFieldToTab("Root.Main", UploadField::create("ContentImage")->setFolderName('Uploads/news/'));

            $fields->addFieldToTab("Root.Gallery", SortableUploadField::create("Gallery")->setFolderName('Uploads/news/'));

            /*$gridConfig = GridFieldConfig_RecordEditor::create();
            $gridConfig->addComponent(GridFieldOrderableRows::create());

            $gridField = GridField::create("NewsContent", "NewsContent", $this->NewsContent(), $gridConfig);
            
            $fields->addFieldsToTab("Root.NewsContent", [
                $gridField
            ]);*/

            $fields->addFieldsToTab("Root.Preview", [
                TextField::create("PreviewTitle", "Title"),
                TextareaField::create("PreviewText", "Text"),
                UploadField::create("PreviewImage", "Image")->setFolderName('Uploads/news/')
            ]);

        	return $fields;
        }

        public function onBeforeWrite() {
            parent::onBeforeWrite();

            $this->ShowInMenus = 0;
        }
    }
}
