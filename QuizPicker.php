<?php

/**
 * Initializes the quiz from database.
 *
 * Class QuizPicker
 */

class QuizPicker
{
    private $detailsGetter;
    private $outputGenerator;
    private $quizGenerator;

    public function __construct(QuizDetailsGetter $detailsGetter, OutputGenerator $outputGenerator,
                                QuizGenerator $quizGenerator)
    {
        $this->detailsGetter = $detailsGetter;
        $this->outputGenerator = $outputGenerator;
        $this->quizGenerator = $quizGenerator;
    }

    public function pickQuiz(string $name) : void
    {
        $this->detailsGetter->setQuizCategory($name);
    }

    public function showQuizzes() : void
    {
        $quizzes = $this->detailsGetter->getAllQuizzes();
        $this->outputGenerator->showAllQuizzes($quizzes);
    }

    public function generateQuiz() : Quiz
    {
        $quiz = new Quiz();
        $questions = $this->detailsGetter->getQuizQuestions();
        $possibleAnswers = $this->detailsGetter->getQuizPossibleAnswers();
        $correctAnswers = $this->detailsGetter->getQuizCorrectAnswers();
        foreach ($questions as $questionNr => $question) {
            $correctAnswersCollection = $this->generateAnswersCollection($correctAnswers[$questionNr]);
            $possibleAnswersCollection = $this->generateAnswersCollection($possibleAnswers[$questionNr]);
            $quiz->addQuestion(new Question($question, $possibleAnswersCollection, $correctAnswersCollection));
        }
        return $quiz;
    }

    private function generateAnswersCollection(string $answers) : AnswersCollection
    {
        $answers = explode(';', $answers);
        $answerCollection = new AnswersCollection();
        foreach ($answers as $answer) {
            $answerCollection->addAnswer(new Answer($answer));
        }
        return $answerCollection;
    }

}