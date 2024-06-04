

//using LXP.Common.ViewModels.QuizEngineViewModel;

//namespace LXP.Core.IServices
//{
//    public interface IQuizEngineService
//    {

//        ViewQuizDetailsViewModel GetQuizById(Guid quizId);
//        IEnumerable<QEQuizQuestionViewModel> GetQuestionsForQuiz(Guid quizId);
//        Guid StartQuizAttempt(Guid learnerId, Guid quizId);
//        void SubmitAnswer(AnswerSubmissionModel answerSubmissionModel);
//        LearnerAttemptDetailsViewModel GetQuizAttemptDetails(Guid attemptId);
//        Guid RetakeQuiz(Guid learnerId, Guid quizId);

//        ViewQuizDetailsViewModel GetQuizDetailsByTopicId(Guid topicId);
//        void SubmitQuizAttempt(Guid attemptId);

//    }
//}
using LXP.Common.ViewModels.QuizEngineViewModel;


namespace LXP.Core.IServices
{
    public interface IQuizEngineService
    {
        Task<ViewQuizDetailsViewModel> GetQuizByIdAsync(Guid quizId);
        Task<IEnumerable<QEQuizQuestionViewModel>> GetQuestionsForQuizAsync(Guid quizId);
        Task<Guid> StartQuizAttemptAsync(Guid learnerId, Guid quizId);
        Task SubmitAnswerAsync(AnswerSubmissionModel answerSubmissionModel);
        Task<LearnerAttemptDetailsViewModel> GetQuizAttemptDetailsAsync(Guid attemptId);
        Task<Guid> RetakeQuizAsync(Guid learnerId, Guid quizId);
        Task<ViewQuizDetailsViewModel> GetQuizDetailsByTopicIdAsync(Guid topicId);
        Task SubmitQuizAttemptAsync(Guid attemptId);
        

    }
}





//using LXP.Common.ViewModels.QuizEngineViewModel;
//using System;
//using System.Collections.Generic;
//using System.Threading.Tasks;

//namespace LXP.Core.IServices
//{
//    public interface IQuizEngineService
//    {
//        Task<ViewQuizDetailsViewModel> GetQuizByIdAsync(Guid quizId);
//        Task<IEnumerable<QEQuizQuestionViewModel>> GetQuestionsForQuizAsync(Guid quizId);
//        Task<Guid> StartQuizAttemptAsync(Guid learnerId, Guid quizId);
//        Task SubmitAnswerAsync(AnswerSubmissionModel answerSubmissionModel);
//        Task<LearnerAttemptDetailsViewModel> GetQuizAttemptDetailsAsync(Guid attemptId);
//        Task<Guid> RetakeQuizAsync(Guid learnerId, Guid quizId);
//        Task<ViewQuizDetailsViewModel> GetQuizDetailsByTopicIdAsync(Guid topicId);
//        Task SubmitQuizAttemptAsync(Guid attemptId);
//    }
//}
