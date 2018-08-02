<?php
/**
 * Created by PhpStorm.
 * User: andorsarig
 * Date: 30.07.2018
 * Time: 14:23
 */

class Question
{
    private $question;
    private $possibleAnswers;
    private $correctAnswers;
    private $userAnswer;

    public function __construct(string $question, AnswersCollection $possible, AnswersCollection $correct)
    {
        $this->question = $question;
        $this->possibleAnswers = $possible;
        $this->correctAnswers = $correct;
        $this->userAnswer = null;
    }

    public function setUserAnswer(AnswersCollection $answer)
    {
        $this->userAnswer = $answer;
    }

    public function getUserAnswerAsArray()
    {
        return $this->userAnswer->getAnswersAsArray();
    }

    public function getQuestion()
    {
        return $this->question;
    }

    public function getPossibleAnswers()
    {
        return $this->possibleAnswers;
    }

    public function getCorrectAnswersAsArray()
    {
        return $this->correctAnswers->getAnswersAsArray();
    }

}