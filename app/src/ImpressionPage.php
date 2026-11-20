<?php

namespace {

    use SilverStripe\Forms\TextField;
    use SilverStripe\Forms\LiteralField;
    use SilverStripe\Forms\TextareaField;
    use SilverStripe\Forms\CheckboxField;
    use SilverStripe\Forms\HTMLEditor\HTMLEditorField;
    use SilverStripe\Assets\File;
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

    class ImpressionPage extends Page
    {
        private static $icon_class = "font-icon-block-banner";

        private static $allowed_children = [
            
        ];

        private static $can_be_root = false;

        private static $db = [
            'ContentRight' => 'HTMLText',
        	'PreviewTitle' => 'Varchar',
        	'PreviewText' => 'Text',

            'ExteriorTitle' => 'Varchar',
            'ExteriorText1' => 'HTMLText',
            'ExteriorText2' => 'HTMLText',
            'ExteriorLinkTitle' => 'Varchar',
            'ExteriorLinkURL' => 'Varchar',

            'InteriorTitle' => 'Varchar',
            'InteriorText1' => 'HTMLText',
            'InteriorText2' => 'HTMLText',
            'InteriorLinkTitle' => 'Varchar',
            'InteriorLinkURL' => 'Varchar',

            'SpecificationLeftTableHeader' => 'Boolean',
            'SpecificationRightTableHeader' => 'Boolean',
            'SpecificationTextAfterTable' => 'Varchar'
        ];

        private static $has_one = [
            'PreviewImage' => Image::class,
            'ExteriorSeparatorImage' => Image::class,
            'InteriorSeparatorImage' => Image::class,
            'SpecificationImage' => Image::class
        ];

        private static $has_many = [
            'Slide' => ImpressionSlide::class,
            'Video' => ImpressionVideo::class,
            'Highlight' => ImpressionHighlight::class,

            'SpecificationLeftValue' => ImpressionTechLeftValue::class,
            'SpecificationRightValue' => ImpressionTechRightValue::class
        ];

        private static $many_many = [
            'ExteriorImage' => Image::class,
            'InteriorImage' => Image::class,
            'SpecificationGallery' => Image::class,
            'Download' => File::class
        ];

        private static $many_many_extraFields = [
            'ExteriorImage' => [ 'SortOrder' => 'Int' ],
            'InteriorImage' => [ 'SortOrder' => 'Int' ],
            'SpecificationGallery' => [ 'SortOrder' => 'Int' ],
            'Download' => [ 'SortOrder' => 'Int' ]
        ];

        private static $owns = [
        	'PreviewImage',
            'ExteriorImage',
            'ExteriorSeparatorImage',
            'InteriorImage',
            'InteriorSeparatorImage',
            'SpecificationImage',
            'SpecificationGallery',
            'Download'
        ];

        public function getSettingsFields() {
        	$fields = parent::getSettingsFields();

            return $fields;
        }

        public function getCMSFields() {
        	$fields = parent::getCMSFields();

            $fields->addFieldsToTab("Root.Main", [
                HTMLEditorField::create("ContentRight")->addExtraClass("stacked")
            ], 'HeaderImage');

            $fields->removeFieldFromTab("Root.Main", "HeaderImage");

            $gridConfig = GridFieldConfig_RecordEditor::create();
            $gridConfig->addComponent(GridFieldOrderableRows::create());

            $gridField = GridField::create("Slide", "Slide", $this->Slide(), $gridConfig);
            
            $fields->addFieldsToTab("Root.Slider", [
                $gridField
            ]);

            $fields->addFieldsToTab("Root.Preview", [
                TextField::create("PreviewTitle", "Title"),
                TextareaField::create("PreviewText", "Text"),
                UploadField::create("PreviewImage", "Image")
            ]);

            $gridConfig = GridFieldConfig_RecordEditor::create();
            $gridConfig->addComponent(GridFieldOrderableRows::create());

            $gridField = GridField::create("Highlight", "Highlight", $this->Highlight(), $gridConfig);
            
            $fields->addFieldsToTab("Root.Highlights", [
                $gridField
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
            $fields->addFieldToTab("Root.Videos", $gridField);


            /* exterior part */
            $fields->addFieldsToTab("Root.Exterior", [
                TextField::create("ExteriorTitle", "Title"),
                HTMLEditorField::create("ExteriorText1", "Text left")->addExtraClass("stacked"),
                HTMLEditorField::create("ExteriorText2", "Text right")->addExtraClass("stacked"),
                TextField::create("ExteriorLinkTitle", "Link Title"),
                TextField::create("ExteriorLinkURL", "Link URL"),
                UploadField::create("ExteriorSeparatorImage", "Separator Image")->setFolderName('Uploads/yachts/'),
                SortableUploadField::create("ExteriorImage", "Image")->setFolderName('Uploads/yachts/')
            ]);

            /* interior part */
            $fields->addFieldsToTab("Root.Interior", [
                TextField::create("InteriorTitle", "Title"),
                HTMLEditorField::create("InteriorText1", "Text left")->addExtraClass("stacked"),
                HTMLEditorField::create("InteriorText2", "Text right")->addExtraClass("stacked"),
                TextField::create("InteriorLinkTitle", "Link Title"),
                TextField::create("InteriorLinkURL", "Link URL"),
                UploadField::create("InteriorSeparatorImage", "Separator Image")->setFolderName('Uploads/yachts/'),
                SortableUploadField::create("InteriorImage", "Image")->setFolderName('Uploads/yachts/')
            ]);

            /* specification part */

            $gridConfig = GridFieldConfig::create()
            ->addComponent(new GridFieldButtonRow('before'))
            ->addComponent(new GridFieldToolbarHeader())
            ->addComponent(new GridFieldTitleHeader())
            ->addComponent(new GridFieldEditableColumns())
            ->addComponent(new GridFieldDeleteAction())
            ->addComponent(new GridFieldAddNewInlineButton())
            ->addComponent(GridFieldOrderableRows::create());

            $gridFieldLeft = GridField::create("SpecificationLeftValue", "Specification Left Value", $this->SpecificationLeftValue(), $gridConfig);

            $gridConfig = GridFieldConfig::create()
            ->addComponent(new GridFieldButtonRow('before'))
            ->addComponent(new GridFieldToolbarHeader())
            ->addComponent(new GridFieldTitleHeader())
            ->addComponent(new GridFieldEditableColumns())
            ->addComponent(new GridFieldDeleteAction())
            ->addComponent(new GridFieldAddNewInlineButton())
            ->addComponent(GridFieldOrderableRows::create());

            $gridFieldRight = GridField::create("SpecificationRightValue", "Specification Right Value", $this->SpecificationRightValue(), $gridConfig);

            $fields->addFieldsToTab("Root.Specification", [
                CheckboxField::create("SpecificationLeftTableHeader", "First line as header"),
                $gridFieldLeft,

                LiteralField::create("separator", "<div style='padding-top: 40px;'></div>"),
                //CheckboxField::create("SpecificationRightTableHeader", "First line as header"),
                $gridFieldRight,
                LiteralField::create("separator", "<div style='padding-top: 40px;'></div>"),
                TextField::create("SpecificationTextAfterTable"),
                UploadField::create("SpecificationImage")->setFolderName('Uploads/yachts/'),
                SortableUploadField::create("SpecificationGallery", "Gallery Image")->setFolderName('Uploads/yachts/')
            ]);

            $fields->addFieldsToTab("Root.Downloads", [
                SortableUploadField::create("Download")->setFolderName('Uploads/yachts/')
            ]);

        	return $fields;
        }
    }
}
