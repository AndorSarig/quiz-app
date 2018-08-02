<?php
/**
 * Created by PhpStorm.
 * User: andorsarig
 * Date: 31.07.2018
 * Time: 17:02
 */

class Answer
{
    private $answer;

    public function __construct(string $answer) {
        $this->answer = $answer;
    }

    /**
     * @return string
     */
    public function getAnswer(): string
    {
        return $this->answer;
    }

    /**
     * @param string $answer
     */
    public function setAnswer(string $answer)
    {
        $this->answer = $answer;
    }

}