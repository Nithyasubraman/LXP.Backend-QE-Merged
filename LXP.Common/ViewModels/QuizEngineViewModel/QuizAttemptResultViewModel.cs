namespace LXP.Common.ViewModels.QuizEngineViewModel
{
    public class QuizAttemptResultViewModel
    {
        public float Score { get; set; }
        public DateTime StartTime { get; set; }
        public DateTime EndTime { get; set; }
        public TimeSpan TimeTaken { get; set; }
        public bool IsPass { get; set; }
    }
}