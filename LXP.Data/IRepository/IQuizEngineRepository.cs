


using LXP.Common.ViewModels.QuizEngineViewModel;


namespace LXP.Data.IRepository
{
    public interface IQuizEngineRepository
    {
        Task<ViewQuizDetailsViewModel> GetQuizByIdAsync(Guid quizId);
        Task<IEnumerable<QEQuizQuestionViewModel>> GetQuestionsForQuizAsync(Guid quizId);
        Task<bool> IsQuestionOptionCorrectAsync(Guid quizQuestionId, Guid questionOptionId);
        Task<string> GetQuestionTypeByIdAsync(Guid quizQuestionId);
        Task<IEnumerable<string>> GetCorrectOptionsForQuestionAsync(Guid quizQuestionId);
        Task<LearnerAttemptViewModel> CreateLearnerAttemptAsync(Guid learnerId, Guid quizId, DateTime startTime);
        Task<LearnerAttemptDetailsViewModel> GetLearnerAttemptDetailsByIdAsync(Guid attemptId);
        Task<LearnerAttemptViewModel> GetLearnerAttemptByIdAsync(Guid attemptId);
        Task UpdateLearnerAttemptAsync(LearnerAttemptViewModel attempt);
        Task<bool> IsAllowedToAttemptQuizAsync(Guid learnerId, Guid quizId);
        Task<LearnerAnswerDTO> CreateLearnerAnswerAsync(AnswerSubmissionModel answerSubmissionModel);
        Task<Guid> GetOptionIdByTextAsync(Guid quizQuestionId, string optionText);
        Task<ViewQuizDetailsViewModel> GetQuizDetailsByTopicIdAsync(Guid topicId);
        Task<IEnumerable<LearnerAttemptViewModel>> GetLearnerAttemptsForQuizAsync(Guid learnerId, Guid quizId);
        Task<IEnumerable<LearnerAnswerDTO>> GetLearnerAnswersForAttemptAsync(Guid attemptId);
        Task UpdateLearnerAnswerAsync(Guid learnerAnswerId, Guid questionOptionId);
        Task<string> GetOptionTextByIdAsync(Guid optionId);
        Task<IEnumerable<string>> GetQuestionOptionsAsync(Guid quizQuestionId);
        Task<LearnerAttemptDetailsViewModel> GetLearnerAttemptDetailsForReviewAsync(Guid attemptId);


    }
}
