<?php

require 'filestorequire.php';

echo "Name: ";
$name = str_replace(PHP_EOL, '', fgets(STDIN));

echo "Email: ";
$email = str_replace(PHP_EOL, '', fgets(STDIN));

$quizFlow = new QuizFlow();
$quizFlow->startQuiz();