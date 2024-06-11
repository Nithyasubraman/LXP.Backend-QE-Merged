
using LXP.Common.ViewModels.QuizQuestionViewModel;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace LXP.Core.IServices
{
    public interface IQuizQuestionService
    {
        Task<Guid> AddQuestionAsync(QuizQuestionViewModel quizQuestionDto, List<QuestionOptionViewModel> options);
        Task<bool> UpdateQuestionAsync(Guid quizQuestionId, QuizQuestionViewModel quizQuestionDto, List<QuestionOptionViewModel> options);
        Task<bool> DeleteQuestionAsync(Guid quizQuestionId);
        Task<List<QuizQuestionNoViewModel>> GetAllQuestionsByQuizIdAsync(Guid quizId);
        Task<List<QuizQuestionNoViewModel>> GetAllQuestionsAsync();
        Task<QuizQuestionNoViewModel> GetQuestionByIdAsync(Guid quizQuestionId);
    }
}


