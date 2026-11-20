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
    use SilverStripe\Forms\GridField\GridFieldConfig;
    use Symbiote\GridFieldExtensions\GridFieldOrderableRows;
    use SilverStripe\Forms\GridField\GridFieldDeleteAction;
    use SilverStripe\Forms\GridField\GridFieldToolbarHeader;
    use SilverStripe\Forms\GridField\GridFieldButtonRow;
    use Symbiote\GridFieldExtensions\GridFieldAddNewInlineButton;
    use Symbiote\GridFieldExtensions\GridFieldEditableColumns;
    use Symbiote\GridFieldExtensions\GridFieldTitleHeader;

    class ServicePage extends Page
    {
        private static $icon_class = "font-icon-block-settings";

        private static $allowed_children = [
            
        ];

        private static $can_be_root = false;

        private static $db = [
            'ContentRight' => 'HTMLText',
        	'PreviewTitle' => 'Varchar',
        	'PreviewText' => 'Text',
            'ShowOnHome' => 'Boolean'
        ];

        private static $has_one = [
            'PreviewImage' => Image::class
        ];

        private static $has_many = [
            'Video' => ServiceVideo::class
        ];

        private static $many_many = [
            'Image' => Image::class
        ];

        private static $many_many_extraFields = [
            'Image' => [ 'SortOrder' => 'Int' ]
        ];

        private static $owns = [
        	'PreviewImage',
            'Image'
        ];

        public function getSettingsFields() {
        	$fields = parent::getSettingsFields();

            //$fields->addFieldToTab("Root.Settings", CheckboxField::create("ShowOnHome"), "ShowInMenus");

            return $fields;
        }

        public function getCMSFields() {
        	$fields = parent::getCMSFields();

            $fields->addFieldsToTab("Root.Main", [
                HTMLEditorField::create("ContentRight")->addExtraClass("stacked")
            ], 'HeaderImage');

            $fields->addFieldsToTab("Root.Preview", [
    			TextField::create("PreviewTitle", "Title"),
    			TextareaField::create("PreviewText", "Text"),
    			UploadField::create("PreviewImage", "Image")
    		]);

            $gridConfig = GridFieldConfig::create()
            ->addComponent(new GridFieldButtonRow('before'))
            ->addComponent(new GridFieldToolbarHeader())
            ->addComponent(new GridFieldTitleHeader())
            ->addComponent(new GridFieldEditableColumns())
            ->addComponent(new GridFieldDeleteAction())
            ->addComponent(new GridFieldAddNewInlineButton())
            ->addComponent(GridFieldOrderableRows::create());

            $gridField = GridField::create("Video", "Video", $this->Video(), $gridConfig);
            $fields->addFieldToTab("Root.Video", $gridField);

            $fields->addFieldToTab("Root.Images", SortableUploadField::create("Image"));

        	return $fields;
        }
    }
}
