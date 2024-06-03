using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LXP.Common.ViewModels.QuizEngineViewModel
{
    public class QuestionAndUserAnswerViewModel
    {
        public Guid QuizQuestionId { get; set; }
        public string? Question { get; set; }
        public string? SelectedOption { get; set; }
        // Correct answer is intentionally omitted
    }

}