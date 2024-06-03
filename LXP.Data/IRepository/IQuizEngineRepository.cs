using LXP.Common.ViewModels.QuizEngineViewModel;
using LXP.Common.ViewModels.QuizViewModel;
using System;
using System.Collections.Generic;

namespace LXP.Data.IRepository
{
    public interface IQuizEngineRepository
    {
        ViewQuizDetailsViewModel GetQuizById(Guid quizId);
        IEnumerable<QEQuizQuestionViewModel> GetQuestionsForQuiz(Guid quizId);
        bool IsQuestionOptionCorrect(Guid quizQuestionId, Guid questionOptionId);
        string GetQuestionTypeById(Guid quizQuestionId);
        IEnumerable<string> GetCorrectOptionsForQuestion(Guid quizQuestionId);
        LearnerAttemptViewModel CreateLearnerAttempt(Guid learnerId, Guid quizId, DateTime startTime);
        LearnerAttemptDetailsViewModel GetLearnerAttemptDetailsById(Guid attemptId);
        LearnerAttemptViewModel GetLearnerAttemptById(Guid attemptId);
        void UpdateLearnerAttempt(LearnerAttemptViewModel attempt);
        bool IsAllowedToAttemptQuiz(Guid learnerId, Guid quizId);
        LearnerAnswerDTO CreateLearnerAnswer(AnswerSubmissionModel answerSubmissionModel);
        public Guid GetOptionIdByText(Guid quizQuestionId, string optionText);//new line
        ViewQuizDetailsViewModel GetQuizDetailsByTopicId(Guid topicId);
        IEnumerable<LearnerAttemptViewModel> GetLearnerAttemptsForQuiz(Guid learnerId, Guid quizId);
        IEnumerable<LearnerAnswerDTO> GetLearnerAnswersForAttempt(Guid attemptId);
        void UpdateLearnerAnswer(Guid learnerAnswerId, Guid questionOptionId);
        string GetOptionTextById(Guid optionId);
        // In IQuizEngineRepository
        IEnumerable<QuestionAndUserAnswerViewModel> GetQuestionsAndUserAnswersForAttemptWithoutCorrectAnswers(Guid attemptId);

        LearnerAttemptViewModel GetAttemptById(Guid attemptId);

    }

}



















//using LXP.Common.ViewModels.QuizEngineViewModel;

//public interface IQuizEngineRepository
//{

//    ViewQuizDetailsViewModel GetQuizById(Guid quizId);
//    IEnumerable<QEQuizQuestionViewModel> GetQuestionsForQuiz(Guid quizId);
//    bool IsQuestionOptionCorrect(Guid quizQuestionId, Guid questionOptionId);
//    string GetQuestionTypeById(Guid quizQuestionId);
//    IEnumerable<string> GetCorrectOptionsForQuestion(Guid quizQuestionId);
//    LearnerAttemptViewModel CreateLearnerAttempt(Guid learnerId, Guid quizId);
//    LearnerAttemptDetailsViewModel GetLearnerAttemptDetailsById(Guid attemptId);
//    LearnerAttemptViewModel GetLearnerAttemptById(Guid attemptId);
//    void UpdateLearnerAttempt(LearnerAttemptViewModel attempt);
//    bool IsAllowedToAttemptQuiz(Guid learnerId, Guid quizId);
//    LearnerAnswerDTO CreateLearnerAnswer(AnswerSubmissionModel answerSubmissionModel);

//    public Guid GetOptionIdByText(Guid quizQuestionId, string optionText);//new line

//    ViewQuizDetailsViewModel GetQuizDetailsByTopicId(Guid topicId);


//    //Guid GetQuestionOptionIdByOption(Guid quizQuestionId, string option);//new line 
//}
