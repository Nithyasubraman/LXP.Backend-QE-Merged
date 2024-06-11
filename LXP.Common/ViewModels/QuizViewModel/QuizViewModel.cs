namespace LXP.Common.ViewModels.QuizViewModel
{
    public class QuizViewModel
    {
        public Guid QuizId { get; set; }
        public Guid CourseId { get; set; }
        public Guid TopicId { get; set; }
        public string NameOfQuiz { get; set; } = null!;
        public int Duration { get; set; }
        public int? AttemptsAllowed { get; set; }
        public int PassMark { get; set; }
        public string CreatedBy { get; set; } = "System";
        public DateTime CreatedAt { get; set; } = DateTime.UtcNow;
    }
}
