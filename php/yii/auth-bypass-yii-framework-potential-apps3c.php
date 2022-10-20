<?php

use Yii;

class Module extends \yii\base\Module
{

    # Wrong   
    public function beforeAction($action)
    {
        // Must be an admin to access this module
        if (!Yii::$app->user->identity->isAdmin) {
            return Yii::$app->controller->redirect(['/error']);
        }
        return true;
    }

    # Correct
    public function beforeAction($action)
    {
        // Must be an admin to access this module
        if (!Yii::$app->user->identity->isAdmin) {
            Yii::$app->controller->redirect(['/error']);
            return false;
        }
        return true;
    }

    # Potentially wrong. externalMethod should be inspected
    public function beforeAction($action)
    {
        // Must be an admin to access this module
        if (!Yii::$app->user->identity->isAdmin) {
            return ExternalClass.externalMethod();
        }
        return true;
    }
   
}
