<?php
/**
 * Created by PhpStorm.
 * User: andorsarig
 * Date: 01.08.2018
 * Time: 17:17
 */

class QuizDetailsGetter
{
    private $connection;
    private $quizCategory;

    public function __construct(Connection $pdo)
    {
        $this->connection = $pdo;
    }

    public function setQuizCategory(string $quizName) : void
    {
        $pdo    = $this->connection->getPDO();
        $sql    = "SELECT `quiz-id` FROM QuizCategories WHERE `quiz-name`={$pdo->quote($quizName)}";
        $stmt   = $pdo->query($sql);
        $this->quizCategory = $stmt->fetch(PDO::FETCH_COLUMN, 0);
    }

    public function getAllQuizzes() : array
    {
        $sql    = "SELECT `quiz-name` FROM QuizCategories";
        $pdo    = $this->connection->getPDO();
        $stmt   = $pdo->query($sql);
        return $stmt->fetchAll(PDO::FETCH_COLUMN, 0);
    }

    public function getQuizQuestions() : array
    {
        $pdo    = $this->connection->getPDO();
        $sql    = "SELECT `question` FROM Questions WHERE `quiz-id`=$this->quizCategory";
        $stmt   = $pdo->query($sql);
        $result = $stmt->fetchAll(PDO::FETCH_COLUMN, 0);
        return $result;
    }

    public function getQuizPossibleAnswers() : array
    {
        $pdo    = $this->connection->getPDO();
        $sql    = "SELECT GROUP_CONCAT(DISTINCT `answer` SEPARATOR ';') FROM PossibleAnswers WHERE `quiz-id` = $this->quizCategory GROUP BY `question-id` ORDER BY `question-id` ASC;";
        $stmt   = $pdo->query($sql);
        $result = $stmt->fetchAll(PDO::FETCH_COLUMN, 0);
        return $result;
    }

    public function getQuizCorrectAnswers() : array
    {
        $pdo    = $this->connection->getPDO();
        $sql    = "SELECT GROUP_CONCAT(DISTINCT `answer` SEPARATOR ';') FROM PossibleAnswers WHERE `quiz-id` = $this->quizCategory AND `is-correct`=1 GROUP BY `question-id` ORDER BY `question-id` ASC;";
        $stmt   = $pdo->query($sql);
        $result = $stmt->fetchAll(PDO::FETCH_COLUMN, 0);
        return $result;
    }
}
