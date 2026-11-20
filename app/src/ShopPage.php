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

    class ShopPage extends Page
    {
        private static $icon_class = "font-icon-thumbnails";

        private static $db = [
            'ShopFormEmail' => 'Varchar',
            'ShopTextAfterSend' => 'HTMLText'
        ];

        private static $has_one = [
        ];

        private static $has_many = [
            'Product' => Product::class
        ];

        private static $many_many = [
        ];

        private static $many_many_extraFields = [
        ];

        private static $owns = [
        	
        ];

        public function getCMSFields() {
        	$fields = parent::getCMSFields();

            $gridConfig = GridFieldConfig_RecordEditor::create();
            $gridConfig->addComponent(GridFieldOrderableRows::create("Sort"));

            $gridField = GridField::create("Product", "Product", $this->Product(), $gridConfig);
            $fields->addFieldsToTab("Root.Products", [
                $gridField
            ]);

            $fields->addFieldsToTab("Root.Form", [
                TextField::create("ShopFormEmail"),
                HTMLEditorField::create("ShopTextAfterSend")->addExtraClass("stacked")
            ]);

        	return $fields;
        }
    }
}
