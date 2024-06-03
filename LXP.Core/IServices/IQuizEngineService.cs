using LXP.Common.ViewModels.QuizEngineViewModel;

namespace LXP.Core.IServices
{
    public interface IQuizEngineService
    {

        ViewQuizDetailsViewModel GetQuizById(Guid quizId);
        IEnumerable<QEQuizQuestionViewModel> GetQuestionsForQuiz(Guid quizId);
        Guid StartQuizAttempt(Guid learnerId, Guid quizId);
        void SubmitAnswer(AnswerSubmissionModel answerSubmissionModel);
        LearnerAttemptDetailsViewModel GetQuizAttemptDetails(Guid attemptId);
        Guid RetakeQuiz(Guid learnerId, Guid quizId);

        ViewQuizDetailsViewModel GetQuizDetailsByTopicId(Guid topicId);
        void SubmitQuizAttempt(Guid attemptId);
        // In IQuizEngineService
        IEnumerable<QuestionAndUserAnswerViewModel> GetQuestionsAndUserAnswersForAttemptWithoutCorrectAnswers(Guid attemptId);
        QuizAttemptResultViewModel GetQuizAttemptResult(Guid attemptId);

    }
}



















//using LXP.Common.ViewModels.QuizEngineViewModel;
//using System;
//using System.Collections.Generic;

//public interface IQuizEngineService
//{

//    ViewQuizDetailsViewModel GetQuizById(Guid quizId);
//    IEnumerable<QEQuizQuestionViewModel> GetQuestionsForQuiz(Guid quizId);
//    Guid StartQuizAttempt(Guid learnerId, Guid quizId);
//    void SubmitAnswer(AnswerSubmissionModel answerSubmissionModel);
//    LearnerAttemptDetailsViewModel GetQuizAttemptDetails(Guid attemptId);
//    Guid RetakeQuiz(Guid learnerId, Guid quizId);

//    ViewQuizDetailsViewModel GetQuizDetailsByTopicId(Guid topicId);
//}
