<?php

namespace {

    use SilverStripe\CMS\Controllers\ContentController;
    use SilverStripe\View\Requirements;
    use SilverStripe\View\SSViewer;
    use SilverStripe\ORM\FieldType\DBField;
    use SilverStripe\Forms\Form;
    use SilverStripe\Forms\FieldList;
    use SilverStripe\Forms\FormAction;
    use SilverStripe\Forms\Validation\RequiredFieldsValidator;
    use SilverStripe\Forms\DropdownField;
    use SilverStripe\Forms\EmailField;
    use SilverStripe\Forms\CheckboxField;
    use SilverStripe\Forms\CheckboxSetField;
    use SilverStripe\Control\Email\Email;

    class PageController extends ContentController
    {
        /**
         * An array of actions that can be accessed via a request. Each array element should be an action name, and the
         * permissions or conditions required to allow the user to access it.
         *
         * <code>
         * [
         *     'action', // anyone can access this action
         *     'action' => true, // same as above
         *     'action' => 'ADMIN', // you must have ADMIN permissions to access this action
         *     'action' => '->checkAction' // you can only access this action if $this->checkAction() returns true
         * ];
         * </code>
         *
         * @var array
         */
        private static $allowed_actions = [
            'NewsletterForm',
            'ShopForm'
        ];

        protected function init()
        {
            parent::init();
            // You can include any CSS or JS required by your project here.
            // See: https://docs.silverstripe.org/en/developer_guides/templates/requirements/


            if ($this->URLSegment != "Security") {
                $myThemes = SSViewer::get_themes();
                $myThemePath = "themes/".$myThemes[1]."/";

                Requirements::css($myThemePath.'css/scss/bootstrap.scss', 'all');

                Requirements::backend()->setWriteHeaderComment(false);
                $css = [];
                $css[] = $myThemePath.'css/layout.css';
                $css[] = $myThemePath.'css/navigation.css';
                $css[] = $myThemePath.'css/reset.css';
                $css[] = $myThemePath.'css/fonts.css';
                $css[] = $myThemePath.'css/font-size.css';
                Requirements::combine_files('styles.css', $css, ["media"=>"all"]);
                Requirements::process_combined_files();

                $css = [];
                $css[] = $myThemePath.'css/jquery.fancybox.min.css';            // fancybox popup
                $css[] = $myThemePath.'css/aos.css';                            // animate on scroll
                $css[] = $myThemePath.'css/hamburgers.min.css';                 // hamburger menu
                $css[] = $myThemePath.'css/all.min.css';                        // fontawesome
                Requirements::combine_files('plugins.css', $css, ["media"=>"all"]);
                Requirements::process_combined_files();

                $js = [];
                $js[] = $myThemePath.'javascript/jquery-3.5.1.min.js';
                Requirements::combine_files('jquery.js', $js);
                Requirements::process_combined_files();

                $js = [];
                $js[] = $myThemePath.'javascript/popper.min.js';
                $js[] = $myThemePath.'javascript/bootstrap.min.js';
                $js[] = $myThemePath.'javascript/aos.js';
                $js[] = $myThemePath.'javascript/jquery.fancybox.min.js';
                $js[] = $myThemePath.'javascript/script.js';
                Requirements::combine_files('javascripts.js', $js, ["async"=>true, "defer" => true]);
                Requirements::process_combined_files();
            }
        }


        public function getMyClass($myClass = "Page") {
            return $myClass::get();
        }

        public function NewsletterForm() { 
            $myTM = $this->getMyClass("BooteHolder")->filter(["ShowOnHomeLogo" => "1"]);
            $fields = FieldList::create( 
                EmailField::create('Email', 'Email')->setAttribute("placeholder", "Email")->addExtraClass("hide-label"), 
                DropdownField::create('Trademark', 'Trademark', $myTM->map())->setEmptyString(_t("NewsletterForm.Trademark","Welche Marken interessieren Sie?"))->addExtraClass("mb-0")->addExtraClass("hide-label"),
                CheckboxField::create("datenschutz", DBField::create_field("HTMLFragment", 'Ich habe die <a href="datenschutz/" target="_blank" class="text-white"><u>Datenschutzerklärung</u></a> gelesen und akzeptiere sie.'))->addExtraClass("text-white")
            ); 

            $actions = FieldList::create( 
                FormAction::create('submitNewsletterForm', _t("NewsletterForm.Submit","Abschicken"))->addExtraClass("btn-info") 
            ); 

            $validator = RequiredFieldsValidator::create('Email', 'Trademark');

            $form = Form::create($this, 'NewsletterForm', $fields, $actions, $validator); 

            $form->setTemplate('NewsletterForm');

            return $form;
        }

        public function submitNewsletterForm($data, $form) {

        }


        public function ShopForm() { 
            $myProducts = $this->getMyClass("Product")->filter(["ShopPageID" => $this->ID]);
            $fields = FieldList::create( 
                CheckboxSetField::create('Products', 'Ausgewählte Produkte', $myProducts->map()),
                EmailField::create('Email', 'Email')->setAttribute("placeholder", "Email")->addExtraClass("hide-label"), 
                CheckboxField::create("datenschutz", DBField::create_field("HTMLFragment", 'Ich habe die <a href="datenschutz/" target="_blank" ><u>Datenschutzerklärung</u></a> gelesen und akzeptiere sie.'))
            ); 

            $actions = FieldList::create( 
                FormAction::create('submitShopForm', _t("ShopForm.Submit","Angebot anfordern"))->addExtraClass("btn-info") 
            ); 

            $validator = RequiredFieldsValidator::create('Products', 'Email', 'datenschutz');

            $form = Form::create($this, 'ShopForm', $fields, $actions, $validator); 

            //$form->setTemplate('NewsletterForm');

            return $form;
        }

        public function submitShopForm($data, $form) {

            $myProducts = $this->getMyClass("Product")->filter(["ShopPageID" => $this->ID, "ID"=>$data["Products"]]);
            $myBody = "<p><strong>Ausgewählte Produkte:</strong></p>";
            foreach ($myProducts as $key => $value) {
                $myBody .= "<p>".$value->Title."</p>";
            }

            $email = new Email(); 

            $email->setTo($this->ShopFormEmail); 
            $email->setFrom($data['Email']); 
            $email->setSubject("Janssen Maritimes Shop"); 

            $email->setBody($myBody); 
            $email->send(); 
            return [
                'Content' => DBField::create_field("HTMLFragment", $this->ShopTextAfterSend),
                'ShopForm' => false,
                'Product' => false
            ];
        }
    }
}
