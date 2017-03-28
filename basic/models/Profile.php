<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "profile".
 *
 * @property integer $id
 * @property string $slug
 * @property string $Complete_Name
 * @property string $Nickname
 * @property string $Email_Address
 * @property string $Home_Address
 * @property string $Gender
 * @property string $Cellphone_Number
 * @property string $Comments
 *
 * @property Trivia[] $trivias
 */
class Profile extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'profile';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['slug', 'Complete_Name', 'Nickname', 'Email_Address', 'Gender', 'Cellphone_Number'], 'required'],
            [['Nickname', 'Email_Address', 'Comments'], 'string'],
            [['slug', 'Complete_Name', 'Home_Address'], 'string', 'max' => 128],
            [['Gender'], 'string', 'max' => 1],
            [['Cellphone_Number'], 'string', 'max' => 20],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'slug' => 'Slug',
            'Complete_Name' => 'Complete  Name',
            'Nickname' => 'Nickname',
            'Email_Address' => 'Email  Address',
            'Home_Address' => 'Home  Address',
            'Gender' => 'Gender',
            'Cellphone_Number' => 'Cellphone  Number',
            'Comments' => 'Comments',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getTrivias()
    {
        return $this->hasMany(Trivia::className(), ['profile.id' => 'id']);
    }
}
