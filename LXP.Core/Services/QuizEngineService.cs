using LXP.Common.ViewModels.QuizEngineViewModel;
using LXP.Core.IServices;
using LXP.Data.IRepository;

namespace LXP.Core.Services
{
    public class QuizEngineService : IQuizEngineService
    {
        private readonly IQuizEngineRepository _quizEngineRepository;

        public QuizEngineService(IQuizEngineRepository quizEngineRepository)
        {
            _quizEngineRepository = quizEngineRepository;
        }
        public ViewQuizDetailsViewModel GetQuizById(Guid quizId)
        {
            return _quizEngineRepository.GetQuizById(quizId);
        }

        public IEnumerable<QEQuizQuestionViewModel> GetQuestionsForQuiz(Guid quizId)
        {
            return _quizEngineRepository.GetQuestionsForQuiz(quizId);
        }
        public ViewQuizDetailsViewModel GetQuizDetailsByTopicId(Guid topicId)
        {
            return _quizEngineRepository.GetQuizDetailsByTopicId(topicId);
        }

        public Guid StartQuizAttempt(Guid learnerId, Guid quizId)
        {
            var quiz = _quizEngineRepository.GetQuizById(quizId);
            if (quiz == null)
                throw new KeyNotFoundException($"Quiz with ID {quizId} not found.");

            var isAllowedToAttempt = _quizEngineRepository.IsAllowedToAttemptQuiz(learnerId, quizId);
            if (!isAllowedToAttempt)
            {
                var existingAttempts = _quizEngineRepository.GetLearnerAttemptsForQuiz(learnerId, quizId);
                var passMark = quiz.PassMark;
                var hasPassedQuiz = existingAttempts.Any(a => a.Score >= passMark);

                if (hasPassedQuiz)
                    throw new InvalidOperationException("You have already passed this quiz in a previous attempt.");
                else
                    throw new InvalidOperationException("You have exceeded the maximum number of attempts for this quiz.");
            }

            var startTime = DateTime.UtcNow; // Start time is calculated here
            var attempt = _quizEngineRepository.CreateLearnerAttempt(learnerId, quizId, startTime);
            return attempt.LearnerAttemptId;
        }



        //public void SubmitQuizAttempt(Guid attemptId)
        //{
        //    var attempt = _quizEngineRepository.GetLearnerAttemptById(attemptId);
        //    if (attempt == null)
        //        throw new KeyNotFoundException($"Learner attempt with ID {attemptId} not found.");

        //    var quiz = _quizEngineRepository.GetQuizById(attempt.QuizId);
        //    if (quiz == null)
        //        throw new KeyNotFoundException($"Quiz with ID {attempt.QuizId} not found.");

        //    var totalQuestions = _quizEngineRepository.GetQuestionsForQuiz(quiz.QuizId).Count();
        //    var individualQuestionMarks = 100 / totalQuestions;


        //    var existingAnswers = _quizEngineRepository.GetLearnerAnswersForAttempt(attemptId);

        //    float finalScore = 0;
        //    foreach (var answer in existingAnswers)
        //    {
        //        var isAnswerCorrect = _quizEngineRepository.IsQuestionOptionCorrect(answer.QuizQuestionId, answer.QuestionOptionId);
        //        var questionScore = CalculateQuestionScore(answer.QuizQuestionId, isAnswerCorrect, individualQuestionMarks, new AnswerSubmissionModel
        //        {
        //            LearnerAttemptId = attemptId,
        //            QuizQuestionId = answer.QuizQuestionId,
        //            SelectedOptions = new List<string> { _quizEngineRepository.GetOptionTextById(answer.QuestionOptionId) }
        //        });

        //        finalScore += questionScore;
        //    }

        //    attempt.Score = (float)Math.Round(finalScore);
        //    attempt.EndTime = DateTime.UtcNow;
        //    _quizEngineRepository.UpdateLearnerAttempt(attempt);
        //}
        public void SubmitQuizAttempt(Guid attemptId)
        {
            var attempt = _quizEngineRepository.GetLearnerAttemptById(attemptId);
            if (attempt == null)
                throw new KeyNotFoundException($"Learner attempt with ID {attemptId} not found.");

            var quiz = _quizEngineRepository.GetQuizById(attempt.QuizId);
            if (quiz == null)
                throw new KeyNotFoundException($"Quiz with ID {attempt.QuizId} not found.");

            var totalQuestions = _quizEngineRepository.GetQuestionsForQuiz(quiz.QuizId).Count();
            var existingAnswers = _quizEngineRepository.GetLearnerAnswersForAttempt(attemptId);

            // Check if the learner has answered all questions
            if (existingAnswers.Select(a => a.QuizQuestionId).Distinct().Count() != totalQuestions)
                throw new InvalidOperationException("You need to answer all the questions in the quiz before submitting the quiz attempt.");

            var individualQuestionMarks = 100 / totalQuestions;
            float finalScore = 0;

            foreach (var answer in existingAnswers)
            {
                var isAnswerCorrect = _quizEngineRepository.IsQuestionOptionCorrect(answer.QuizQuestionId, answer.QuestionOptionId);
                var questionScore = CalculateQuestionScore(answer.QuizQuestionId, isAnswerCorrect, individualQuestionMarks, new AnswerSubmissionModel
                {
                    LearnerAttemptId = attemptId,
                    QuizQuestionId = answer.QuizQuestionId,
                    SelectedOptions = new List<string> { _quizEngineRepository.GetOptionTextById(answer.QuestionOptionId) }
                });

                finalScore += questionScore;
            }

            attempt.Score = (float)Math.Round(finalScore);
            attempt.EndTime = DateTime.UtcNow;
            _quizEngineRepository.UpdateLearnerAttempt(attempt);
        }

        //public void SubmitAnswer(AnswerSubmissionModel answerSubmissionModel)
        //{
        //    var attempt = _quizEngineRepository.GetLearnerAttemptById(answerSubmissionModel.LearnerAttemptId);
        //    if (attempt == null)
        //        throw new KeyNotFoundException($"Learner attempt with ID {answerSubmissionModel.LearnerAttemptId} not found.");
        //    if (DateTime.UtcNow > attempt.EndTime)
        //        throw new InvalidOperationException("Time limit for submitting the quiz has expired.");

        //    var quiz = _quizEngineRepository.GetQuizById(attempt.QuizId);
        //    var totalQuestions = _quizEngineRepository.GetQuestionsForQuiz(quiz.QuizId).Count();
        //    var answeredQuestions = _quizEngineRepository.GetLearnerAnswersForAttempt(answerSubmissionModel.LearnerAttemptId).Select(a => a.QuizQuestionId).Distinct().Count();

        //    if (answeredQuestions < totalQuestions)
        //    {
        //        throw new InvalidOperationException("You need to answer all the questions in the quiz before submitting the quiz attempt.");
        //    }

        //    var individualQuestionMarks = 100 / totalQuestions;

        //    var existingAnswers = _quizEngineRepository.GetLearnerAnswersForAttempt(answerSubmissionModel.LearnerAttemptId);

        //    foreach (var selectedOption in answerSubmissionModel.SelectedOptions)
        //    {
        //        var optionId = _quizEngineRepository.GetOptionIdByText(answerSubmissionModel.QuizQuestionId, selectedOption);

        //        // Check if the user has already submitted an answer for this question
        //        var existingAnswer = existingAnswers.FirstOrDefault(a => a.QuizQuestionId == answerSubmissionModel.QuizQuestionId);
        //        if (existingAnswer != null)
        //        {
        //            // Update the existing answer with the new selected option
        //            _quizEngineRepository.UpdateLearnerAnswer(existingAnswer.LearnerAnswerId, optionId);
        //        }
        //        else
        //        {
        //            // Create a new learner answer
        //            var isAnswerCorrect = _quizEngineRepository.IsQuestionOptionCorrect(answerSubmissionModel.QuizQuestionId, optionId);
        //            var learnerAnswer = _quizEngineRepository.CreateLearnerAnswer(new AnswerSubmissionModel
        //            {
        //                LearnerAttemptId = answerSubmissionModel.LearnerAttemptId,
        //                QuizQuestionId = answerSubmissionModel.QuizQuestionId,
        //                SelectedOptions = new List<string> { selectedOption }
        //            });

        //            var questionScore = CalculateQuestionScore(answerSubmissionModel.QuizQuestionId, isAnswerCorrect, individualQuestionMarks, answerSubmissionModel);
        //            attempt.Score += questionScore;
        //        }
        //    }

        //    attempt.Score = (float)Math.Round(attempt.Score);
        //    attempt.EndTime = DateTime.UtcNow;
        //    _quizEngineRepository.UpdateLearnerAttempt(attempt);
        //}
        public void SubmitAnswer(AnswerSubmissionModel answerSubmissionModel)
        {
            var attempt = _quizEngineRepository.GetLearnerAttemptById(answerSubmissionModel.LearnerAttemptId);
            if (attempt == null)
                throw new KeyNotFoundException($"Learner attempt with ID {answerSubmissionModel.LearnerAttemptId} not found.");
            if (DateTime.UtcNow > attempt.EndTime)
                throw new InvalidOperationException("Time limit for submitting the quiz has expired.");

            var existingAnswers = _quizEngineRepository.GetLearnerAnswersForAttempt(answerSubmissionModel.LearnerAttemptId);

            foreach (var selectedOption in answerSubmissionModel.SelectedOptions)
            {
                var optionId = _quizEngineRepository.GetOptionIdByText(answerSubmissionModel.QuizQuestionId, selectedOption);

                // Check if the user has already submitted an answer for this question
                var existingAnswer = existingAnswers.FirstOrDefault(a => a.QuizQuestionId == answerSubmissionModel.QuizQuestionId);
                if (existingAnswer != null)
                {
                    // Update the existing answer with the new selected option
                    _quizEngineRepository.UpdateLearnerAnswer(existingAnswer.LearnerAnswerId, optionId);
                }
                else
                {

                    _quizEngineRepository.CreateLearnerAnswer(answerSubmissionModel);
                }
            }
        }


        public IEnumerable<QuestionAndUserAnswerViewModel> GetQuestionsAndUserAnswersForAttemptWithoutCorrectAnswers(Guid attemptId)
        {
            return _quizEngineRepository.GetQuestionsAndUserAnswersForAttemptWithoutCorrectAnswers(attemptId);
        }



        public LearnerAttemptDetailsViewModel GetQuizAttemptDetails(Guid attemptId)
        {
            var attempt = _quizEngineRepository.GetLearnerAttemptDetailsById(attemptId);
            if (attempt == null)
                throw new KeyNotFoundException($"Learner attempt with ID {attemptId} not found.");

            return attempt;
        }

        public Guid RetakeQuiz(Guid learnerId, Guid quizId)
        {
            var quiz = _quizEngineRepository.GetQuizById(quizId);
            if (quiz == null)
                throw new KeyNotFoundException($"Quiz with ID {quizId} not found.");

            var isAllowedToAttempt = _quizEngineRepository.IsAllowedToAttemptQuiz(learnerId, quizId);
            if (!isAllowedToAttempt)
                throw new InvalidOperationException("You have exceeded the maximum number of attempts for this quiz.");

            var startTime = DateTime.UtcNow;
            var attempt = _quizEngineRepository.CreateLearnerAttempt(learnerId, quizId, startTime);
            return attempt.LearnerAttemptId;
        }
        private float CalculateQuestionScore(Guid quizQuestionId, bool isAnswerCorrect, float individualQuestionMarks, AnswerSubmissionModel answerSubmissionModel)
        {
            var questionType = _quizEngineRepository.GetQuestionTypeById(quizQuestionId);
            switch (questionType)
            {
                case "MCQ":
                case "T/F":
                    return isAnswerCorrect ? individualQuestionMarks : 0;

                case "MSQ":
                    var options = _quizEngineRepository.GetCorrectOptionsForQuestion(quizQuestionId);
                    var correctOptionCount = options.Count();
                    var selectedOptionsCount = answerSubmissionModel.SelectedOptions.Count;
                    var isPartiallyCorrect = selectedOptionsCount > 0 && selectedOptionsCount != correctOptionCount && answerSubmissionModel.SelectedOptions.Any(o => options.Contains(o));

                    if (isPartiallyCorrect)
                    {

                        var partialMark = (individualQuestionMarks / correctOptionCount) * answerSubmissionModel.SelectedOptions.Count(o => options.Contains(o));
                        return partialMark;
                    }
                    else
                    {
                        return 0;
                    }

                default:
                    return 0;
            }
        }

        public QuizAttemptResultViewModel GetQuizAttemptResult(Guid attemptId)
        {
            var attempt = _quizEngineRepository.GetAttemptById(attemptId);

            if (attempt == null)
                throw new KeyNotFoundException($"Learner attempt with ID {attemptId} not found.");

            var quiz = _quizEngineRepository.GetQuizById(attempt.QuizId);
            if (quiz == null)
                throw new KeyNotFoundException($"Quiz with ID {attempt.QuizId} not found.");

            var result = new QuizAttemptResultViewModel
            {
                Score = attempt.Score,
                StartTime = attempt.StartTime,
                //EndTime = attempt.EndTime ?? DateTime.UtcNow,
                //TimeTaken = attempt.EndTime.HasValue ? (attempt.EndTime.Value - attempt.StartTime) : (DateTime.UtcNow - attempt.StartTime),
                IsPass = attempt.Score >= quiz.PassMark
            };

            return result;
        }
    }
}




















//using LXP.Common.ViewModels.QuizEngineViewModel;
//using LXP.Data;
//using System;
//using System.Collections.Generic;

//public class QuizEngineService : IQuizEngineService
//{
//    private readonly IQuizEngineRepository _quizEngineRepository;

//    public QuizEngineService(IQuizEngineRepository quizEngineRepository)
//    {
//        _quizEngineRepository = quizEngineRepository;
//    }
//    public ViewQuizDetailsViewModel GetQuizById(Guid quizId)
//    {
//        return _quizEngineRepository.GetQuizById(quizId);
//    }

//    public IEnumerable<QEQuizQuestionViewModel> GetQuestionsForQuiz(Guid quizId)
//    {
//        return _quizEngineRepository.GetQuestionsForQuiz(quizId);
//    }
//    public ViewQuizDetailsViewModel GetQuizDetailsByTopicId(Guid topicId)
//    {
//        return _quizEngineRepository.GetQuizDetailsByTopicId(topicId);
//    }


//    public Guid StartQuizAttempt(Guid learnerId, Guid quizId)
//    {
//        var quiz = _quizEngineRepository.GetQuizById(quizId);
//        if (quiz == null)
//            throw new KeyNotFoundException($"Quiz with ID {quizId} not found.");

//        var isAllowedToAttempt = _quizEngineRepository.IsAllowedToAttemptQuiz(learnerId, quizId);
//        if (!isAllowedToAttempt)
//            throw new InvalidOperationException("You have exceeded the maximum number of attempts for this quiz.");

//        var attempt = _quizEngineRepository.CreateLearnerAttempt(learnerId, quizId);
//        return attempt.LearnerAttemptId;
//    }


//    public void SubmitAnswer(AnswerSubmissionModel answerSubmissionModel)
//    {
//        var attempt = _quizEngineRepository.GetLearnerAttemptById(answerSubmissionModel.LearnerAttemptId);
//        if (attempt == null)
//            throw new KeyNotFoundException($"Learner attempt with ID {answerSubmissionModel.LearnerAttemptId} not found.");

//        foreach (var selectedOption in answerSubmissionModel.SelectedOptions)
//        {
//            var optionId = _quizEngineRepository.GetOptionIdByText(answerSubmissionModel.QuizQuestionId, selectedOption);
//            var isAnswerCorrect = _quizEngineRepository.IsQuestionOptionCorrect(answerSubmissionModel.QuizQuestionId, optionId);
//            var learnerAnswer = _quizEngineRepository.CreateLearnerAnswer(new AnswerSubmissionModel
//            {
//                LearnerAttemptId = answerSubmissionModel.LearnerAttemptId,
//                QuizQuestionId = answerSubmissionModel.QuizQuestionId,
//                SelectedOptions = new List<string> { selectedOption }
//            });

//            var questionScore = CalculateQuestionScore(answerSubmissionModel.QuizQuestionId, isAnswerCorrect);
//            attempt.Score += questionScore;
//        }

//        _quizEngineRepository.UpdateLearnerAttempt(attempt);
//    }

//    public LearnerAttemptDetailsViewModel GetQuizAttemptDetails(Guid attemptId)
//    {
//        var attempt = _quizEngineRepository.GetLearnerAttemptDetailsById(attemptId);
//        if (attempt == null)
//            throw new KeyNotFoundException($"Learner attempt with ID {attemptId} not found.");

//        return attempt;
//    }

//    public Guid RetakeQuiz(Guid learnerId, Guid quizId)
//    {
//        var quiz = _quizEngineRepository.GetQuizById(quizId);
//        if (quiz == null)
//            throw new KeyNotFoundException($"Quiz with ID {quizId} not found.");

//        var isAllowedToAttempt = _quizEngineRepository.IsAllowedToAttemptQuiz(learnerId, quizId);
//        if (!isAllowedToAttempt)
//            throw new InvalidOperationException("You have exceeded the maximum number of attempts for this quiz.");

//        var attempt = _quizEngineRepository.CreateLearnerAttempt(learnerId, quizId);
//        return attempt.LearnerAttemptId;
//    }


//    private float CalculateQuestionScore(Guid quizQuestionId, bool isAnswerCorrect)
//    {
//        var questionType = _quizEngineRepository.GetQuestionTypeById(quizQuestionId);
//        switch (questionType)
//        {
//            case "MCQ":
//            case "T/F":
//                return isAnswerCorrect ? 1 : 0;
//            case "MSQ":
//                var options = _quizEngineRepository.GetCorrectOptionsForQuestion(quizQuestionId);
//                var correctOptionCount = options.Count();
//                return isAnswerCorrect ? 1 : (1 / (float)(2 * correctOptionCount));
//            default:
//                return 0;
//        }
//    }


//}

////private bool CheckAnswerCorrectness(List<string> selectedOptions, IEnumerable<string> correctOptions, string questionType)
////{
////    switch (questionType)
////    {
////        case "MCQ":
////        case "T/F":
////            return selectedOptions.Count == 1 && correctOptions.Contains(selectedOptions[0]);
////        case "MSQ":
////            var correctOptionsSet = new HashSet<string>(correctOptions);
////            var selectedOptionsSet = new HashSet<string>(selectedOptions);
////            return correctOptionsSet.SetEquals(selectedOptionsSet);
////        default:
////            return false;
////    }
////}

////private float CalculateQuestionScore(Guid quizQuestionId, bool isAnswerCorrect)
////{
////    var questionType = _quizEngineRepository.GetQuestionTypeById(quizQuestionId);
////    switch (questionType)
////    {
////        case "MCQ":
////        case "T/F":
////            return isAnswerCorrect ? 1 : 0;
////        case "MSQ":
////            var options = _quizEngineRepository.GetCorrectOptionsForQuestion(quizQuestionId);
////            var correctOptionCount = options.Count();
////            return isAnswerCorrect ? 1 : (1 / (float)(2 * correctOptionCount));
////        default:
////            return 0;
////    }
////}

////public void SubmitAnswer(AnswerSubmissionModel answerSubmissionModel)
////{
////    var attempt = _quizEngineRepository.GetLearnerAttemptById(answerSubmissionModel.LearnerAttemptId);
////    if (attempt == null)
////        throw new KeyNotFoundException($"Learner attempt with ID {answerSubmissionModel.LearnerAttemptId} not found.");

////    var questionType = _quizEngineRepository.GetQuestionTypeById(answerSubmissionModel.QuizQuestionId);
////    var correctOptions = _quizEngineRepository.GetCorrectOptionsForQuestion(answerSubmissionModel.QuizQuestionId);
////    var isAnswerCorrect = CheckAnswerCorrectness(answerSubmissionModel.SelectedOptions, correctOptions, questionType);

////    var learnerAnswers = answerSubmissionModel.SelectedOptions.Select(option => new LearnerAnswer
////    {
////        LearnerAttemptId = answerSubmissionModel.LearnerAttemptId,
////        QuizQuestionId = answerSubmissionModel.QuizQuestionId,
////        QuestionOptionId = _quizEngineRepository.GetQuestionOptionIdByOption(answerSubmissionModel.QuizQuestionId, option),
////        CreatedBy = "System"
////    }).ToList();

////    _quizEngineRepository.CreateLearnerAnswers(learnerAnswers);

////    var questionScore = CalculateQuestionScore(answerSubmissionModel.QuizQuestionId, isAnswerCorrect);
////    attempt.Score += questionScore;

////    _quizEngineRepository.UpdateLearnerAttempt(attempt);
////}

////public void SubmitAnswer(AnswerSubmissionModel answerSubmissionModel)
////{
////    var attempt = _quizEngineRepository.GetLearnerAttemptById(answerSubmissionModel.LearnerAttemptId);
////    if (attempt == null)
////        throw new KeyNotFoundException($"Learner attempt with ID {answerSubmissionModel.LearnerAttemptId} not found.");

////    var isAnswerCorrect = _quizEngineRepository.IsQuestionOptionCorrect(answerSubmissionModel.QuizQuestionId, answerSubmissionModel.QuestionOptionId);
////    var learnerAnswer = _quizEngineRepository.CreateLearnerAnswer(answerSubmissionModel);

////    var questionScore = CalculateQuestionScore(answerSubmissionModel.QuizQuestionId, isAnswerCorrect);
////    attempt.Score += questionScore;

////    _quizEngineRepository.UpdateLearnerAttempt(attempt);
////}