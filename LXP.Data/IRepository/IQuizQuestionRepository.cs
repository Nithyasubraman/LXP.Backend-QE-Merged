using LXP.Common.ViewModels.QuizQuestionViewModel;

namespace LXP.Data.IRepository
{
    public interface IQuizQuestionRepository
    {
        void DecrementQuestionNos(Guid deletedQuestionId);
        int GetNextQuestionNo(Guid quizId);
        Guid AddQuestionOption(QuestionOptionViewModel questionOptionDto, Guid quizQuestionId);
        List<QuestionOptionViewModel> GetQuestionOptionsById(Guid quizQuestionId);

        bool ValidateOptionsByQuestionType(
            string questionType,
            List<QuestionOptionViewModel> options
        );
        Task<int> GetNextQuestionNoAsync(Guid quizId);

        Task<Guid> AddQuestionAsync(
            QuizQuestionViewModel quizQuestionDto,
            List<QuestionOptionViewModel> options
        );
        Task<bool> UpdateQuestionAsync(
            Guid quizQuestionId,
            QuizQuestionViewModel quizQuestionDto,
            List<QuestionOptionViewModel> options
        );
        Task<bool> DeleteQuestionAsync(Guid quizQuestionId);
        Task<List<QuizQuestionNoViewModel>> GetAllQuestionsAsync();
        Task<List<QuizQuestionNoViewModel>> GetAllQuestionsByQuizIdAsync(Guid quizId);
        Task<QuizQuestionNoViewModel> GetQuestionByIdAsync(Guid quizQuestionId);
    }
}
