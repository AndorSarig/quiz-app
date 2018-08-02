<?php
/**
 * Created by PhpStorm.
 * User: andorsarig
 * Date: 02.08.2018
 * Time: 15:56
 */

class OutputGenerator
{
    public function showAllQuizzes(array $quizzes)
    {
        echo "Please pick a quiz from below by writing in it's name:" . PHP_EOL;
        foreach ($quizzes as $quiz) {
            echo $quiz . PHP_EOL;
        }
        echo "Quiz picked: ";
    }

    public function showQuestion(string $question, AnswersCollection $possibleAnswers)
    {
        echo PHP_EOL .  $question . PHP_EOL;
        foreach ($possibleAnswers as $answer) {
            echo $answer->getAnswer() . PHP_EOL;
        }
    }

    public function printResult(string $score)
    {
        echo PHP_EOL . "Your final score is: $score" . PHP_EOL;
    }
}