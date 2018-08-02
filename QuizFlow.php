<?php
/**
 * Created by PhpStorm.
 * User: andorsarig
 * Date: 02.08.2018
 * Time: 16:13
 */

class QuizFlow
{
    public function startQuiz() {
        $conn = new Connection();
        $quizDetailsGetter = new QuizDetailsGetter($conn);
        $outputGenerator = new OutputGenerator();
        $quizGenerator = new QuizGenerator();
        $quizPicker = new QuizPicker($quizDetailsGetter, $outputGenerator, $quizGenerator);
        $quizPicker->showQuizzes();
        $pickedQuiz = str_replace(PHP_EOL, '', fgets(STDIN));
        $quizPicker->pickQuiz($pickedQuiz);
        $quiz = $quizPicker->generateQuiz();
        foreach ($quiz as $question) {
            $outputGenerator->showQuestion($question->getQuestion(), $question->getPossibleAnswers());
            $userAnswer = explode(',', str_replace(PHP_EOL, '', fgets(STDIN)));
            $userAnswerCollection = new AnswersCollection();
            foreach ($userAnswer as $answer) {
                $userAnswerCollection->addAnswer(new Answer($answer));
            }
            $question->setUserAnswer($userAnswerCollection);
        }
        $quizScorer = new QuizScorer($quiz);
        $finalScore = $quizScorer->getFinalScore();
        $outputGenerator->printResult($finalScore);
    }
}