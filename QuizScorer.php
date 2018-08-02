<?php
/**
 * Created by PhpStorm.
 * User: andorsarig
 * Date: 01.08.2018
 * Time: 14:08
 */

class QuizScorer
{
    private $quizToScore;
    private $score = 0;

    public function __construct(Quiz $quizToScore)
    {
        $this->quizToScore = $quizToScore;
    }

    public function getFinalScore() {
        $this->calculateScore();
        return $this->score;
    }

    private function calculateScore()
    {
        foreach ($this->quizToScore as $question) {
            if (count(array_intersect($question->getUserAnswerAsArray(),
                $question->getCorrectAnswersAsArray())) ===
                count($question->getCorrectAnswersAsArray())) {
                $this->score++;
            }
        }
    }
}