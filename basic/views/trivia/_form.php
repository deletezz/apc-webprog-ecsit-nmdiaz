<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use app\models\Profile;
use yii\helpers\ArrayHelper;

/* @var $this yii\web\View */
/* @var $model app\models\Trivia */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="trivia-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'question')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'answer')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'profile_id')->dropDownList(ArrayHelper::map(Profile::find()->all(), 'id', 'Complete_Name'), ['prompt' => 'Select...']); ?>

    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? 'Create' : 'Update', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
