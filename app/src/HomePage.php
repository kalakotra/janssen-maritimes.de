<?php

namespace {

    use SilverStripe\CMS\Model\SiteTree;
    use SilverStripe\Forms\FieldList;
	use SilverStripe\Forms\TextField;
	use SilverStripe\Forms\TextareaField;
	use SilverStripe\Forms\CheckboxField;
	use SilverStripe\Forms\LiteralField;
    use SilverStripe\Forms\DropdownField;
	use SilverStripe\Forms\HTMLEditor\HTMLEditorField;
	use SilverStripe\Assets\File;
    use SilverStripe\Assets\Image;
	use SilverStripe\AssetAdmin\Forms\UploadField;
    use Bummzack\SortableFile\Forms\SortableUploadField;
	use SilverStripe\Forms\GridField\GridField;
	use SilverStripe\Forms\GridField\GridFieldConfig_RecordEditor;
	use Symbiote\GridFieldExtensions\GridFieldOrderableRows;
    use SilverStripe\Forms\TreeDropdownField;

    class HomePage extends Page
    {

        private static $icon_class = "font-icon-p-home";
        
        private static $db = [
            'OurTrademarks' => 'HTMLText',
            'OurServices' => 'HTMLText',
            'OurBlog' => 'HTMLText',
            'OurNewsAndEvents' => 'HTMLText',
            'OurNewsletter' => 'HTMLText'
        ];

        private static $has_one = [ 	
        ];

        private static $has_many = [
        	'Slide' => Slide::class
        ];

        private static $many_many = [
            'Logo' => Image::class
        ];

        private static $many_many_extraFields = [
            
        ];

        private static $owns = [
            'Logo'
        ];

        public function getCMSFields() {
        	$fields = parent::getCMSFields();

            //$fields->removeFieldFromTab("Root.Main", "Content");

            $fields->addFieldtoTab("Root.Main", UploadField::create("HeaderImage", "Content Image"));

            $gridConfig = GridFieldConfig_RecordEditor::create();
            $gridConfig->addComponent(GridFieldOrderableRows::create());

            $gridField = GridField::create("Slide", "Slide", $this->Slide(), $gridConfig);
            
            $fields->addFieldsToTab("Root.Slider", [
                $gridField
            ]);

            $fields->addFieldsToTab("Root.IntroText", [
                SortableUploadField::create("Logo")->setFolderName("Uploads/logo"),
                HTMLEditorField::create("OurTrademarks")->addExtraClass("stacked"),
                HTMLEditorField::create("OurServices")->addExtraClass("stacked"),
                HTMLEditorField::create("OurBlog")->addExtraClass("stacked"),
                HTMLEditorField::create("OurNewsAndEvents")->addExtraClass("stacked"),
                HTMLEditorField::create("OurNewsletter")->addExtraClass("stacked")
            ]);

        	return $fields;
        }
    }
}
