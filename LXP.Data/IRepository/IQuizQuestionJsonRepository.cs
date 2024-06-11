using LXP.Common.Entities;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace LXP.Data.IRepository
{
    public interface IQuizQuestionJsonRepository
    {
        Task<List<QuizQuestion>> AddQuestionsAsync(List<QuizQuestion> questions);
        Task AddOptionsAsync(List<QuestionOption> questionOptions, Guid quizQuestionId);
        Task<int> GetNextQuestionNoAsync(Guid quizId);
    }
}
