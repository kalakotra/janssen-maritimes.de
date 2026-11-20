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

    class BlogPage extends Page
    {
        private static $icon_class = "font-icon-block-blog-post";

        private static $db = [
            'PreviewTitle' => 'Varchar',
            'PreviewText' => 'Text'
        ];

        private static $has_one = [
        	'HeaderImage' => Image::class,
            'PreviewImage' => Image::class
        ];

        private static $has_many = [
            'BlogContent' => BlogContent::class
        ];

        private static $many_many = [
        ];

        private static $many_many_extraFields = [
        ];

        private static $owns = [
        	'HeaderImage',
            'PreviewImage'
        ];

        public function getCMSFields() {
        	$fields = parent::getCMSFields();

            $fields->addFieldToTab("Root.Main", UploadField::create("HeaderImage")->setFolderName('Uploads/header/'));

            $gridConfig = GridFieldConfig_RecordEditor::create();
            $gridConfig->addComponent(GridFieldOrderableRows::create());

            $gridField = GridField::create("BlogContent", "BlogContent", $this->BlogContent(), $gridConfig);
            
            $fields->addFieldsToTab("Root.BlogContent", [
                $gridField
            ]);

            $fields->addFieldsToTab("Root.Preview", [
                TextField::create("PreviewTitle", "Title"),
                TextareaField::create("PreviewText", "Text"),
                UploadField::create("PreviewImage", "Image")->setFolderName('Uploads/blog/')
            ]);

        	return $fields;
        }

        public function onBeforeWrite() {
            parent::onBeforeWrite();

            $this->ShowInMenus = 0;
        }
    }
}
